import 'package:flutter/material.dart';
import 'package:ParchApp/models/placesModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ParchApp/db/firebase.dart';

class RESTAPI extends ChangeNotifier {
  RESTAPI() {
    _getdatos();
  }

  List<PlaceModel> museos = [];
  List<PlaceModel> _centroscomerciales = [];
  List<PlaceModel> _lugaresrep = [];
  List<PlaceModel> _bibliotecas = [];
  List<PlaceModel> _parques = [];
  List<PlaceModel> _miradores = [];
  List<PlaceModel> _allPlaces = [];

  List<PlaceModel> _getdatos() {
    DataBase.readMuseos().forEach((QuerySnapshot snapshot) {
      snapshot.docs.forEach((QueryDocumentSnapshot doc) {
        museos.add(
          PlaceModel(
            placeTitle: doc['Nombre'],
            description: doc['Descripcion'],
            imgUrl: doc['Imagen'][0],
            locationShort: doc['Ubicacion_Short'],
          ),
        );
      });
    });
    DataBase.readcc().forEach((QuerySnapshot snapshot) {
      snapshot.docs.forEach((QueryDocumentSnapshot doc) {
        _centroscomerciales.add(
          PlaceModel(
            placeTitle: doc['Nombre'],
            description: doc['Descripcion'],
            imgUrl: doc['Imagen'][0],
            locationShort: doc['Ubicacion_Short'],
          ),
        );
      });
    });
    DataBase.readLugarRepre().forEach((QuerySnapshot snapshot) {
      snapshot.docs.forEach((QueryDocumentSnapshot doc) {
        _lugaresrep.add(
          PlaceModel(
            placeTitle: doc['Nombre'],
            description: doc['Descripcion'],
            imgUrl: doc['Imagen'][0],
            locationShort: doc['Ubicacion_Short'],
          ),
        );
      });
    });
    DataBase.readBibliotecas().forEach((QuerySnapshot snapshot) {
      snapshot.docs.forEach((QueryDocumentSnapshot doc) {
        _bibliotecas.add(
          PlaceModel(
            placeTitle: doc['Nombre'],
            description: doc['Descripcion'],
            imgUrl: doc['Imagen'][0],
            locationShort: doc['Ubicacion_Short'],
          ),
        );
      });
    });
    DataBase.readParquesRec().forEach((QuerySnapshot snapshot) {
      snapshot.docs.forEach((QueryDocumentSnapshot doc) {
        _parques.add(
          PlaceModel(
            placeTitle: doc['Nombre'],
            description: doc['Descripcion'],
            imgUrl: doc['Imagen'][0],
            locationShort: doc['Ubicacion_Short'],
          ),
        );
      });
    });
    DataBase.readMiradores().forEach((QuerySnapshot snapshot) {
      snapshot.docs.forEach((QueryDocumentSnapshot doc) {
        _miradores.add(
          PlaceModel(
            placeTitle: doc['Nombre'],
            description: doc['Descripcion'],
            imgUrl: doc['Imagen'][0],
            locationShort: doc['Ubicacion_Short'],
          ),
        );
      });
    });
    //return _museos;
  }

  List<PlaceModel> dummyFeatured = [
    PlaceModel(
      placeTitle: "CC El Tesoro",
      description:
          "El Centro Comercial El Tesoro está ubicado en el barrio de El Poblado, una de las zonas más exclusivas y turísticas de la ciudad de Medellín. Es fácilmente accesible en taxi o en transporte público. Cuenta con una amplia oferta comercial que incluye tiendas de moda, joyería, accesorios, tecnología, hogar, deportes, belleza, entre otros. También hay una gran variedad de restaurantes y cafés para todos los gustos y presupuestos. Cuenta con una zona de entretenimiento que incluye un cine, una bolera, un parque infantil y un espacio para eventos y exposiciones. Se recomienda llevar ropa y calzado cómodo para caminar, llevar protección solar si se va a estar en la terraza, y tener precaución con las pertenencias personales. ",
      imgUrl: "assets/image/Eltesoro.jpg",
      locationShort: "El Poblado, Medellín",
    ),
    PlaceModel(
      placeTitle: "CC Santafé",
      description:
          "Es un lugar muy popular entre los turistas y los locales debido a su amplia variedad de tiendas, restaurantes y actividades de entretenimiento.  además cuenta con un cine, una bolera, un parque de atracciones y un gimnasio. Es un lugar ideal para pasar una tarde o un día completo en la ciudad, especialmente para aquellos que buscan un día de compras y entretenimiento. ",
      imgUrl: "assets/image/Santafe.jpg",
      locationShort: "Ladakh, India",
    ),
    PlaceModel(
      placeTitle: "El Castillo",
      description:
          "El Museo El Castillo está ubicado en el barrio de El Poblado, una de las zonas más exclusivas y turísticas de la ciudad de Medellín. Es fácilmente accesible en taxi o en transporte público. La colección del Museo El Castillo incluye obras de artistas colombianos e internacionales de los siglos XIX y XX, así como objetos decorativos y de colección de la época en que la casa era habitada por la familia Echavarría. El Museo El Castillo ofrece visitas guiadas en español e inglés, lo que permite a los visitantes conocer más acerca de la historia de la casa y de las obras de arte que se encuentran en ella. Se recomienda reservar la visita con anticipación y llegar con tiempo suficiente para recorrer la casa con calma. También se sugiere llevar ropa cómoda y calzado adecuado para caminar.",
      imgUrl: "assets/image/Elcastillo.jpg",
      locationShort: "Cl. 9 Sur #32-269, El Poblado, Medellín",
    ),
    PlaceModel(
      placeTitle: "Casa Pedro Nel Gómez",
      description:
          "La Casa Museo Pedro Nel Gómez es un museo dedicado a la vida y obra del famoso pintor y muralista colombiano Pedro Nel Gómez. La casa-museo es un lugar de visita obligada para los amantes del arte y la cultura. El museo cuenta con una colección de pinturas, dibujos y murales, así como objetos personales del artista. La casa-museo es una muestra de la arquitectura típica de la época, con un patio central y una decoración colorida y alegre. Además, la casa está ubicada en un barrio tranquilo y pintoresco de Medellín, lo que la convierte en un lugar ideal para pasear y conocer la cultura local. ",
      imgUrl: "assets/image/pedronel.jpg",
      locationShort: " Cra 51 B #8524, Aranjuez, Medellín",
    ),
  ];

  bool showBottomDrawer = true;

  void setShowBottomDrawer(bool value) {
    this.showBottomDrawer = value;
    print("\n Bottom Scroll State : " + this.showBottomDrawer.toString());
    notifyListeners();
  }

  int _selectedPlaceModelIndex = 0;

  void setSelectedPlaceModelIndex(int index) {
    _selectedPlaceModelIndex = index;
    notifyListeners();
  }

  int getSelectedPlaceModelIndex() => _selectedPlaceModelIndex;

  Future<List<PlaceModel>> getFeaturedPlaces() async {
    await Future.delayed(Duration(milliseconds: 750));
    return dummyFeatured;
  }

  Future<List<PlaceModel>> getmuseos() async {
    await Future.delayed(Duration(milliseconds: 950));
    return museos;
  }

  Future<List<PlaceModel>> getcentroscomerciales() async {
    await Future.delayed(Duration(milliseconds: 950));
    return _centroscomerciales;
  }

  Future<List<PlaceModel>> getluagresrep() async {
    await Future.delayed(Duration(milliseconds: 950));
    return _lugaresrep;
  }

  Future<List<PlaceModel>> getbibliotecas() async {
    await Future.delayed(Duration(milliseconds: 950));
    return _bibliotecas;
  }

  Future<List<PlaceModel>> getparques() async {
    await Future.delayed(Duration(milliseconds: 950));
    return _parques;
  }

  Future<List<PlaceModel>> getmiradores() async {
    await Future.delayed(Duration(milliseconds: 950));
    return _miradores;
  }

  Future<List<PlaceModel>> getallplaces() async {
    await Future.delayed(Duration(milliseconds: 950));
    if (_allPlaces.isEmpty) {
      _allPlaces.addAll(museos);
      _allPlaces.addAll(_centroscomerciales);
      _allPlaces.addAll(_lugaresrep);
      _allPlaces.addAll(_bibliotecas);
      _allPlaces.addAll(_parques);
      _allPlaces.addAll(_miradores);
    }
    return _allPlaces;
  }
}
