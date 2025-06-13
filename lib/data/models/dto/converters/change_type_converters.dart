import 'package:json_annotation/json_annotation.dart';
import 'package:yndx_homework/domain/models/change_type.dart';

class ChangeTypeConverter implements JsonConverter<ChangeType, String> {
  const ChangeTypeConverter();

  @override
  ChangeType fromJson(String json) {
    // Delegate to enum's factory
    return ChangeType.fromJson(json);
  }

  @override
  String toJson(ChangeType object) {
    // Delegate to enum's method
    // Sends '' if 'unknown' value
    return object.toJson() ?? '';
  }
}