// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Q4.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatioInfected _$RatioInfectedFromJson(Map<String, dynamic> json) =>
    RatioInfected(
      id: json['id'] as int,
      numTot: (json['numTot'] as num).toDouble(),
      numPos: (json['numPos'] as num).toDouble(),
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$RatioInfectedToJson(RatioInfected instance) =>
    <String, dynamic>{
      'id': instance.id,
      'numTot': instance.numTot,
      'numPos': instance.numPos,
      'percentage': instance.percentage,
    };
