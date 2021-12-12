// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Q5.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankAgeVaccine _$RankAgeVaccineFromJson(Map<String, dynamic> json) =>
    RankAgeVaccine(
      ageCategory: json['ageCategory'] as String,
      vaccinationRatio: (json['vaccinationRatio'] as num).toDouble(),
    );

Map<String, dynamic> _$RankAgeVaccineToJson(RankAgeVaccine instance) =>
    <String, dynamic>{
      'ageCategory': instance.ageCategory,
      'vaccinationRatio': instance.vaccinationRatio,
    };
