import 'package:dio/dio.dart';
import 'package:yndx_homework/core/network/network_client.dart';
import 'package:yndx_homework/features/transactions/data/models/mappers.dart';
import 'package:yndx_homework/features/transactions/data/models/remote/transaction_request_dto.dart';
import 'package:yndx_homework/features/transactions/data/models/remote/transaction_response_dto.dart';
import 'package:yndx_homework/features/transactions/domain/models/transaction.dart';
import 'package:yndx_homework/features/transactions/domain/repos/transactions_remote_datasource.dart';
import 'package:yndx_homework/shared/data/mappers.dart';
import 'package:yndx_homework/util/log.dart';

class TransactionsRemoteDataSource implements ITransactionsRemoteDataSource {
  final NetworkClient _networkClient;

  TransactionsRemoteDataSource(this._networkClient);

  @override
  Future<List<Transaction>> getTransactions() async {
    try {
      final response = await _networkClient.dio.get('/transactions');
      final List<dynamic> data = response.data;
      final dtos = data.map((json) => TransactionResponseDto.fromJson(json));
      return dtos.map((e) => e.toDomain()).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<List<Transaction>> getTransactionsForPeriod(
    DateTime start,
    DateTime end,
    int accountId,
  ) async {
    try {
      final response = await _networkClient.dio.get(
        '/transactions/account/$accountId/period',
        queryParameters: {
          'start': start.toIso8601String(),
          'end': end.toIso8601String(),
        },
      );
      Log.info('$response');
      final List<dynamic> data = response.data;
      final dtos =
          data.map((json) => TransactionResponseDto.fromJson(json));
      return dtos.map((dto) => dto.toDomain()).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Transaction> createTransaction(Transaction transaction) async {
    final TransactionRequestDto dtoReq = transaction.toDto();

    try {
      final response = await _networkClient.dio.post(
        '/transactions',
        data: dtoReq.toJson(),
      );
      final dtoResp = TransactionResponseDto.fromJson(response.data);
      return dtoResp.toDomain();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Transaction> updateTransaction(Transaction transaction) async {
    final dtoReq = transaction.toDto();

    try {
      final response = await _networkClient.dio.put(
        '/transactions/${transaction.id}',
        data: dtoReq.toJson(),
      );
      final dtoResp = TransactionResponseDto.fromJson(response.data);
      return dtoResp.toDomain();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<void> deleteTransaction(int transactionId) async {
    try {
      await _networkClient.dio.delete('/transactions/$transactionId');
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(DioException e) {
    switch (e.response?.statusCode) {
      case 401:
        return Exception('Unauthorized');
      case 403:
        return Exception('Forbidden');
      case 404:
        return Exception('Not found');
      case 500:
        return Exception('Server error');
      default:
        return Exception('Network error: ${e.message}');
    }
  }
}
