import 'package:ParchApp/utils/ViewItemProvider.dart';
import 'package:ParchApp/views/Map/map.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ParchApp/components/appbar.dart';
import 'package:ParchApp/components/featuredcard.dart';
import 'package:ParchApp/components/travelplacedart.dart';
import 'package:ParchApp/constants/colors.dart';
import 'package:ParchApp/theme.dart';
import 'package:ParchApp/views/HomePage/components/featurelist.dart';
import 'package:ParchApp/views/HomePage/state/homepageScrollListner.dart';
import 'package:ParchApp/views/HomePage/state/homepageStateProvider.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';
import 'package:ParchApp/utils/restAPI.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _mainScrollController = ScrollController();
  String qrValue = "Codigo Qr"; //variable que almacena el contenido del QR
  int indexseletec;

  String _currentView = "Popular";
  void _changeView(String viewName) {
    setState(() {
      _currentView = viewName;
    });
  }

  void scanQr() async {
    if (await Permission.camera.request().isGranted) {
      String cameraScanResult = await scanner.scan();
      setState(() {
        qrValue = cameraScanResult;
      });
    } else {}
  }

  final double _bottomBarHeight = 90;
  HomepageSrollListner _model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _model = HomepageSrollListner.initialise(_mainScrollController);
  }

  @override
  Widget build(BuildContext context) {
    HomePageStateProvider homepagestate =
        Provider.of<HomePageStateProvider>(context);

    RESTAPI restapi = Provider.of<RESTAPI>(context);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: HomeAppBar,
      body: Container(
        height: size.height,
        width: size.width,
        child: Consumer<HomePageStateProvider>(
          builder: (context, state, s) {
            return Stack(
              children: [
                SingleChildScrollView(
                  controller: _mainScrollController,
                  child: Column(
                    children: [
                      TopFeaturedList(),
                      if (homepagestate.getSelectedTopListIndex() == 0)
                        Container(
                          width: size.width,
                          height: size.height * 0.33,
                          child: StreamBuilder(
                              stream:
                                  homepagestate.getFeaturedPlaces().asStream(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData)
                                  return Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator());
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting)
                                  return Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator());

                                return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                          onTap: () {
                                            context.read<ViewItemProvider>().getItem(snapshot.data[index].url ,snapshot.data[index].titulo ,snapshot.data[index].locshort, snapshot.data[index].desc, snapshot.data[index].aflu);
                                            Navigator.pushNamed(
                                                context, "/view");
                                          },
                                          child: FeaturedCard(
                                            placeModel: snapshot.data[index],
                                          ));
                                    });
                              }),
                        ),
                      if (homepagestate.getSelectedTopListIndex() == 0)
                        Container(
                          margin: EdgeInsets.only(left: 12, right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "   Recommended",
                                style: kAppTheme.textTheme.headline5,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "View All",
                                    style: kAppTheme.textTheme.headline6,
                                  ))
                            ],
                          ),
                        ),
                      if (homepagestate.getSelectedTopListIndex() == 0)
                        Container(
                          margin: EdgeInsets.all(16),
                          child: StreamBuilder(
                              stream: homepagestate.getallplaces().asStream(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData)
                                  return Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator());
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting)
                                  return Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator());

                                return GridView.builder(
                                    itemCount: snapshot.data.length,
                                    shrinkWrap: true,
                                    primary: false,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisSpacing: 16,
                                            crossAxisSpacing: 16,
                                            crossAxisCount: 2),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                          onTap: () {
                                            context.read<ViewItemProvider>().getItem(snapshot.data[index].url ,snapshot.data[index].titulo ,snapshot.data[index].locshort, snapshot.data[index].desc, snapshot.data[index].aflu);
                                            Navigator.pushNamed(
                                                context, "/view");
                                          },
                                          child:
                                              TravelCard(snapshot.data[index]));
                                    });
                              }),
                        ),
                      if (homepagestate.getSelectedTopListIndex() == 1)
                        Container(
                          margin: EdgeInsets.all(16),
                          child: StreamBuilder(
                              stream: homepagestate.getmuseos().asStream(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData)
                                  return Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator());
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting)
                                  return Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator());

                                return GridView.builder(
                                    itemCount: snapshot.data.length,
                                    shrinkWrap: true,
                                    primary: false,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisSpacing: 16,
                                            crossAxisSpacing: 16,
                                            crossAxisCount: 2),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                          onTap: () {
                                            context.read<ViewItemProvider>().getItem(snapshot.data[index].url ,snapshot.data[index].titulo ,snapshot.data[index].locshort, snapshot.data[index].desc, snapshot.data[index].aflu);
                                            Navigator.pushNamed(
                                                context, "/view");
                                          },
                                          child:
                                              TravelCard(snapshot.data[index]));
                                    });
                              }),
                        ),
                      if (homepagestate.getSelectedTopListIndex() == 2)
                        Container(
                          margin: EdgeInsets.all(16),
                          child: StreamBuilder(
                              stream: homepagestate
                                  .getcentroscomerciales()
                                  .asStream(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData)
                                  return Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator());
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting)
                                  return Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator());

                                return GridView.builder(
                                    itemCount: snapshot.data.length,
                                    shrinkWrap: true,
                                    primary: false,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisSpacing: 16,
                                            crossAxisSpacing: 16,
                                            crossAxisCount: 2),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                          onTap: () {
                                            context.read<ViewItemProvider>().getItem(snapshot.data[index].url ,snapshot.data[index].titulo ,snapshot.data[index].locshort, snapshot.data[index].desc, snapshot.data[index].aflu);
                                            Navigator.pushNamed(
                                                context, "/view");
                                          },
                                          child:
                                              TravelCard(snapshot.data[index]));
                                    });
                              }),
                        ),
                      if (homepagestate.getSelectedTopListIndex() == 3)
                        Container(
                          margin: EdgeInsets.all(16),
                          child: StreamBuilder(
                              stream: homepagestate.getluagresrep().asStream(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData)
                                  return Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator());
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting)
                                  return Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator());

                                return GridView.builder(
                                    itemCount: snapshot.data.length,
                                    shrinkWrap: true,
                                    primary: false,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisSpacing: 16,
                                            crossAxisSpacing: 16,
                                            crossAxisCount: 2),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                          onTap: () {
                                            context.read<ViewItemProvider>().getItem(snapshot.data[index].url ,snapshot.data[index].titulo ,snapshot.data[index].locshort, snapshot.data[index].desc, snapshot.data[index].aflu);
                                            Navigator.pushNamed(
                                                context, "/view");
                                          },
                                          child:
                                              TravelCard(snapshot.data[index]));
                                    });
                              }),
                        ),
                      if (homepagestate.getSelectedTopListIndex() == 4)
                        Container(
                          margin: EdgeInsets.all(16),
                          child: StreamBuilder(
                              stream: homepagestate.getbibliotecas().asStream(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData)
                                  return Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator());
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting)
                                  return Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator());

                                return GridView.builder(
                                    itemCount: snapshot.data.length,
                                    shrinkWrap: true,
                                    primary: false,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisSpacing: 16,
                                            crossAxisSpacing: 16,
                                            crossAxisCount: 2),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                          onTap: () {
                                            context.read<ViewItemProvider>().getItem(snapshot.data[index].url ,snapshot.data[index].titulo ,snapshot.data[index].locshort, snapshot.data[index].desc, snapshot.data[index].aflu);
                                            Navigator.pushNamed(
                                                context, "/view");
                                          },
                                          child:
                                              TravelCard(snapshot.data[index]));
                                    });
                              }),
                        ),
                      if (homepagestate.getSelectedTopListIndex() == 5)
                        Container(
                          margin: EdgeInsets.all(16),
                          child: StreamBuilder(
                              stream: homepagestate.getparques().asStream(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData)
                                  return Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator());
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting)
                                  return Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator());

                                return GridView.builder(
                                    itemCount: snapshot.data.length,
                                    shrinkWrap: true,
                                    primary: false,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisSpacing: 16,
                                            crossAxisSpacing: 16,
                                            crossAxisCount: 2),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                          onTap: () {
                                            context.read<ViewItemProvider>().getItem(snapshot.data[index].url ,snapshot.data[index].titulo ,snapshot.data[index].locshort, snapshot.data[index].desc, snapshot.data[index].aflu);
                                            Navigator.pushNamed(
                                                context, "/view");
                                          },
                                          child:
                                              TravelCard(snapshot.data[index]));
                                    });
                              }),
                        ),
                      if (homepagestate.getSelectedTopListIndex() == 6)
                        Container(
                          margin: EdgeInsets.all(16),
                          child: StreamBuilder(
                              stream: homepagestate.getmiradores().asStream(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData)
                                  return Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator());
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting)
                                  return Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator());

                                return GridView.builder(
                                    itemCount: snapshot.data.length,
                                    shrinkWrap: true,
                                    primary: false,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisSpacing: 16,
                                            crossAxisSpacing: 16,
                                            crossAxisCount: 2),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                          onTap: () {
                                            context.read<ViewItemProvider>().getItem(snapshot.data[index].url ,snapshot.data[index].titulo ,snapshot.data[index].locshort, snapshot.data[index].desc, snapshot.data[index].aflu);
                                            Navigator.pushNamed(
                                                context, "/view");
                                          },
                                          child:
                                              TravelCard(snapshot.data[index]));
                                    });
                              }),
                        ),
                    ],
                  ),
                ),
                AnimatedBuilder(
                    animation: _model,
                    builder: (context, child) {
                      return Positioned(
                          bottom: _model.bottom,
                          right: 22,
                          left: 22,
                          child: Container(
                            padding: EdgeInsets.only(left: 12, right: 12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 15,
                                      color: Colors.black.withOpacity(0.4))
                                ],
                                borderRadius: BorderRadius.circular(45)),
                            height: 75,
                            alignment: Alignment.center,
                            child: Material(
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                      icon: Icon(Icons.home_rounded,
                                          size: 36,
                                          color: kAppTheme.accentColor),
                                      onPressed: () {}),
                                  IconButton(
                                      icon: Icon(Icons.near_me_outlined,
                                          size: 36, color: Color(0XFFD0E1D4)),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MapHome()),
                                        );
                                      }),
                                  IconButton(
                                      icon: Icon(Icons.qr_code_2,
                                          size: 36, color: Color(0XFFD0E1D4)),
                                      onPressed: () {
                                        scanQr();
                                      }),
                                ],
                              ),
                            ),
                          ));
                    })
              ],
            );
          },
        ),
      ),
    );
  }
}
