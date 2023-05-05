import 'package:flutter/material.dart';
import 'package:ParchApp/models/placesModel.dart';

class RESTAPI extends ChangeNotifier {
  List<PlaceModel> dummyFeatured = [
    PlaceModel(
      placeTitle: "CC El Tesoro",
      description:
          "El Centro Comercial El Tesoro está ubicado en el barrio de El Poblado, una de las zonas más exclusivas y turísticas de la ciudad de Medellín. Es fácilmente accesible en taxi o en transporte público. Cuenta con una amplia oferta comercial que incluye tiendas de moda, joyería, accesorios, tecnología, hogar, deportes, belleza, entre otros. También hay una gran variedad de restaurantes y cafés para todos los gustos y presupuestos. Cuenta con una zona de entretenimiento que incluye un cine, una bolera, un parque infantil y un espacio para eventos y exposiciones. Se recomienda llevar ropa y calzado cómodo para caminar, llevar protección solar si se va a estar en la terraza, y tener precaución con las pertenencias personales. ",
      imgUrl: "assets/image/Santafe.jpg",
      locationShort: "El Poblado, Medellín",
    ),
    PlaceModel(
      placeTitle: "CC Santafé",
      description:
          "Enjoy your winter vacation with warmth and amazing sightseeing on the mountains. Enjoy the best experience with us!",
      imgUrl: "assets/image/Eltesoro.jpg",
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

  List<PlaceModel> dummyAllPlaces = [
    PlaceModel(
      placeTitle: "Casa Pedro Nel Gómez",
      description:
          "La Casa Museo Pedro Nel Gómez es un museo dedicado a la vida y obra del famoso pintor y muralista colombiano Pedro Nel Gómez. La casa-museo es un lugar de visita obligada para los amantes del arte y la cultura. El museo cuenta con una colección de pinturas, dibujos y murales, así como objetos personales del artista. La casa-museo es una muestra de la arquitectura típica de la época, con un patio central y una decoración colorida y alegre. Además, la casa está ubicada en un barrio tranquilo y pintoresco de Medellín, lo que la convierte en un lugar ideal para pasear y conocer la cultura local. ",
      imgUrl: "assets/image/pedronel.jpg",
      locationShort: " Cra 51 B #8524, Aranjuez, Medellín",
    ),
    PlaceModel(
      placeTitle: "El Castillo",
      description:
          "El Museo El Castillo está ubicado en el barrio de El Poblado, una de las zonas más exclusivas y turísticas de la ciudad de Medellín. Es fácilmente accesible en taxi o en transporte público. La colección del Museo El Castillo incluye obras de artistas colombianos e internacionales de los siglos XIX y XX, así como objetos decorativos y de colección de la época en que la casa era habitada por la familia Echavarría. El Museo El Castillo ofrece visitas guiadas en español e inglés, lo que permite a los visitantes conocer más acerca de la historia de la casa y de las obras de arte que se encuentran en ella. Se recomienda reservar la visita con anticipación y llegar con tiempo suficiente para recorrer la casa con calma. También se sugiere llevar ropa cómoda y calzado adecuado para caminar.",
      imgUrl: "assets/image/Elcastillo.jpg",
      locationShort: "Cl. 9 Sur #32-269, El Poblado, Medellín",
    ),
    PlaceModel(
      placeTitle: "CC Santafé",
      description:
          "Enjoy your winter vacation with warmth and amazing sightseeing on the mountains. Enjoy the best experience with us!",
      imgUrl: "assets/image/Eltesoro.jpg",
      locationShort: "Ladakh, India",
    ),
    PlaceModel(
      placeTitle: "CC El Tesoro",
      description:
          "El Centro Comercial El Tesoro está ubicado en el barrio de El Poblado, una de las zonas más exclusivas y turísticas de la ciudad de Medellín. Es fácilmente accesible en taxi o en transporte público. Cuenta con una amplia oferta comercial que incluye tiendas de moda, joyería, accesorios, tecnología, hogar, deportes, belleza, entre otros. También hay una gran variedad de restaurantes y cafés para todos los gustos y presupuestos. Cuenta con una zona de entretenimiento que incluye un cine, una bolera, un parque infantil y un espacio para eventos y exposiciones. Se recomienda llevar ropa y calzado cómodo para caminar, llevar protección solar si se va a estar en la terraza, y tener precaución con las pertenencias personales. ",
      imgUrl: "assets/image/Santafe.jpg",
      locationShort: "El Poblado, Medellín",
    ),
    PlaceModel(
      placeTitle: "Northern Moutains",
      description:
          "Enjoy your winter vacation with warmth and amazing sightseeing on the mountains. Enjoy the best experience with us!",
      imgUrl: "assets/image/pic2.jpg",
      locationShort: "Honshu, Japan",
    ),
    PlaceModel(
      placeTitle: "Himalayas Mt",
      description:
          "Enjoy your winter vacation with warmth and amazing sightseeing on the mountains. Enjoy the best experience with us!",
      imgUrl: "assets/image/pic3.jpg",
      locationShort: "Ladakh, India",
    ),
    PlaceModel(
      placeTitle: "Mount Fugi",
      description:
          "Enjoy your winter vacation with warmth and amazing sightseeing on the mountains. Enjoy the best experience with us!",
      imgUrl: "assets/image/pic1.jpg",
      locationShort: "Honshu, Japan",
    ),
    PlaceModel(
      placeTitle: "Mountains",
      description:
          "Enjoy your winter vacation with warmth and amazing sightseeing on the mountains. Enjoy the best experience with us!",
      imgUrl: "assets/image/pic4.jpg",
      locationShort: "Honshu, Japan",
    ),
    PlaceModel(
      placeTitle: "Northern Moutains",
      description:
          "Enjoy your winter vacation with warmth and amazing sightseeing on the mountains. Enjoy the best experience with us!",
      imgUrl: "assets/image/pic2.jpg",
      locationShort: "Honshu, Japan",
    ),
    PlaceModel(
      placeTitle: "Himalayas Mt",
      description:
          "Enjoy your winter vacation with warmth and amazing sightseeing on the mountains. Enjoy the best experience with us!",
      imgUrl: "assets/image/pic3.jpg",
      locationShort: "Ladakh, India",
    ),
    PlaceModel(
      placeTitle: "Mount Fugi",
      description:
          "Enjoy your winter vacation with warmth and amazing sightseeing on the mountains. Enjoy the best experience with us!",
      imgUrl: "assets/image/pic1.jpg",
      locationShort: "Honshu, Japan",
    ),
    PlaceModel(
      placeTitle: "Mountains",
      description:
          "Enjoy your winter vacation with warmth and amazing sightseeing on the mountains. Enjoy the best experience with us!",
      imgUrl: "assets/image/pic4.jpg",
      locationShort: "Honshu, Japan",
    )
  ];

  List<PlaceModel> museos = [
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
    PlaceModel(
      placeTitle: "Museo3",
      description: "fmdskfmskdfs",
      imgUrl: "assets/image/pic3.jpg",
      locationShort: "Honshu, Japan",
    ),
    PlaceModel(
      placeTitle: "Museo4",
      description: "fsdfsdfgsdg",
      imgUrl: "assets/image/pic4.jpg",
      locationShort: "Honshu, Japan",
    )
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

  Future<List<PlaceModel>> getmuseos() async {
    await Future.delayed(Duration(milliseconds: 750));
    return museos;
  }

  Future<List<PlaceModel>> getFeaturedPlaces() async {
    await Future.delayed(Duration(milliseconds: 750));
    return dummyFeatured;
  }

  Future<List<PlaceModel>> getAllPlaces() async {
    await Future.delayed(Duration(milliseconds: 950));
    return dummyAllPlaces;
  }
}
