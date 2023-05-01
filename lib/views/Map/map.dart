import 'package:ParchApp/constants/colors.dart';
import 'package:ParchApp/theme.dart';
import 'package:map_launcher/map_launcher.dart' as ml;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

const MAPBOX_TOKEN =
    'pk.eyJ1IjoibWF0ZW9za2l4IiwiYSI6ImNsaDRheHd4cjF2Y3IzZXA3MXhiYzF3NzQifQ.nHH-TGlUZTKmWtL8TKMIBw';

const texto = "Museo el Castillo \nHorario L-V 9am- 6pm S-D 10am-5pm ";

class MapHome extends StatefulWidget {
  @override
  _MapHomeState createState() => _MapHomeState();
}

class _MapHomeState extends State<MapHome> {
  LatLng myPosition;

  Future<Position> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('error obteniendo permiso de ubicación');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  void getCurrentLocation() async {
    Position myPos = await determinePosition();
    setState(() {
      myPosition = LatLng(myPos.latitude, myPos.longitude);
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return myPosition == null
        ? Center(child: CircularProgressIndicator())
        : FlutterMap(
            options: MapOptions(
              center: myPosition,
              minZoom: 5,
              maxZoom: 25,
              zoom: 18,
            ),
            nonRotatedChildren: [
              TileLayer(
                urlTemplate:
                    'https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/{z}/{x}/{y}?access_token=$MAPBOX_TOKEN',
                additionalOptions: {
                  'accessToken': MAPBOX_TOKEN,
                  'id': 'mapbox/streets-v12',
                },
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: myPosition,
                    builder: (context) {
                      return Container(
                        height: 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: kPrimaryColor),
                        child:
                            Icon(Icons.circle, color: kAccentColor, size: 20),
                      );
                    },
                  ),
                  Marker(
                    point: LatLng(6.190459, -75.569427),
                    builder: (context) {
                      return ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              barrierColor: Colors.transparent,
                              barrierDismissible: true,
                              builder: (contex) {
                                return Align(
                                  alignment: Alignment.topCenter,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(25),
                                            bottomRight: Radius.circular(25)),
                                        color: Colors.white,
                                      ),
                                      height: 125,
                                      width: MediaQuery.of(context).size.width -
                                          10,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                Spacer(
                                                  flex: 1,
                                                ),
                                                Expanded(
                                                    child: Text(
                                                  texto,
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                  softWrap: true,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.clip,
                                                )),
                                                Spacer(
                                                  flex: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("Alta Afluencia"),
                                                    Icon(Icons.groups)
                                                  ],
                                                ),
                                                ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                kAccentColor),
                                                    onPressed: () async {
                                                      if (await ml.MapLauncher
                                                          .isMapAvailable(ml
                                                              .MapType
                                                              .google)) {
                                                        await ml.MapLauncher
                                                            .showMarker(
                                                          mapType:
                                                              ml.MapType.google,
                                                          coords: ml.Coords(
                                                              6.190306353125763,-75.5693825031254),
                                                          title:
                                                              "Museo el Castiilo",
                                                        );
                                                      }
                                                    },
                                                    child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                      height: 10,
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "Ir a Maps",
                                                          style: TextStyle(
                                                              fontSize: 8),
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            elevation: MaterialStateProperty.all<double>(0),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.only(right: 15))),
                        child: Icon(
                          Icons.place,
                          color: kAccentColor,
                          size: 40,
                        ),
                      );
                    },
                  )
                ],
              ),
            ],
          );
  }
}
