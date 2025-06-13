import 'package:yndx_homework/domain/models/account.dart';

abstract interface class IAccountRepository {
  /// Fetches the user's account.
  Future<Account> getAccount();

  /// Updates the user's account
  Future<void> updateAccount(Account account);
}