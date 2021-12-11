import 'package:flutter/material.dart';

class VaccineType {
  final int id;
  final String vaccine;
  final int count;
  final Color color;

  const VaccineType({
    required this.id,
    required this.vaccine,
    required this.count,
    required this.color
  });
}