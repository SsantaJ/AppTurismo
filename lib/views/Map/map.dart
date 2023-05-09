import 'dart:ffi';

import 'package:ParchApp/constants/colors.dart';
import 'package:ParchApp/db/firebase.dart';
import 'package:ParchApp/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:map_launcher/map_launcher.dart' as ml;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:async/async.dart';

const MAPBOX_TOKEN =
    'pk.eyJ1IjoibWF0ZW9za2l4IiwiYSI6ImNsaDRheHd4cjF2Y3IzZXA3MXhiYzF3NzQifQ.nHH-TGlUZTKmWtL8TKMIBw';

List<Marker> markers = [];

class MapHome extends StatefulWidget {
  @override
  _MapHomeState createState() => _MapHomeState();
}

class _MapHomeState extends State<MapHome>
    with AutomaticKeepAliveClientMixin<MapHome> {
  @override
  bool get wantKeepAlive => true;
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

  Stream<List<QuerySnapshot>> getData() {
    Stream<QuerySnapshot> stream0 = DataBase.readMuseos();
    Stream<QuerySnapshot> stream1 = DataBase.readBibliotecas();
    Stream<QuerySnapshot> stream2 = DataBase.readIglesias();
    Stream<QuerySnapshot> stream3 = DataBase.readLugarRepre();
    Stream<QuerySnapshot> stream4 = DataBase.readMiradores();
    Stream<QuerySnapshot> stream5 = DataBase.readcc();
    Stream<QuerySnapshot> stream6 = DataBase.readParquesRec();
    return StreamZip([stream0, stream1, stream2, stream3, stream4, stream5]);
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
        : StreamBuilder(
            stream: getData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              List<DocumentSnapshot> documentSnapshot = [];
              List<dynamic> querySnapshot = snapshot.data.toList();
              querySnapshot.forEach((query) {
                documentSnapshot.addAll(query.docs);
              });
              documentSnapshot.forEach((doc) {
                var marker = Marker(
                  point: LatLng(doc['Latitud'], doc['Longitud']),
                  builder: (context) {
                    return ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierColor: Colors.transparent,
                          barrierDismissible: true,
                          builder: (context) {
                            return Align(
                              alignment: Alignment.topCenter,
                              child: Material(
                                color: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(25),
                                    ),
                                    color: Colors.white,
                                  ),
                                  height: 125,
                                  width: MediaQuery.of(context).size.width - 10,
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
                                                doc['Nombre'] +
                                                    "\n" +
                                                    doc['Horario'],
                                                style: TextStyle(fontSize: 10),
                                                softWrap: true,
                                                maxLines: 2,
                                                overflow: TextOverflow.clip,
                                              ),
                                            ),
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
                                            Spacer(flex: 1),
                                            Row(
                                              children: [
                                                Text(doc['Afluencia']),
                                                Icon(Icons.groups),
                                              ],
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: kAccentColor,
                                              ),
                                              onPressed: () async {
                                                if (await ml.MapLauncher
                                                    .isMapAvailable(
                                                        ml.MapType.google)) {
                                                  await ml.MapLauncher
                                                      .showMarker(
                                                    mapType: ml.MapType.google,
                                                    coords: ml.Coords(
                                                        doc['Latitud'],
                                                        doc['Longitud']),
                                                    title: doc['Nombre'],
                                                  );
                                                }
                                              },
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                height: 10,
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Ir a Maps",
                                                    style:
                                                        TextStyle(fontSize: 8),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
                );
                markers.add(marker);
              });
              return FlutterMap(
                options: MapOptions(
                  center: myPosition,
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
                  MarkerLayer(markers: markers),
                  MarkerLayer(markers: [
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
                  ]),
                ],
              );
            },
          );
  }
}
