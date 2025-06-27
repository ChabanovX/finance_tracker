import 'package:yndx_homework/data/datasources/local/mappers.dart';
import 'package:yndx_homework/data/datasources/local/objectbox.dart';
import 'package:yndx_homework/domain/models/account.dart';
import 'package:yndx_homework/domain/repositories/account_repository.dart';

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