import 'package:json_annotation/json_annotation.dart';

part 'Q5.g.dart';

@JsonSerializable()
class RankAgeVaccine {
  final String ageCategory;
  final double vaccineRatio;

  RankAgeVaccine({
    required this.ageCategory,
    required this.vaccineRatio
  });

  factory RankAgeVaccine.fromJson(Map<String, dynamic> json) => _$RankAgeVaccineFromJson(json);
  Map<String, dynamic> toJson() => _$RankAgeVaccineToJson(this);

}


