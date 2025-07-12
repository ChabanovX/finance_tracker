import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';

@freezed
abstract class Account with _$Account {
  const factory Account({
    required int id,
    required String name,
    required double balance,
    required String currency,
  }) = _Account;
}