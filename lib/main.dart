import 'package:flutter/material.dart';
import 'package:redback_mobile_app/OnboardingScreen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(56, 14, 74, 1),
          primarySwatch: null),
      home: OnBoarding(),
    ),
  );
}
