import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:yndx_homework/core/network/network_client.dart';
import 'package:yndx_homework/features/account/domain/models/account.dart';
import 'package:yndx_homework/features/transactions/data/models/mappers.dart';
import 'package:yndx_homework/features/transactions/data/repos/transactions_remote_ds.dart';
import 'package:yndx_homework/features/transactions/domain/models/category.dart';
import 'package:yndx_homework/features/transactions/domain/models/transaction.dart';

class _FakeNetClient extends Mock implements NetworkClient {}

class _FakeDio extends Mock implements Dio {}

void main() {
  late _FakeNetClient _fakeNetworkClient;
  late _FakeDio _fakeDio;
  late TransactionsRemoteDataSource service;

  setUpAll(() {
    // Needed so mocktail can use any<RequestOptions>().
    registerFallbackValue(RequestOptions(path: ''));
  });

  setUp(() {
    _fakeDio = _FakeDio();
    _fakeNetworkClient = _FakeNetClient();
    service = TransactionsRemoteDataSource(_fakeNetworkClient);

    when(() => _fakeNetworkClient.dio).thenReturn(_fakeDio);
  });

  group('getTransactions()', () {
    test('Method returns valid transactions on 200.', () async {
      final List<dynamic> jsonList = [
        {
          'id': 0,
          'accountId': 42,
          'account': {
            'id': 1,
            'name': 'fake',
            'balance': '123',
            'currency': 'RUB',
          },
          'category': {
            'id': 1,
            'name': 'fake',
            'emoji': 'urg-123',
            'isIncome': true,
          },
          'categoryId': 5,
          'amount': '100',
          'transactionDate': '2025-07-25T12:34:56.000Z',
          'comment': 'null',
          'createdAt': '2025-07-25T12:34:57.000Z',
          'updatedAt': '2025-07-25T12:34:58.000Z',
        },
      ];

      when(() => _fakeDio.get('/transactions')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/transactions'),
          statusCode: 200,
          data: jsonList,
        ),
      );

      final result = await service.getTransactions();

      expect(result, isA<List<Transaction>>());
      expect(result, hasLength(1));
      expect(result.first.id, 0);
      expect(result.first.comment, 'null');
    });

    test('Throws on non-200 status code.', () async {
      final dioEx = DioException(
        requestOptions: RequestOptions(path: '/transactions'),
        response: Response(
          statusCode: 404,
          requestOptions: RequestOptions(path: '/transactions'),
        ),
      );

      when(() => _fakeDio.get('/transactions')).thenThrow(dioEx);

      expect(
        () => service.getTransactions(),
        throwsA(
          predicate(
            (e) => e is Exception && e.toString().contains('Not found'),
          ),
        ),
      );
    });
  });

  group('getTransactionsForPeriod()', () {
    test('Calls correct URL with query params and parses.', () async {
      final start = DateTime(2025, 1, 1);
      final end = DateTime(2025, 1, 31);
      final accountId = 55;
      final List<dynamic> jsonList = [
        {
          'id': 0,
          'accountId': 42,
          'account': {
            'id': 1,
            'name': 'fake',
            'balance': '123',
            'currency': 'RUB',
          },
          'category': {
            'id': 1,
            'name': 'fake',
            'emoji': 'urg-123',
            'isIncome': true,
          },
          'categoryId': 5,
          'amount': '100',
          'transactionDate': '2025-07-25T12:34:56.000Z',
          'comment': 'null',
          'createdAt': '2025-07-25T12:34:57.000Z',
          'updatedAt': '2025-07-25T12:34:58.000Z',
        },
      ];

      when(
        () => _fakeDio.get(
          '/transactions/account/$accountId/period',
          queryParameters: {
            'start': start.toIso8601String(),
            'end': end.toIso8601String(),
          },
        ),
      ).thenAnswer(
        (_) async => Response(
          data: jsonList,
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final out = await service.getTransactionsForPeriod(start, end, accountId);

      expect(out, hasLength(1));
      verify(
        () => _fakeDio.get(
          '/transactions/account/$accountId/period',
          queryParameters: {
            'start': start.toIso8601String(),
            'end': end.toIso8601String(),
          },
        ),
      ).called(1);
    });

    test('Throws on server error.', () {
      final dioEx = DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          statusCode: 500,
          requestOptions: RequestOptions(path: ''),
        ),
      );
      when(
        () =>
            _fakeDio.get(any(), queryParameters: any(named: 'queryParameters')),
      ).thenThrow(dioEx);

      expect(
        () =>
            service.getTransactionsForPeriod(DateTime.now(), DateTime.now(), 1),
        throwsA(
          predicate(
            (e) => e is Exception && e.toString().contains('Server error'),
          ),
        ),
      );
    });
  });

  group('createTransaction() / updateTransaction()', () {
    late Category cat;
    late Account acc;
    late Transaction tx;

    setUp(() {
      acc = Account(id: 10, name: 'acc', balance: 123.0, currency: 'EUR');
      cat = Category(id: 20, name: 'cat', emoji: '💰', isIncome: false);
      tx = Transaction(
        id: 7,
        account: acc,
        category: cat,
        amount: 99.9,
        transactionDate: DateTime.parse('2025-07-25T00:00:00Z'),
        comment: 'hey',
      );
    });

    test('createTransaction posts and parses DTO.', () async {
      final reqJson = tx.toDto().toJson();
      final respJson = {
        ...reqJson,
        'id': 7,
        'comment': '123',
        'createdAt': '2025-07-25T12:34:57.000Z',
        'updatedAt': '2025-07-25T12:34:57.000Z',
        'account': {
          'id': 1,
          'name': 'fake',
          'balance': '123',
          'currency': 'RUB',
        },
        'category': {
          'id': 1,
          'name': 'fake',
          'emoji': 'urg-123',
          'isIncome': true,
        },
      };

      when(() => _fakeDio.post('/transactions', data: reqJson)).thenAnswer(
        (_) async => Response(
          data: respJson,
          statusCode: 201,
          requestOptions: RequestOptions(path: '/transactions'),
        ),
      );

      final out = await service.createTransaction(tx);

      expect(out.id, 7);
      expect(out.amount, 99.9);
      verify(() => _fakeDio.post('/transactions', data: reqJson)).called(1);
    });

    test('updateTransaction puts and parses DTO.', () async {
      final reqJson = tx.toDto().toJson();
      final respJson = {
        ...reqJson,
        'id': 7,
        'comment': '123',
        'createdAt': '2025-07-25T12:34:57.000Z',
        'updatedAt': '2025-07-25T12:34:57.000Z',
        'account': {
          'id': 1,
          'name': 'fake',
          'balance': '123',
          'currency': 'RUB',
        },
        'category': {
          'id': 1,
          'name': 'fake',
          'emoji': 'urg-123',
          'isIncome': true,
        },
      };

      when(
        () => _fakeDio.put('/transactions/${tx.id}', data: reqJson),
      ).thenAnswer(
        (_) async => Response(
          data: respJson,
          statusCode: 200,
          requestOptions: RequestOptions(path: '/transactions/${tx.id}'),
        ),
      );

      final out = await service.updateTransaction(tx);

      expect(out.id, 7);
      verify(
        () => _fakeDio.put('/transactions/${tx.id}', data: reqJson),
      ).called(1);
    });

    test('createTransaction throws mapped Exception on 401.', () {
      final dioEx = DioException(
        requestOptions: RequestOptions(path: '/transactions'),
        response: Response(
          statusCode: 401,
          requestOptions: RequestOptions(path: '/transactions'),
        ),
      );
      when(
        () => _fakeDio.post(any(), data: any(named: 'data')),
      ).thenThrow(dioEx);

      expect(
        () => service.createTransaction(tx),
        throwsA(
          predicate(
            (e) => e is Exception && e.toString().contains('Unauthorized'),
          ),
        ),
      );
    });
  });

  group('deleteTransaction()', () {
    test('Calls Dio.delete with correct URL.', () async {
      when(() => _fakeDio.delete('/transactions/42')).thenAnswer(
        (_) async =>
            Response(requestOptions: RequestOptions(path: '/transactions/42')),
      );

      await service.deleteTransaction(42);

      verify(() => _fakeDio.delete('/transactions/42')).called(1);
    });
  });
}
