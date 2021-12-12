// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Q1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceRank _$PlaceRankFromJson(Map<String, dynamic> json) => PlaceRank(
      place: Place.fromJson(json['place'] ?? Place(address: "Test address 6", departments: "D2.4", entity: "Organization", gps: "25.33900/69.08821", name: "Milan Ph") as Map<String, dynamic>),
      count: json['count'] as int,
    );

Map<String, dynamic> _$PlaceRankToJson(PlaceRank instance) => <String, dynamic>{
      'place': instance.place,
      'count': instance.count,
    };

Place _$PlaceFromJson(Map<String, dynamic> json) => Place(
      address: json['address'] as String,
      departments: json["departments"] ?? "DT.1",
      entity: json['entity'] as String,
      gps: json['gps'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'address': instance.address,
      'departments': "0",
      'entity': instance.entity,
      'gps': instance.gps,
      'name': instance.name,
    };
