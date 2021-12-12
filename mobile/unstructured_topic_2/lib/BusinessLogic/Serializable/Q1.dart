import 'package:json_annotation/json_annotation.dart';

part 'Q1.g.dart';

@JsonSerializable()
class PlaceRank {
  final Place place;
  final int count;

  PlaceRank({
    required this.place,
    required this.count
  });

  factory PlaceRank.fromJson(Map<String, dynamic> json) => _$PlaceRankFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceRankToJson(this);

}

@JsonSerializable()
class Place {
  final String address;
  final String departments;
  final String entity;
  final String gps;
  final String name;

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceToJson(this);

  Place({
    required this.address,
    required this.departments,
    required this.entity,
    required this.gps,
    required this.name
  });

}

