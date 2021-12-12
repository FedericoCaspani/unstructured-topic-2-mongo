import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unstructured_topic_2/BusinessLogic/API/API.dart';

import '../../constraints.dart';

class InsertVaccine extends StatefulWidget {
  const InsertVaccine({Key? key}) : super(key: key);

  @override
  _InsertVaccineState createState() => _InsertVaccineState();
}

class _InsertVaccineState extends State<InsertVaccine> {

  final TextEditingController _textController = TextEditingController();
  String? result;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.network(
                logoBarCode,
                height: 200.0,
                width: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
                'Please enter the taxCode'
            ),
            const SizedBox(height: 28,),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tax Code'
              ),
              controller: _textController,
              onSubmitted: (String value) => setState(() {
                result = value;
              }),
            ),
            const SizedBox(height: 28,),
            SizedBox(
              width: 300.0,
              child: ElevatedButton.icon(
                  label: const Text(
                    'Press here to continue',
                  ),
                  icon: const Icon(Icons.input_outlined),
                  style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      onPrimary: Colors.black,
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14
                      )
                  ),
                  onPressed: insertVaccine
              ),
            )
          ],
        ),
      ),
    );
  }

  Future insertVaccine() async {
    String res = await API.insertVaccine(result!);

    if (res == "No person") {
      await API.insertPerson(result!);
    }

    showDialog(context: context, builder: (context) => _buildPopupDialog(context, res));
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