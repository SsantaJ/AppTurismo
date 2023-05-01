import 'package:flutter/material.dart';
//import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';

class QrScan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QrScanState();
  }
}

class QrScanState extends State<QrScan> {
  String _barcode = "";
  String qrValue = "Codigo Qr";

  void scanQr() async {
    if (await Permission.camera.request().isGranted) {
      // Escanear el código QR
      String cameraScanResult = await scanner.scan();
      setState(() {
        qrValue = cameraScanResult;
      });
    } else {
      await Permission.camera.request();
      scanQr();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lector QR flutter'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                qrValue,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/image/qr.jpg',
                height: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.amber,
                    primary: Colors.black,
                    splashFactory: InkRipple.splashFactory,
                  ),
                  onPressed: () {
                    scanQr();
                  },
                  child: const Text('Scanear el código QR.'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  _barcode,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ));
  }
}
