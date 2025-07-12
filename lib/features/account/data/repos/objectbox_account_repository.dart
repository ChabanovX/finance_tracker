import 'package:yndx_homework/shared/data/datasources/local/mappers.dart';
import 'package:yndx_homework/shared/data/datasources/local/objectbox.dart';
import 'package:yndx_homework/features/account/domain/models/account.dart';
import 'package:yndx_homework/features/account/domain/repos/account_repository.dart';

class AccountObjectBoxRepository implements IAccountRepository {
  final ObjectBox _ob;

  AccountObjectBoxRepository(this._ob);

  @override
  Future<Account> getAccount() async {
    final first = _ob.accountBox.getAll().first;
    return first.toDomain();
  }

  @override
  Future<void> updateAccount(Account account) async {
    _ob.accountBox.put(account.toEntity());
  }
}
