import 'package:flutter/material.dart';
import 'package:unstructured_topic_2/BusinessLogic/API/API.dart';

import '../../constraints.dart';

class InsertTest extends StatefulWidget {
  const InsertTest({Key? key}) : super(key: key);

  @override
  _InsertTestState createState() => _InsertTestState();
}

class _InsertTestState extends State<InsertTest> {

  final TextEditingController _textController = TextEditingController();
  String? result;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
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
    String res = await API.insertTest(result!);

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