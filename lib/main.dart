import 'package:flutter/material.dart';
import 'package:redback_mobile_app/OnboardingScreen.dart';
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
      home: const OnBoarding(),
    ),
  );
}
