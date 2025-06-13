import 'package:json_annotation/json_annotation.dart';

class StringToDoubleConverter implements JsonConverter<double, String> {
  const StringToDoubleConverter();

  @override
  double fromJson(String json) {
    return double.parse(json);
  }

  @override
  String toJson(double object) {
    return object.toStringAsFixed(2);
  }
}