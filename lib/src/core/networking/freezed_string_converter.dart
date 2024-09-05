import 'package:freezed_annotation/freezed_annotation.dart';

class StringConverter implements JsonConverter<String, dynamic> {
  const StringConverter();

  @override
  String fromJson(dynamic json) {
    return json.toString();
  }

  @override
  dynamic toJson(String object) {
    return object;
  }
}
