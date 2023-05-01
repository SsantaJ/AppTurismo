import 'package:flutter/material.dart';
import 'package:ParchApp/models/placesModel.dart';

class RESTAPI {
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

  Future<List<PlaceModel>> getFeaturedPlaces() async {
    await Future.delayed(Duration(milliseconds: 750));
    return dummyFeatured;
  }

  Future<List<PlaceModel>> getAllPlaces() async {
    await Future.delayed(Duration(milliseconds: 950));
    return dummyAllPlaces;
  }
}
