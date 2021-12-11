// ignore: file_names
import 'package:flutter/material.dart';
import 'package:unstructured_topic_2/BusinessLogic/DataModels/BusyDepartment.dart';
import 'package:unstructured_topic_2/BusinessLogic/DataModels/PlaceRank.dart';
import 'package:unstructured_topic_2/BusinessLogic/DataModels/RankAgeVaccine.dart';
import 'package:unstructured_topic_2/BusinessLogic/DataModels/Ratio.dart';
import 'package:unstructured_topic_2/BusinessLogic/DataModels/VaccineType.dart';
import 'package:unstructured_topic_2/Screens/AnalyticsTab/Charts/InfectedTestedRatio.dart';
import 'package:unstructured_topic_2/Screens/AnalyticsTab/Charts/RankAgeCategories.dart';
import 'package:unstructured_topic_2/Screens/AnalyticsTab/Charts/RankAllPlacesWithMostVisits.dart';
import 'package:unstructured_topic_2/Screens/AnalyticsTab/Charts/RankByVaccinationType.dart';

import 'Charts/RankByBusyDepartments.dart';

class AnalyticsMain extends StatefulWidget {
  const AnalyticsMain({Key? key}) : super(key: key);


  @override
  _AnalyticsMainState createState() => _AnalyticsMainState();

}

class _AnalyticsMainState extends State<AnalyticsMain> {

  List<PlaceRank> placeRank = <PlaceRank>[];
  List<VaccineType> vaccineType = <VaccineType>[];
  BusyDepartment busyDepartment = const BusyDepartment(id: 1, percentageOfPossibleOptimization: 65.8);
  List<PlaceRank> departmentRank = <PlaceRank>[];
  Ratio ratio = const Ratio(id: 1, numTot: 121, numPos: 10);
  List<RankAgeVaccine> rankAge = <RankAgeVaccine>[];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 10.0,),
              RankAllPlacesWithMostVisits(
                placeRank: placeRank,
                text: "Rank All The Most Visited Places",
              ),
              const SizedBox(height: 10.0),
              RankAllPlacesWithMostVisits(
                placeRank: placeRank,
                text: "Rank The Most Visited Test Places",
              ),
              const SizedBox(height: 10.0),
              RankAllPlacesWithMostVisits(
                placeRank: placeRank,
                text: "Rank The Most Visited Vaccine Places",
              ),
              const SizedBox(height: 10.0,),
              RankByVaccinationType(vaccineType: vaccineType),
              const SizedBox(height: 10.0,),
              RankByBusyDepartments(
                placeRank: departmentRank,
                optimization: busyDepartment.percentageOfPossibleOptimization.toString(),
              ),
              const SizedBox(height: 10.0,),
              InfectedTestedRatio(
                  infected: ratio.numPos.toInt(),
                  notInfected: ratio.numTot.toInt() - ratio.numPos.toInt(),
                  ratio: ratio.numPos / ratio.numTot,
              ),
              const SizedBox(height: 10.0,),
             RankAgeCategories(rankAgeCategories: rankAge),
             const SizedBox(height: 10.0,),
            ],
          ),
        ),
      ),
    );
  }

}