// ignore_for_file: avoid_print

import 'package:yndx_homework/data/datasources/mock_data.dart';
import 'package:yndx_homework/domain/models/account.dart';
import 'package:yndx_homework/domain/repositories/account_repository.dart';

class MockAccountRepository implements IAccountRepository {
  /// Duration of fake async call.
  static const _ioDuration = Duration(milliseconds: 500);

  @override
  Future<Account> getAccount() async {
    await Future.delayed(_ioDuration);
    return mockAccount;
  }

  @override
  Future<void> updateAccount(Account account) async {
    await Future.delayed(_ioDuration);
    // Just replace mock instance.
    mockAccount = account;
    print(
      'Account updated to: ${account.name} with balance ${account.balance}',
    );
  }
}
