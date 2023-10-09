import 'package:ekram_customer/database/Login_Stat_Controller.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class OtpController extends GetxController {
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>(); // Form
  late TextEditingController otpController;
   final loginStat = Get.put(LoginStateController());

  var otp = '';
  final count = 0.obs;
  var codeError = false.obs;
  var timeOutTimer = false.obs;
  var enableInbut = true.obs;
  var isTimeOff = true.obs;
 bool enanble = false;
   bool isLoading = false;

  // This function will be triggered when the button is pressed
  void startLoading() async {
    
      isLoading = true;
   update();

    // Wait for 3 seconds
    // You can replace this with your own task like fetching data, proccessing images, etc
    await Future.delayed(const Duration(seconds: 3));

      isLoading = false;
    update();
  }

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
  // int startTime = 30;
  late CountdownTimerController controller;
  void onStartTimer() {
    isTimeOff.value = !isTimeOff.value;
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  void onEnd() {
    timeOutTimer.value = true;
  }

  @override
  void onInit() {
    super.onInit();
    otpController = TextEditingController();
    otpController.clear();
    onStartTimer();
  }

  
  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }
  void increment() => count.value++;
  String? validateCode(String value) {
    if (value.isEmpty) {
      return "الرجاء إدخال الكود".tr;
    }

    return null;
  }

}
