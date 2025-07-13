import 'package:yndx_homework/core/network/backup_manager.dart';
import 'package:yndx_homework/core/network/network_client.dart';
import 'package:yndx_homework/features/transactions/domain/models/transaction.dart';
import 'package:yndx_homework/features/transactions/domain/repos/transactions_local_datasource.dart';
import 'package:yndx_homework/features/transactions/domain/repos/transactions_remote_datasource.dart';
import 'package:yndx_homework/features/transactions/domain/repos/transactions_repository.dart';
import 'package:yndx_homework/util/log.dart';

class TransactionsRepository implements ITransactionsRepository {
  final ITransactionsLocalDataSource _localDataSource;
  final ITransactionsRemoteDataSource _remoteDataSource;
  final BackupManager _backupManager;
  final NetworkClient _networkClient;

  static const String _backupCategory = 'transactions';

  TransactionsRepository(
    this._localDataSource,
    this._remoteDataSource,
    this._backupManager,
    this._networkClient,
  );

  @override
  Future<List<Transaction>> getTransactions() async {
    // First, try to sync pending operations.
    try {
      await _syncPendingOperations();

      if (await _networkClient.isConnected) {
        final remoteTransactions = await _remoteDataSource.getTransactions();
        await _localDataSource.clearTransactions();
        await _localDataSource.saveTransactions(remoteTransactions);
        return remoteTransactions;
      }
    } catch (e) {
      // Network error, fall back to local state.
      Log.error('Network error $runtimeType', error: e);
    }

    final txs = await _localDataSource.getTransactions();
    // Log.info('Get: $runtimeType, $txs');
    return txs;
  }

  @override
  Future<void> deleteTransaction(int transactionId) async {
    await _localDataSource.deleteTransaction(transactionId);

    final operation = BackupOperation<int>(
      id: transactionId.toString(),
      type: OperationType.delete,
      data: transactionId,
      timestamp: DateTime.now(),
    );

    await _backupManager.addOperation(_backupCategory, operation);

    if (await _networkClient.isConnected) {
      try {
        await _remoteDataSource.deleteTransaction(transactionId);
        await _backupManager.removeOperation(_backupCategory, operation.id);
      } catch (e) {
        Log.error('Failed to sync immediately: $runtimeType', error: e);
      }
    }
  }

  @override
  Future<void> addTransaction(Transaction transaction) async {
    // Save locally first (offline-first)
    await _localDataSource.addTransaction(transaction);

    // Add to backup for syncing
    final operation = BackupOperation<Map>(
      id: transaction.id.toString(),
      type: OperationType.create,
      data: transaction.toJson(),
      timestamp: DateTime.now(),
    );

    await _backupManager.addOperation(_backupCategory, operation);

    // Try to sync immediately if online
    if (await _networkClient.isConnected) {
      try {
        _remoteDataSource.createTransaction(transaction);
        _backupManager.removeOperation(_backupCategory, operation.id);
      } catch (e) {
        // Will sync later
        Log.error('Failed to sync immediately: $runtimeType', error: e);
      }
    }
  }

  @override
  Future<List<Transaction>> getTransactionsForPeriod(
    DateTime start,
    DateTime end,
    int accountId,
  ) async {
    try {
      await _syncPendingOperations();

      if (await _networkClient.isConnected) {
        final remoteTransactions = await _remoteDataSource
            .getTransactionsForPeriod(start, end, accountId);
        return remoteTransactions;
      }
    } catch (e) {
      Log.error('Network error: $runtimeType', error: e);
    } finally {
      // Log.info('returning daily local: $runtimeType');
    }

    final txs = await _localDataSource.getTransactionsForPeriod(start, end);
    // Log.info('PERIOD: $runtimeType, $start|$end, $txs');
    return txs;
  }

  @override
  Future<void> updateTransaction(Transaction transaction) async {
    await _localDataSource.updateTransaction(transaction);

    final operation = BackupOperation<Map>(
      id: transaction.id.toString(),
      type: OperationType.update,
      data: transaction.toJson(),
      timestamp: DateTime.now(),
    );

    await _backupManager.addOperation(_backupCategory, operation);

    if (await _networkClient.isConnected) {
      try {
        await _remoteDataSource.updateTransaction(transaction);
        await _backupManager.removeOperation(_backupCategory, operation.id);
      } catch (e) {
        Log.error('Failed to sync immediately: $runtimeType', error: e);
      }
    }
  }

  Future<void> _syncPendingOperations() async {
    if (!await _networkClient.isConnected) return;

    final pendingOperations = await _backupManager.getOperations(
      _backupCategory,
    );
    if (pendingOperations.isEmpty) return;

    try {
      // Sort operations by timestamp to maintain order
      pendingOperations.sort((a, b) => a.timestamp.compareTo(b.timestamp));

      for (final operation in pendingOperations) {
        try {
          switch (operation.type) {
            case OperationType.create:
              final transaction = Transaction.fromJson(operation.data);
              await _remoteDataSource.createTransaction(transaction);
              break;
            case OperationType.update:
              final transaction = Transaction.fromJson(operation.data);
              // Log.info(transaction.toString());
              await _remoteDataSource.updateTransaction(transaction);
              break;
            case OperationType.delete:
              await _remoteDataSource.deleteTransaction(operation.data as int);
              break;
          }

          await _backupManager.removeOperation(_backupCategory, operation.id);
        } catch (e) {
          // Skip this operation and continue with others
          Log.error(
            'Failed to sync operation [${operation.id} ${operation.type}]: $runtimeType',
            error: e,
          );
        }
      }
    } catch (e) {
      Log.error('Failed to sync operations: $runtimeType', error: e);
      rethrow;
    }
  }
}
