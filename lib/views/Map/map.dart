import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

const MAPBOX_TOKEN =
    'pk.eyJ1IjoibWF0ZW9za2l4IiwiYSI6ImNsaDRheHd4cjF2Y3IzZXA3MXhiYzF3NzQifQ.nHH-TGlUZTKmWtL8TKMIBw';

class MapHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(40.697488, -73.979681),
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
            'id': 'mapbox.streets',
          },
        ),
      ],
    );
  }
}
