import 'package:ParchApp/firebase_options.dart';
import 'package:ParchApp/utils/ViewItemProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ParchApp/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ParchApp/views/HomePage/state/homepageStateProvider.dart';
import './constants/constants.dart';
import './theme.dart';
import 'package:ParchApp/utils/restAPI.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext csontext) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageStateProvider()),
        ChangeNotifierProvider(create: (_) => ViewItemProvider()),
        ChangeNotifierProvider(create: (_) => RESTAPI())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kHomePageTitle,
        theme: kAppTheme,
        initialRoute: AppRoutes.ROUTE_Initial,
        onGenerateRoute: AppRoutes.generateRoutes,
      ),
    );
  }
}
