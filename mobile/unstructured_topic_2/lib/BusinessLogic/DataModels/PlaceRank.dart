import 'package:flutter/material.dart';
import 'package:unstructured_topic_2/BusinessLogic/DataModels/Place.dart';

class PlaceRankDataModel {
  // id is the numerical representation of the different places
  final int id;
  final int count;
  final PlaceModel place;

  // randomly generated color
  final Color color;

  PlaceRankDataModel({
    required this.id,
    required this.count,
    required this.place,
    required this.color
  });
}