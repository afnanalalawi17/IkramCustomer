
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
var currentLocation = '';
  final Latitude = 0.0;
  final Longitude = 0.0;


  void GetLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,);
    Latitude == position.altitude;
    Longitude == position.longitude;
  }
  @override
  void onInit() {
    super.onInit();
    GetLocation();
  }

  @override
void dispose() {

    super.dispose();
  }

  
}
