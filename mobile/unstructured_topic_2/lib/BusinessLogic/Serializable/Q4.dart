

import 'package:json_annotation/json_annotation.dart';

part 'Q4.g.dart';


@JsonSerializable()
class RatioInfected {
  final int id;
  final double numTot;
  final double numPos;
  final double percentage;

  RatioInfected({
    required this.id,
    required this.numTot,
    required this.numPos,
    required this.percentage
  });

  factory RatioInfected.fromJson(Map<String, dynamic> json) => _$RatioInfectedFromJson(json);
  Map<String, dynamic> toJson() => _$RatioInfectedToJson(this);

}