import 'package:flutter/material.dart';
import 'package:unstructured_topic_2/BusinessLogic/API/API.dart';
import 'package:unstructured_topic_2/constraints.dart';

class ApproveVaccine extends StatefulWidget {
  const ApproveVaccine({Key? key}) : super(key: key);

  @override
  _ApproveVaccineState createState() => _ApproveVaccineState();
}

class _ApproveVaccineState extends State<ApproveVaccine> {

  final List<String> vaccines = [
    "Pfizer",
    "Sputnik V",
    "Johnson&Johnson",
    "Astrazeneca",
    "Moderna"
  ];
  int val = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              ListTile(
                title: Text(vaccines[0]),
                leading: Radio(
                value: 1,
                groupValue: val,
                onChanged: (value) {
                  setState(() {
                    val = 1;
                  });
                },
                activeColor: kPrimaryColor,
              ),
            ),
            ListTile(
              title: Text(vaccines[1]),
              leading: Radio(
                value: 2,
                groupValue: val,
                onChanged: (value) {
                  setState(() {
                    val = 2;
                  });
                },
                activeColor: kPrimaryColor,
              ),
            ),
            ListTile(
                title: Text(vaccines[2]),
                leading: Radio(
                  value: 3,
                  groupValue: val,
                  onChanged: (value) {
                    setState(() {
                      val = 3;
                    });
                  },
                  activeColor: kPrimaryColor,
                ),
            ),
          ListTile(
              title: Text(vaccines[3]),
              leading: Radio(
                value: 4,
                groupValue: val,
                onChanged: (value) {
                  setState(() {
                    val = 4;
                  });
                },
                activeColor: kPrimaryColor,
              ),
          ),
            ListTile(
              title: Text(vaccines[4]),
              leading: Radio(
                value: 5,
                groupValue: val,
                onChanged: (value) {
                  setState(() {
                    val = 5;
                  });
                },
                activeColor: kPrimaryColor,
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: 300.0,
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      onPrimary: Colors.black,
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14
                      )
                  ),
                  onPressed: () {
                    approve();
                  },
                  icon: const Icon(Icons.approval_outlined),
                  label: const Text(
                    'Approve chosen vaccine',
                  )
              ),
            ),
          ],
      )
    );
  }

  Future approve() async {

    if (val == -1) {
      return;
    }

    String? result = await API.approveVaccine(
        vaccines[val - 1],
        true
    );

    showDialog(context: context, builder: (context) => _buildPopupDialog(context, result));

  }

  Widget _buildPopupDialog(BuildContext context, String result) {
    return AlertDialog(
      title: Text(result),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }


}