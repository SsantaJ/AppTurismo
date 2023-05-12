import 'package:flutter/material.dart';

import '../db/firebase.dart';

class QrProvider with ChangeNotifier{
String _doc = "";
String _col = "";
String _colname = "";

String get doc => _doc;
String get col => _col;
String get colname =>_colname;

void ObtenerDoc(String qrValue, BuildContext context){
  List<String> lect = qrValue.split("@");
  _col = lect[0];
  _colname = lect[1];
  _doc = lect[2];
  DataBase.LeerQr(_col, _colname, _doc, context);
  WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
}
}