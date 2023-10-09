
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> LoginFormKey = GlobalKey<FormState>(); // Form
  late TextEditingController phoneController;
  


   var phone = '';
   bool enanble = false;
  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    phoneController.clear();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

   String? validateMobile(String value) {
    if (value.isEmpty) {
      return "الرجاء ادخال رقم الجوال";
    } else if (value.length > 10) {
      return "الرجاء ادخال رقم جوال صحيح";
    }
    return null;
  }

}
