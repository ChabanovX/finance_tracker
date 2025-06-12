import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_type.freezed.dart';

@freezed
sealed class ChangeType with _$ChangeType {
  // Represents "CREATION" state from the API
  const factory ChangeType.creation() = Creation;

  // Represents "MODIDICATION" state from the API
  const factory ChangeType.modification() = Modification;
}