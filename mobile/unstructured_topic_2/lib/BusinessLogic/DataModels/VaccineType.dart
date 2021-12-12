import 'package:flutter/material.dart';

class VaccineTypeModel {
  final int id;
  final String vaccine;
  final int count;
  final Color color;

  const VaccineTypeModel({
    required this.id,
    required this.vaccine,
    required this.count,
    required this.color
  });
}