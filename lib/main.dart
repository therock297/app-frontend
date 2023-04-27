import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:redback_mobile_app/Registration/welcome_page.dart';
import 'package:redback_mobile_app/Utils/shared_prefs_util.dart';

Future<void> main() async {
  // access shared prefs before runApp
  WidgetsFlutterBinding.ensureInitialized();

  // initialize shared prefs
  await SharedPrefsUtil.init();

  // initialize dotenv
  // await dotenv.load(fileName: ".env");

  runApp(
    MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(56, 14, 74, 1),
          primarySwatch: null),
      home: const WelcomePage(title: 'Redback Operations'),
    ),
  );
}
