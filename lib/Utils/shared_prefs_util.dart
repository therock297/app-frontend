import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Shared Preferences
class SharedPrefsUtil {
  static SharedPreferences? instance;

  // keys
  static const String lastScannedBikeIDKey = "last_scanned_bike_id";

  // init method
  static Future<SharedPreferences> init() async =>
      instance = await SharedPreferences.getInstance();

  // helper methods to get/set prefs values
  static String? getLastScannedBikeId() =>
      instance?.getString(lastScannedBikeIDKey);

  static void updateLastScannedBikeID(String newVal) {
    // the QR Code text is stored as a JSON string, decode it and save the bikeId to shared prefs
    var decoded = json.decode(newVal);
    if (decoded['bikeId'] != null) {
      debugPrint("Updated shared prefs BikeID with value ${decoded['bikeId']}");
      instance?.setString(lastScannedBikeIDKey, decoded['bikeId']);
    }
  }
}
