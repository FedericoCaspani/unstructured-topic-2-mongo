// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Q1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceRank _$PlaceRankFromJson(Map<String, dynamic> json) => PlaceRank(
      place: Place.fromJson(json['place'] as Map<String, dynamic>),
      count: json['count'] as int,
    );

Map<String, dynamic> _$PlaceRankToJson(PlaceRank instance) => <String, dynamic>{
      'place': instance.place,
      'count': instance.count,
    };

Place _$PlaceFromJson(Map<String, dynamic> json) => Place(
      address: json['address'] as String,
      departments: json['departments'] as String,
      entity: json['entity'] as String,
      gps: json['gps'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'address': instance.address,
      'departments': instance.departments,
      'entity': instance.entity,
      'gps': instance.gps,
      'name': instance.name,
    };
