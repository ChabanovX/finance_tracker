// lib/features/account/data/repos/account_repository.dart
import 'package:yndx_homework/core/network/network_client.dart';
import 'package:yndx_homework/features/account/domain/models/account.dart';
import 'package:yndx_homework/features/account/domain/repos/account_repository.dart';
import 'package:yndx_homework/util/log.dart';

class AccountRepository implements IAccountRepository {
  final IAccountLocalDataSource _localDataSource;
  final IAccountRemoteDataSource _remoteDataSource;
  final NetworkClient _networkClient;

  AccountRepository(
    this._localDataSource,
    this._remoteDataSource,
    this._networkClient,
  );

  @override
  Future<Account> getAccount() async {
    try {
      if (await _networkClient.isConnected) {
        final remoteAccount = await _remoteDataSource.getAccount();
        await _localDataSource.saveAccount(remoteAccount);
        await _localDataSource.setLastSyncTime(DateTime.now());
        return remoteAccount;
      }
    } catch (e) {
      Log.error('Failed to sync account: $runtimeType', error: e);
    }
    
    final localAccount = await _localDataSource.getAccount();
    if (localAccount == null) {
      throw Exception('No account data available');
    }
    return localAccount;
  }

  @override
  Future<void> updateAccount(Account account) async {
    await _localDataSource.updateAccount(account);
    
    if (await _networkClient.isConnected) {
      try {
        await _remoteDataSource.updateAccount(account);
        await _localDataSource.setLastSyncTime(DateTime.now());
      } catch (e) {
        Log.error('Failed to sync account update: $runtimeType', error: e);
      }
    }
  }
}
