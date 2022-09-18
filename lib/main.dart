import 'package:flutter/material.dart';
import 'package:redback_mobile_app/screens/signUp.dart';
import 'package:redback_mobile_app/screens/LogIn.dart';
import 'package:redback_mobile_app/welcomePage/welcome_page.dart';
import 'package:redback_mobile_app/Utils/shared_prefs_util.dart';

Future<void> main() async {
  // access shared prefs before runApp
  WidgetsFlutterBinding.ensureInitialized();

  // initialize shared prefs
  await SharedPrefsUtil.init();

  runApp(
    MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(56, 14, 74, 1),
          primarySwatch: null),
      home: WelcomePage(title: 'Redback Operations'),
    ),
  );
}
