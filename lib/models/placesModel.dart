class PlaceModel {
  String placeTitle;
  String locationShort;
  String description;
  String imgUrl;
  String afluencia;
  String horario;
  double latitud;
  double longitud;
  bool seguridad;

  String get titulo => placeTitle;
  String get locshort => locationShort;
  String get desc => description;
  String get url => imgUrl;
  String get aflu => afluencia;
  String get hor => horario;
  double get lat => latitud;
  double get lon => longitud;
  bool get seg => seguridad;

  PlaceModel(
      {this.placeTitle,
      this.locationShort,
      this.description,
      this.imgUrl,
      this.afluencia,
      this.horario,
      this.latitud,
      this.longitud,
      this.seguridad});
}
