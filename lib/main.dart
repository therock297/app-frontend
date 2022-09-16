import 'package:flutter/material.dart';
import 'package:redback_mobile_app/EndScreen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(56, 14, 74, 1),
          primarySwatch: null),
      home: EndScreen(),
    ),
  );
}
