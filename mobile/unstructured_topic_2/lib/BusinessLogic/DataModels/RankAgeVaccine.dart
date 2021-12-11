import 'package:flutter/material.dart';

class RankAgeVaccine {
  final int id;
  final String ageCategory;
  final double vaccineRatio;
  final Color color;

  const RankAgeVaccine({
    required this.id,
    required this.ageCategory,
    required this.vaccineRatio,
    required this.color
  });
}