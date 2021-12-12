// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Q3.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusyDepartment _$BusyDepartmentFromJson(Map<String, dynamic> json) =>
    BusyDepartment(
      id: json['id'] as int,
      percentageOfPossibleOptimization:
          (json['percentageOfPossibleOptimization'] as num).toDouble(),
    );

Map<String, dynamic> _$BusyDepartmentToJson(BusyDepartment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'percentageOfPossibleOptimization':
          instance.percentageOfPossibleOptimization,
    };
