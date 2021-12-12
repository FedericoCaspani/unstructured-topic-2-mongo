import 'package:flutter/material.dart';

class RankAgeVaccineModel {
  final int id;
  final String ageCategory;
  final double vaccineRatio;
  final Color color;

  const RankAgeVaccineModel({
    required this.id,
    required this.ageCategory,
    required this.vaccineRatio,
    required this.color
  });
}