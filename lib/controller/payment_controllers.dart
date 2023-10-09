import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class PaymentController extends GetxController {
  late TextEditingController salaryController;
  var selected = '';
  var selected2 = '';
  var isExpanded = false;
  var isExpanded1 = false;
  String selectedOption = 'Apple Pay';
  var selectedOption2 = 1;

  bool switchValue = true;
  @override
  void onInit() {
    super.onInit();
    salaryController = TextEditingController();
    salaryController.clear();
  }

  @override
  void dispose() {
    salaryController.dispose();
    super.dispose();
  }

  var selectedCatIndex = -1;
  onSelectCat(int index) {
    selectedCatIndex = index;

    update();
  }

  var selectedCatIndex2 = -1;
  onSelectCat2(int index) {
    selectedCatIndex2 = index;

    update();
  }

  var selectedCatIndex3 = 0;
  onSelectCat3(int index) {
    selectedCatIndex3 = index;

    update();
  }

 final picker = ImagePicker();
  // File? video;
  File image = File('');
  Future getImage() async {
    File _image;
    var _pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50, // <- Reduce Image quality
        maxHeight: 500, // <- reduce the image size
        maxWidth: 500);
    image = File(_pickedFile!.path);

    _image = File(_pickedFile.path);

    print("File  name: $_image");

    update();
  }
}
