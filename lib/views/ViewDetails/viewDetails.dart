import 'dart:math';
import 'package:ParchApp/utils/ViewItemProvider.dart';
import 'package:flutter/material.dart';
import 'package:ParchApp/components/rating,.dart';
import 'package:ParchApp/views/HomePage/homepage.dart';
import 'package:ParchApp/utils/restAPI.dart';
import 'package:provider/provider.dart';
import 'package:ParchApp/views/HomePage/state/homepageStateProvider.dart';
import 'package:ParchApp/models/placesModel.dart';
import 'package:ParchApp/constants/colors.dart';

class ViewDetails extends StatefulWidget {
  //PlaceModel placeModel;
  //ViewDetails({this.placeModel});

  @override
  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  int numberPackage = 0;
  RESTAPI api = RESTAPI();
  int placeModelIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData appTheme = Theme.of(context);
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(top: 16),
        child: FloatingActionButton(
          elevation: 5,
          child: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: size.height * 0.7,
              color: Colors.grey,
              child: Image(
                image: NetworkImage(context.watch<ViewItemProvider>().img),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(top: 26, left: 20, right: 20),
                height: size.height * 0.54,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.watch<ViewItemProvider>().title,
                        style: appTheme.textTheme.headline2),
                    SizedBox(height: 4),
                    Row(children: [
                      Icon(
                        Icons.location_pin,
                        size: 14,
                      ),
                      SizedBox(width: 12),
                      Container(
                        height: 17,
                        width: 280,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              context.watch<ViewItemProvider>().locshort,
                              style: appTheme.textTheme.caption,
                              softWrap: false,
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                            )),
                      ),
                    ]),
                    SizedBox(height: 12),
                    Container(
                      height: 200,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.watch<ViewItemProvider>().desc,
                                overflow: TextOverflow.fade,
                                style: appTheme.textTheme.bodyText1,
                              ),
                              SizedBox(height: 5),
                              Text(
                                "HORARIO:",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ksecond),
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                context.watch<ViewItemProvider>().hor,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ksecond),
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          )),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.perm_identity,
                              color: appTheme.highlightColor,
                              size: 32,
                            ),
                            SizedBox(width: 0),
                            Text(
                              "${context.watch<ViewItemProvider>().afl} Afluencia",
                              style: TextStyle(
                                  color: appTheme.highlightColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: appTheme.accentColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              elevation: 0,
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'PlayFair',
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              children: [
                                Text(
                                  "Ubicación",
                                  style: appTheme.textTheme.headline3,
                                ),
                                Icon(Icons.location_on)
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
