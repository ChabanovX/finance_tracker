import 'package:yndx_homework/shared/data/datasources/local/mappers.dart';
import 'package:yndx_homework/shared/data/datasources/local/objectbox.dart';
import 'package:yndx_homework/features/account/domain/models/account.dart';
import 'package:yndx_homework/features/account/domain/repos/account_repository.dart';
import 'package:yndx_homework/shared/data/datasources/local/objectbox.g.dart';
import 'package:yndx_homework/shared/data/datasources/local/sync_metadata_entity.dart';
import 'package:yndx_homework/util/log.dart';

class AccountObjectBoxRepository implements IAccountLocalDataSource {
  final ObjectBox _ob;

  AccountObjectBoxRepository(this._ob);

  @override
  Future<Account> getAccount() async {
    final accounts = _ob.accountBox.getAll();

    if (accounts.isEmpty) {
      // return a dummy account for offline usage.
      Log.info('No accounts were found in data.');
      Log.info('Using a dummy account now.');
      return Account(id: 0, name: 'Dummy', balance: 0, currency: 'EUR');
    }

    return accounts.first.toDomain();
  }

  @override
  Future<void> updateAccount(Account account) async {
    _ob.accountBox.put(account.toEntity());
  }

  @override
  Future<DateTime?> getLastSyncTime() async {
    final query =
        _ob.syncMetadataBox
            .query(SyncMetadataEntity_.key.equals('account_last_sync'))
            .build();

    try {
      final result = query.findFirst();
      return result != null ? DateTime.parse(result.value) : null;
    } finally {
      query.close();
    }
  }

  @override
  Future<void> setLastSyncTime(DateTime time) async {
    final query =
        _ob.syncMetadataBox
            .query(SyncMetadataEntity_.key.equals('account_last_sync'))
            .build();

    try {
      final existing = query.findFirst();

      if (existing != null) {
        existing.value = time.toIso8601String();
        await _ob.syncMetadataBox.putAsync(existing);
      } else {
        final newRecord =
            SyncMetadataEntity()
              ..key = 'account_last_sync'
              ..value = time.toIso8601String();
        await _ob.syncMetadataBox.putAsync(newRecord);
      }
    } finally {
      query.close();
    }
  }

  @override
  Future<void> saveAccount(Account account) async {
    await _ob.accountBox.putAsync(account.toEntity());
  }
}
