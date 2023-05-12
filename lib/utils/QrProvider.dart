import 'package:flutter/material.dart';

class QrProvider with ChangeNotifier{
String _doc = "";
String _col = "";
String _colname = "";

String get doc => _doc;
String get col => _col;
String get colname =>_colname;

void ObtenerDoc(String qrValue){
  List<String> lect = qrValue.split("@");
  _col = lect[0];
  _colname = lect[1];
  _doc = lect[2];
  print(qrValue);
  WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
}
}