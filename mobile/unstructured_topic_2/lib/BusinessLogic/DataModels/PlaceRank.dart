import 'package:flutter/material.dart';
import 'package:unstructured_topic_2/BusinessLogic/DataModels/Place.dart';

class PlaceRank {
  // id is the numerical representation of the different places
  final int id;
  final int count;
  final Place place;

  // randomly generated color
  final Color color;

  PlaceRank({
    required this.id,
    required this.count,
    required this.place,
    required this.color
  });
}