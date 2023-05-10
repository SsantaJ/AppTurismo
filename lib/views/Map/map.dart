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
                                    /* gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        kAccentColor.withOpacity(0.5),
                                        ksecond.withOpacity(0.5)
                                      ],
                                    ), */
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.8),
                                        spreadRadius: 2,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                    border: Border.all(
                                        color: kAccentColor, width: 2),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(25),
                                    ),
                                    color: Colors.white,
                                  ),
                                  height: 185,
                                  width: MediaQuery.of(context).size.width - 10,
                                  child: Column(
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 14.0),
                                                child: Container(
                                                  height: 30,
                                                  width: 320,
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Text(
                                                      doc['Nombre'],
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      softWrap: false,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.fade,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 6),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 16.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.place_outlined,
                                                  color: ksecond,
                                                  size: 24.0,
                                                ),
                                                Text(
                                                  'CLASIFICACION',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ksecond),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 6),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 16.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.access_time,
                                                  size: 24.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 4.0),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Container(
                                                      height: 27,
                                                      width: 290,
                                                      child:
                                                          SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Text(
                                                          doc['Horario'],
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                          softWrap: true,
                                                          maxLines: 1,
                                                          overflow:
                                                              TextOverflow.fade,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(height: 10),
                                          if (doc['Seguridad'] == true)
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 20.0),
                                                  child: Text(
                                                    'ADVERTENCIA',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.red),
                                                  ),
                                                ),
                                                SizedBox(width: 3),
                                                Icon(
                                                  Icons.warning_amber_rounded,
                                                  color: Colors.red,
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 20.0),
                                                  child: Text(
                                                    doc['Afluencia'],
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: kComplement),
                                                  ),
                                                ),
                                                SizedBox(width: 5),
                                                Icon(Icons.groups,
                                                    color: kComplement),
                                              ]),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 16.0),
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            kAccentColor,
                                                      ),
                                                      onPressed: () async {
                                                        if (await ml.MapLauncher
                                                            .isMapAvailable(ml
                                                                .MapType
                                                                .google)) {
                                                          await ml.MapLauncher
                                                              .showMarker(
                                                            mapType: ml
                                                                .MapType.google,
                                                            coords: ml.Coords(
                                                                doc['Latitud'],
                                                                doc['Longitud']),
                                                            title:
                                                                doc['Nombre'],
                                                          );
                                                        }
                                                      },
                                                      child: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                        height: 38,
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "Ir a Maps",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
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
