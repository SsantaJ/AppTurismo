import 'package:flutter/material.dart';

class ViewItemProvider with ChangeNotifier {
  String _img = "";
  String _title = "";
  String _locshort = "";
  String _desc = "";
  String _afl = "";
  String _hor = "";
  String _lat = "";
  String _lon = "";

  String get img => _img;
  String get title => _title;
  String get locshort => _locshort;
  String get desc => _desc;
  String get afl => _afl;
  String get hor => _hor;
  String get lat => _lat;
  String get lon => _lon;

  void getItem(String urlimg, String titulo, String lshort, String descripcion,
      String afluencia, String horario, String latitud, String longitud) {
    _img = urlimg;
    _title = titulo;
    _locshort = lshort;
    _desc = descripcion;
    _afl = afluencia;
    _hor = horario;
    _lat = latitud;
    _lon = longitud;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}
