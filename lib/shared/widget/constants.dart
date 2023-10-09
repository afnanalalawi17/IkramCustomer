import 'package:ekram_customer/controller/bottomNavBar_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
double heightApp = Get.height;
double widthApp = Get.width;
extension ExtendedDouble on double {
  Widget get sizedHeight => SizedBox(
        height: this,
      );
  Widget get sizedWidget => SizedBox(
        width: this,
      );

}


