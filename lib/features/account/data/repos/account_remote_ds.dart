// lib/features/account/data/repos/account_remote_ds.dart
import 'dart:convert';

import 'package:yndx_homework/core/network/network_client.dart';
import 'package:yndx_homework/features/account/data/models/remote/account_brief_dto.dart';
import 'package:yndx_homework/features/account/data/models/remote/account_response_dto.dart';
import 'package:yndx_homework/features/account/domain/models/account.dart';
import 'package:yndx_homework/features/account/domain/repos/account_repository.dart';
import 'package:yndx_homework/shared/data/datasources/local/mappers.dart';
import 'package:yndx_homework/shared/data/mappers.dart';

class AccountRemoteDataSource implements IAccountRemoteDataSource {
  final NetworkClient _networkClient;

  AccountRemoteDataSource(this._networkClient);

  @override
  Future<Account> getAccount() async {
    final response = await _networkClient.dio.get('/accounts');
    final account =
        (jsonDecode(response.data) as List)
            .map((obj) => AccountResponseDto.fromJson(obj))
            .first;
    return account.toDomain();
  }

  @override
  Future<Account> updateAccount(Account account) async {
    final response = await _networkClient.dio.put(
      '/accounts/${account.id}',
      data: account.toDomain(),
    );
    return AccountBriefDto.fromJson(response.data).toDomain();
  }
}
