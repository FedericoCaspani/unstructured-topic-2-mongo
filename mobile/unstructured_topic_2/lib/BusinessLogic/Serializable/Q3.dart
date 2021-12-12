
import 'package:json_annotation/json_annotation.dart';

part 'Q3.g.dart';

@JsonSerializable()
class BusyDepartment {
  final int id;
  final double percentageOfPossibleOptimization;

  BusyDepartment({
    required this.id,
    required this.percentageOfPossibleOptimization
  });

  factory BusyDepartment.fromJson(Map<String, dynamic> json) => _$BusyDepartmentFromJson(json);
  Map<String, dynamic> toJson() => _$BusyDepartmentToJson(this);

}