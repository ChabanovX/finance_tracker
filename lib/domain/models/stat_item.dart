import 'package:freezed_annotation/freezed_annotation.dart';

part 'stat_item.freezed.dart';

@freezed
abstract class StatItem with _$StatItem {
  const factory StatItem({
    required int categoryId,
    required String categoryName,
    required String emoji,
    required double amount,
  }) = _StatItem;
}