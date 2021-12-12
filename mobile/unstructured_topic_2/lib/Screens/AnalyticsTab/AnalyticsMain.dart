import 'package:flutter/material.dart';
import 'package:unstructured_topic_2/BusinessLogic/API/API.dart';
import 'package:unstructured_topic_2/BusinessLogic/DataModels/BusyDepartment.dart';
import 'package:unstructured_topic_2/BusinessLogic/DataModels/Place.dart';
import 'package:unstructured_topic_2/BusinessLogic/DataModels/PlaceRank.dart';
import 'package:unstructured_topic_2/BusinessLogic/DataModels/RankAgeVaccine.dart';
import 'package:unstructured_topic_2/BusinessLogic/DataModels/Ratio.dart';
import 'package:unstructured_topic_2/BusinessLogic/DataModels/VaccineType.dart';
import 'package:unstructured_topic_2/BusinessLogic/Serializable/Q1.dart';
import 'package:unstructured_topic_2/BusinessLogic/Serializable/Q2.dart';
import 'package:unstructured_topic_2/BusinessLogic/Serializable/Q5.dart';
import 'package:unstructured_topic_2/Screens/AnalyticsTab/Charts/InfectedTestedRatio.dart';
import 'package:unstructured_topic_2/Screens/AnalyticsTab/Charts/RankAgeCategories.dart';
import 'package:unstructured_topic_2/Screens/AnalyticsTab/Charts/RankAllPlacesWithMostVisits.dart';
import 'package:unstructured_topic_2/Screens/AnalyticsTab/Charts/RankByVaccinationType.dart';

import 'dart:math' as math;

class AnalyticsMain extends StatefulWidget {
  const AnalyticsMain({Key? key}) : super(key: key);


  @override
  _AnalyticsMainState createState() => _AnalyticsMainState();

}

class _AnalyticsMainState extends State<AnalyticsMain> {

  List<PlaceRankDataModel> placeRankAllVisits = <PlaceRankDataModel>[];
  List<PlaceRankDataModel> placeRankTestVisits = <PlaceRankDataModel>[];
  List<PlaceRankDataModel> placeRankVaccineVisits = <PlaceRankDataModel>[];

  List<VaccineTypeModel> vaccineType = <VaccineTypeModel>[];

  BusyDepartmentModel busyDepartment = new BusyDepartmentModel(id: 0, percentageOfPossibleOptimization: 100.0);
  List<PlaceRankDataModel> departmentRank = <PlaceRankDataModel>[];

  RatioModel ratio = new RatioModel(id: 0, numTot: 0, numPos: 0, percentage: 0);

  List<RankAgeVaccineModel> rankAge = <RankAgeVaccineModel>[];

  @override
  void initState() {
    super.initState();
    API.rankAllVisits().then((result) {
      List<PlaceRankDataModel> placeRankLocal = [];
      var id = 0;
      for (PlaceRank p in result) {
        placeRankLocal.add(
          PlaceRankDataModel(
              id: id,
              count: p.count,
              place: PlaceModel(
                  address: p.place.address,
                  departments: p.place.departments,
                  entity: p.place.entity,
                  gps: p.place.gps,
                  name: p.place.name
              ),
              color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)
          )
        );
        id++;
      }
      setState(() {
        placeRankAllVisits = placeRankLocal;
      });
    });
    API.rankTestsVisits().then((result) {
      List<PlaceRankDataModel> placeRankLocal = [];
      var id = 0;
      for (PlaceRank p in result) {
        placeRankLocal.add(
            PlaceRankDataModel(
                id: id,
                count: p.count,
                place: PlaceModel(
                    address: p.place.address,
                    departments: p.place.departments,
                    entity: p.place.entity,
                    gps: p.place.gps,
                    name: p.place.name
                ),
                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)
            )
        );
        id++;
      }
      setState(() {
        placeRankTestVisits = placeRankLocal;
      });
    });
    API.rankVaccinesVisits().then((result) {
      List<PlaceRankDataModel> placeRankLocal = [];
      var id = 0;
      for (PlaceRank p in result) {
        placeRankLocal.add(
            PlaceRankDataModel(
                id: id,
                count: p.count,
                place: PlaceModel(
                    address: p.place.address,
                    departments: p.place.departments,
                    entity: p.place.entity,
                    gps: p.place.gps,
                    name: p.place.name
                ),
                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)
            )
        );
        id++;
      }
      setState(() {
        placeRankVaccineVisits = placeRankLocal;
      });
    });
    API.rankVaccineType().then((result) {
      List<VaccineTypeModel> vaccineModelLocal = [];
      var id = 0;
      for (VaccineType p in result) {
        vaccineModelLocal.add(
          VaccineTypeModel(
              id: id,
              vaccine: p.vaccine,
              count: p.count,
              color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)
          )
        );
        id++;
      }
      setState(() {
        vaccineType = vaccineModelLocal;
      });
    });
    API.busyDepartmentPercentage().then((result) {
      setState(() {
        busyDepartment = BusyDepartmentModel(
            id: result.id,
            percentageOfPossibleOptimization: result.percentageOfPossibleOptimization
        );
      });
    });
    API.rankBusyDepartments().then((result) {
      List<PlaceRankDataModel> placeRankLocal = [];
      var id = 0;
      for (PlaceRank p in result) {
        placeRankLocal.add(
            PlaceRankDataModel(
                id: id,
                count: p.count,
                place: PlaceModel(
                    address: p.place.address,
                    departments: p.place.departments,
                    entity: p.place.entity,
                    gps: p.place.gps,
                    name: p.place.name
                ),
                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)
            )
        );
        id++;
        if (id == 5) {
          break;
        }
      }
      setState(() {
        departmentRank = placeRankLocal;
      });
    });
    API.ratioInfectedHealth(DateTime.now()).then((result) {
      setState(() {
        ratio = RatioModel(
            id: result.id,
            numTot: result.numTot,
            numPos: result.numPos,
            percentage: result.percentage
        );
      });
    });
    API.rankByAgeVaccines().then((result) {
      List<RankAgeVaccineModel> rankAgeLocal = [];
      var id = 0;
      for (RankAgeVaccine p in result) {
        rankAgeLocal.add(
          RankAgeVaccineModel(
              id: id,
              ageCategory: p.ageCategory,
              vaccineRatio: p.vaccinationRatio,
              color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)
          )
        );
        id++;
      }
      setState(() {
        rankAge = rankAgeLocal;
      });
    });
  }

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
                placeRank: placeRankAllVisits,
                text: "Rank All The Most Visited Places",
                maxY: 20,
              ),
              const SizedBox(height: 10.0),
              RankAllPlacesWithMostVisits(
                placeRank: placeRankTestVisits,
                text: "Rank The Most Visited Test Places",
                maxY: 10,
              ),
              const SizedBox(height: 10.0),
              RankAllPlacesWithMostVisits(
                placeRank: placeRankVaccineVisits,
                text: "Rank The Most Visited Vaccine Places",
                maxY: 10
              ),
              const SizedBox(height: 10.0,),
              RankByVaccinationType(vaccineType: vaccineType),
              const SizedBox(height: 10.0,),
              RankAllPlacesWithMostVisits(
                placeRank: departmentRank,
                text: "Department optimization: " + busyDepartment.percentageOfPossibleOptimization.toString().substring(0, 3) + '%',
                maxY: 5,
              ),
              const SizedBox(height: 10.0,),
              InfectedTestedRatio(
                  infected: ratio.numPos.toInt(),
                  notInfected: ratio.numTot.toInt() - ratio.numPos.toInt(),
                  ratio: ratio.percentage
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