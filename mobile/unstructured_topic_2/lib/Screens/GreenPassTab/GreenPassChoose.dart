import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../constraints.dart';

class GreenPassChoose extends StatefulWidget {

  @override
  _GreenPassChooseState createState() => _GreenPassChooseState();

}


class _GreenPassChooseState extends State<GreenPassChoose> {
  String? scanResult;

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
                    scanBarCode(1);
                  },
                  icon: const Icon(Icons.receipt_long_outlined),
                  label: const Text(
                    'Vaccine Green Pass',
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
                    scanBarCode(2);
                  },
                  icon: const Icon(Icons.medical_services_outlined),
                  label: const Text(
                    'Test Green Pass',
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future scanBarCode(int choice) async {
    try {
      final scanResult = await FlutterBarcodeScanner.scanBarcode(
          "#FF6666", // the line that shows the process of scanning
          "Cancel",
          false,
          ScanMode.BARCODE
      );
      if (!mounted) return;

      setState(() => this.scanResult = scanResult);

    } on PlatformException {
      scanResult = "Failed to get platform version";
    }

    if (choice == 1) {
      // TODO: check green pass vacc
    } else {
      // TODO: check green pass test
    }

  }

}