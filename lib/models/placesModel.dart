class PlaceModel {
  String placeTitle;
  String locationShort;
  String description;
  String imgUrl;
  String afluencia;
  String horario;

  String get titulo => placeTitle;
  String get locshort => locationShort;
  String get desc => description;
  String get url => imgUrl;
  String get aflu => afluencia;
  String get hor => horario;

  PlaceModel(
      {this.placeTitle,
      this.locationShort,
      this.description,
      this.imgUrl,
      this.afluencia,
      this.horario});
}
