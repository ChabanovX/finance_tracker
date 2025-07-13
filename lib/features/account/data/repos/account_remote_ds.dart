import 'dart:convert';

import 'package:yndx_homework/features/account/data/models/remote/account_update_request_dto.dart';

import '/core/network/network_client.dart';
import '/features/account/data/models/mappers.dart';
import '/features/account/data/models/remote/account_brief_dto.dart';
import '/features/account/data/models/remote/account_dto.dart';
import '/features/account/domain/models/account.dart';
import '/features/account/domain/repos/account_repository.dart';
import '/shared/data/mappers.dart';
import '/util/log.dart';

class AccountRemoteDataSource implements IAccountRemoteDataSource {
  final NetworkClient _networkClient;

  AccountRemoteDataSource(this._networkClient);

  @override
  Future<Account> getAccount() async {
    final response = await _networkClient.dio.get('/accounts');

    // We only care about one account at this point.
    final jsonAccount = (response.data as List).first;
    final account = AccountDto.fromJson(jsonAccount);
    return account.toDomain();
  }

  @override
  Future<Account> updateAccount(Account account) async {
    final response = await _networkClient.dio.put(
      '/accounts/${account.id}',
      data:
          AccountUpdateRequestDto(
            name: account.name,
            balance: account.balance,
            currency: account.currency,
          ).toJson(),
    );
    return AccountBriefDto.fromJson(response.data).toDomain();
  }
}
