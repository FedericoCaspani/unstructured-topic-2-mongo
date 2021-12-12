import 'package:json_annotation/json_annotation.dart';

part 'Q5.g.dart';

@JsonSerializable()
class RankAgeVaccine {
  final String ageCategory;
  final double vaccinationRatio;

  RankAgeVaccine({
    required this.ageCategory,
    required this.vaccinationRatio
  });

  factory RankAgeVaccine.fromJson(Map<String, dynamic> json) => _$RankAgeVaccineFromJson(json);
  Map<String, dynamic> toJson() => _$RankAgeVaccineToJson(this);

}


