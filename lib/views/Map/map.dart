import 'package:ParchApp/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

const MAPBOX_TOKEN =
    'pk.eyJ1IjoibWF0ZW9za2l4IiwiYSI6ImNsaDRheHd4cjF2Y3IzZXA3MXhiYzF3NzQifQ.nHH-TGlUZTKmWtL8TKMIBw';

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
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Dialog Title"),
                                content: Text("Dialog content goes here"),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text("Close"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
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
