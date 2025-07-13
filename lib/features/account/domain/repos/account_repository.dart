import 'package:yndx_homework/features/account/domain/models/account.dart';

abstract interface class IAccountRepository {
  Future<Account> getAccount();
  Future<void> updateAccount(Account account);
}

abstract interface class IAccountRemoteDataSource {
  Future<Account> getAccount();
  Future<Account> updateAccount(Account account);
}

abstract interface class IAccountLocalDataSource {
  Future<Account?> getAccount();
  Future<void> saveAccount(Account account);
  Future<void> updateAccount(Account account);
  Future<DateTime?> getLastSyncTime();
  Future<void> setLastSyncTime(DateTime time);
}
