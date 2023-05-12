import 'package:flutter/material.dart';

class ViewItemProvider with ChangeNotifier {
  String _img = "";
  String _title = "";
  String _locshort = "";
  String _desc = "";
  String _afl = "";
  String _hor = "";
  double _lat = 0;
  double _lon = 0;
  bool _seg = true;

  String get img => _img;
  String get title => _title;
  String get locshort => _locshort;
  String get desc => _desc;
  String get afl => _afl;
  String get hor => _hor;
  double get lat => _lat;
  double get lon => _lon;
  bool get seg => _seg;

  void getItem(
      String urlimg,
      String titulo,
      String lshort,
      String descripcion,
      String afluencia,
      String horario,
      double latitud,
      double longitud,
      bool seguridad) {
    _img = urlimg;
    _title = titulo;
    _locshort = lshort;
    _desc = descripcion;
    _afl = afluencia;
    _hor = horario;
    _lat = latitud;
    _lon = longitud;
    _seg = seguridad;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}
