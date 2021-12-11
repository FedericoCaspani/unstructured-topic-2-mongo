import 'package:flutter/material.dart';
import 'package:unstructured_topic_2/Screens/InsertTab/ApproveVaccine.dart';
import 'package:unstructured_topic_2/Screens/InsertTab/CorruptLot.dart';
import 'package:unstructured_topic_2/Screens/InsertTab/InsertTest.dart';
import 'package:unstructured_topic_2/Screens/InsertTab/InsertVaccine.dart';

import '../../constraints.dart';

class InsertMain extends StatefulWidget {
  const InsertMain({Key? key}) : super(key: key);

  @override
  _InsertMainState createState() =>_InsertMainState();
}

class _InsertMainState extends State<InsertMain> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipOval(
              child: Image.network(
                logoBarCode,
                height: 300.0,
                width: 300.0,
                fit: BoxFit.cover,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const InsertVaccine())
                    );
                  },
                  icon: const Icon(Icons.receipt_long_outlined),
                  label: const Text(
                    'Insert Vaccine',
                  )
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InsertTest()
                        )
                    );
                  },
                  icon: const Icon(Icons.medical_services_outlined),
                  label: const Text(
                    'Insert Test',
                  )
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ApproveVaccine()
                      )
                    );
                  },
                  icon: const Icon(Icons.check_circle_outline),
                  label: const Text(
                    'Approve Vaccine',
                  )
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CorruptLot()
                        )
                    );
                  },
                  icon: const Icon(Icons.error_outline),
                  label: const Text(
                    'Corrupted Lot',
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }


}