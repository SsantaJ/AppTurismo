import 'package:flutter/material.dart';
import 'package:ParchApp/models/placesModel.dart';
import 'package:ParchApp/utils/restAPI.dart';

class HomePageStateProvider extends ChangeNotifier {
  bool showBottomDrawer = true;
  RESTAPI api = RESTAPI();

  void setShowBottomDrawer(bool value) {
    this.showBottomDrawer = value;
    print("\n Bottom Scroll State : " + this.showBottomDrawer.toString());
    notifyListeners();
  }

  List<String> kTopListLink = [
    'Popular',
    'Museos',
    'Centros Comerciales',
    'Lugares representativos',
    'Bibliotecas',
    'Parques',
    'Miradores',
    'Iglesias'
  ];

  Future<List<PlaceModel>> getallplaces() async {
    return await api.getallplaces();
  }

  Future<List<PlaceModel>> getmuseos() async {
    return await api.getmuseos();
  }

  Future<List<PlaceModel>> getcentroscomerciales() async {
    return await api.getcentroscomerciales();
  }

  Future<List<PlaceModel>> getluagresrep() async {
    return await api.getluagresrep();
  }

  Future<List<PlaceModel>> getbibliotecas() async {
    return await api.getbibliotecas();
  }

  Future<List<PlaceModel>> getparques() async {
    return await api.getparques();
  }

  Future<List<PlaceModel>> getmiradores() async {
    return await api.getmiradores();
  }
  Future<List<PlaceModel>> getIglesias() async {
    return await api.getIglesias();
  }

  Future<List<PlaceModel>> getFeaturedPlaces() async {
    return await api.getFeaturedPlaces();
  }

  int _selectedTopListIndex = 0;

  void setSelectedTopListIndex(int index) {
    _selectedTopListIndex = index;
    notifyListeners();
  }

  int getSelectedTopListIndex() => _selectedTopListIndex;
}
