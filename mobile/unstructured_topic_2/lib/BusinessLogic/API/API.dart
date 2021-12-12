import 'package:unstructured_topic_2/BusinessLogic/Serializable/Q1.dart';
import 'package:unstructured_topic_2/BusinessLogic/Serializable/Q2.dart';
import 'package:unstructured_topic_2/BusinessLogic/Serializable/Q3.dart';
import 'package:unstructured_topic_2/BusinessLogic/Serializable/Q4.dart';
import 'package:unstructured_topic_2/BusinessLogic/Serializable/Q5.dart';
import 'package:unstructured_topic_2/BusinessLogic/Serializable/Q6.dart';
import 'package:unstructured_topic_2/constraints.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class API {

  // Q1.1
  //api/v1/person/rank/all/visits
  static Future<List<PlaceRank>> rankAllVisits() async {
    String request = backend + '/person/rank/all/visits';

    try {
      var response = await http.get(Uri.parse(request));
      if (response.statusCode == 200) {
        List<PlaceRank> placeRank;
        placeRank = (json.decode(response.body) as List)
                    .map((i) => PlaceRank.fromJson(i))
                    .toList();
        return placeRank;
      }
    } catch (e) {
      print(e);
    }

    return [];
  }

  // Q1.2
  //api/v1/person/rank/tests/visits
  static Future<List<PlaceRank>> rankTestsVisits() async {
    String request = backend + '/person/rank/tests/visits';

    try {
      var response = await http.get(Uri.parse(request));
      if (response.statusCode == 200) {
        List<PlaceRank> placeRank;
        placeRank = (json.decode(response.body) as List)
            .map((i) => PlaceRank.fromJson(i))
            .toList();
        return placeRank;
      }
    } catch (e) {
      print(e);
    }

    return [];
  }

  // Q1.3
  //api/v1/person/rank/vaccines/visits
  static Future<List<PlaceRank>> rankVaccinesVisits() async {
    String request = backend + '/person/rank/vaccines/visits';

    try {
      var response = await http.get(Uri.parse(request));
      if (response.statusCode == 200) {
        List<PlaceRank> placeRank;
        placeRank = (json.decode(response.body) as List)
            .map((i) => PlaceRank.fromJson(i))
            .toList();
        return placeRank;
      }
    } catch (e) {
      print(e);
    }

    return [];
  }

  // Q2
  // /api/v1/person/rank/vaccines/types
  static Future<List<VaccineType>> rankVaccineType() async {
    String request = backend + '/person/rank/vaccines/types';

    try {
      var response = await http.get(Uri.parse(request));
      if (response.statusCode == 200) {
        List<VaccineType> vaccineType;
        vaccineType = (json.decode(response.body) as List)
            .map((i) => VaccineType.fromJson(i))
            .toList();
        return vaccineType;
      }
    } catch (e) {
      print(e);
    }

    return [];
  }

  // Q3.1
  // api/v1/departments/busy/percentage
  static Future<BusyDepartment> busyDepartmentPercentage() async {
    String request = backend + '/departments/busy/percentage';

    try {
      var response = await http.get(Uri.parse(request));
      if (response.statusCode == 200) {
        return BusyDepartment.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print(e);
    }

    return BusyDepartment.fromJson(json.decode('{"id": null, "percentageOfPossibleOptimization": null}'));
  }

  // Q3.2
  // api/v1/departments/busy
  static Future<List<PlaceRank>> rankBusyDepartments() async {
    String request = backend + '/departments/busy';

    try {
      var response = await http.get(Uri.parse(request));
      if (response.statusCode == 200) {
        List<PlaceRank> placeRank;
        placeRank = (json.decode(response.body) as List)
            .map((i) => PlaceRank.fromJson(i))
            .toList();
        return placeRank;
      }
    } catch (e) {
      print(e);
    }

    return [];
  }

  // Q4
  // ratio/infected/health
  static Future<RatioInfected> ratioInfectedHealth(DateTime date) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    String request = backend + '/ratio/infected/health?date=' + formatter.format(date);

    try {
      var response = await http.get(Uri.parse(request));
      if (response.statusCode == 200) {
        return RatioInfected.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print(e);
    }

    return RatioInfected.fromJson(json.decode('{"id": null, "numTot": 0, "numPos": 0, "percentage": 0}'));
  }

  // Q5
  // /person/rank/vaccines/age
  static Future<List<RankAgeVaccine>> rankByAgeVaccines() async {
    String request = backend + '/person/rank/vaccines/age';

    try {
      var response = await http.get(Uri.parse(request));
      if (response.statusCode == 200) {
        List<RankAgeVaccine> rankAgeVaccine;
        rankAgeVaccine = (json.decode(response.body) as List)
            .map((i) => RankAgeVaccine.fromJson(i))
            .toList();
        return rankAgeVaccine;
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  // Q6
  // vaccine/valid
  static Future<GreenPass> validVaccine(String taxCode) async {
    String request = backend + '/vaccine/valid?taxCode=' + taxCode;

    try {
      var response = await http.get(Uri.parse(request));
      if (response.statusCode == 200) {
        return GreenPass.fromJson(json.decode(response.body));
      }
      if (response.statusCode == 404) {
        return GreenPass.fromJson(json.decode('{"id": null, "date": "1977"}'));
      }
    } catch (e) {
      print(e);
    }

    return GreenPass.fromJson(json.decode('{"id": null, "date": "1977"}'));
  }

  // Q7
  // test/valid
  static Future<GreenPass> validTest(String taxCode) async {
    String request = backend + '/test/valid?taxCode=' + taxCode;

    try {
      var response = await http.get(Uri.parse(request));
      if (response.statusCode == 200) {
        return GreenPass.fromJson(json.decode(response.body));
      }
      if (response.statusCode == 404) {
        return GreenPass.fromJson(json.decode('{"id": null, "date": "1977"}'));
      }
    } catch (e) {
      print(e);
    }

    return GreenPass.fromJson(json.decode('{"id": null, "date": "1977"}'));
  }

  // C2
  // /vaccine/approve?vaccine=Sputnik V&approve=false
  static Future<String> approveVaccine(String vaccine, bool approve) async {

    String request = backend + '/vaccine/approve?vaccine=' + vaccine + '&approve' + approve.toString();

    try {
      var response = await http.post(Uri.parse(request));
      if (response.statusCode == 200) {
        return "Success!";
      }
      if (response.statusCode == 404) {
        return "Build failed :(";
      }
    } catch (e) {
      print(e);
    }

    return "Build failed :(";
  }

  // C3
  // /vaccine/delete/lot?lot=2
  static Future<String> deleteLot(String lot) async {

    String request = backend + '/vaccine/delete?lot=' + lot;

    try {
      var response = await http.post(Uri.parse(request));
      if (response.statusCode == 200) {
        return "Success!";
      }
      if (response.statusCode == 404) {
        return "Build failed :(";
      }
    } catch (e) {
      print(e);
    }

    return "Build failed :(";
  }


  // C1.1
  // /vaccine/insert?taxCode=1
  static Future<String> insertVaccine(String taxCode) async {

    String request = backend + '/vaccine/insert?taxCode=' + taxCode;

    try {
      var response = await http.post(Uri.parse(request));
      if (response.statusCode == 200) {
        return "Success!";
      }
      if (response.statusCode == 404) {
        return "No person";
      }
    } catch (e) {
      print(e);
    }

    return "Build failed :(";
  }

  // C1.2
  // /test/insert?taxCode=1
  static Future<String> insertTest(String taxCode) async {

    String request = backend + '/test/insert?taxCode=' + taxCode;

    try {
      var response = await http.post(Uri.parse(request));
      if (response.statusCode == 200) {
        return "Success!";
      }
      if (response.statusCode == 404) {
        return "No person";
      }
    } catch (e) {
      print(e);
    }

    return "Build failed :(";
  }

  // C1.3
  // /person/insert
  static Future<String> insertPerson(String taxCode) async {

    String request = backend + '/person/insert';

    try {
      String person =
          '{ "age": 25, "name": "Spider Jerusalem", "emergencyContact": { "email": "1@1.ru", "name": "Johny Vietnam", "relationship": "Vietnam"},"taxCode": "' + taxCode + '", "tests": [], "vaccines": [], }';
      var response = await http.post(
          Uri.parse(request),
        body: jsonEncode(
          json.decode(
            person
          )
        )
      );
      if (response.statusCode == 200) {
        return "Success!";
      }
      if (response.statusCode == 404) {
        return "No person";
      }
    } catch (e) {
      print(e);
    }

    return "Build failed :(";
  }

}