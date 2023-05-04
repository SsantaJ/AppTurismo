import 'package:flutter/material.dart';
import 'package:ParchApp/models/placesModel.dart';

class RESTAPI extends ChangeNotifier {
  List<PlaceModel> dummyFeatured = [
    PlaceModel(
      placeTitle: "Northern Moutains",
      description:
          "Enjoy your winter vacation with warmth and amazing sightseeing on the mountains. Enjoy the best experience with us!",
      imgUrl: "assets/image/pic1.jpg",
      locationShort: "Honshu, Japan",
    ),
    PlaceModel(
      placeTitle: "Himalayas Mt",
      description:
          "Enjoy your winter vacation with warmth and amazing sightseeing on the mountains. Enjoy the best experience with us!",
      imgUrl: "assets/image/pic2.jpg",
      locationShort: "Ladakh, India",
    ),
    PlaceModel(
      placeTitle: "Mount Fugi",
      description:
          "Enjoy your winter vacation with warmth and amazing sightseeing on the mountains. Enjoy the best experience with us!",
      imgUrl: "assets/image/pic3.jpg",
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

  List<PlaceModel> dummyAllPlaces = [
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
      placeTitle: "Museo1",
      description: "explicacion",
      imgUrl: "assets/image/pic3.jpg",
      locationShort: "Honshu, Japan",
    ),
    PlaceModel(
      placeTitle: "Museo2",
      description: "texxto3r24",
      imgUrl: "assets/image/pic1.jpg",
      locationShort: "Ladakh, India",
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
