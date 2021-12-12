import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:unstructured_topic_2/constraints.dart';
import 'package:http/http.dart' as http;

part 'Q2.g.dart';

@JsonSerializable()
class VaccineType {
  VaccineType({
    required this.vaccine,
    required this.count
  });

  factory VaccineType.fromJson(Map<String, dynamic> json) => _$VaccineTypeFromJson(json);
  Map<String, dynamic> toJson() => _$VaccineTypeToJson(this);

  final String vaccine;
  final int count;
}

