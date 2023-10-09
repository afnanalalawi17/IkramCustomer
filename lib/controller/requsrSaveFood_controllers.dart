import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class RequsetSaveFoodController extends GetxController {
  final List<String> one = ['زواج', 'عشاء', 'غداء', 'فطور', 'عزاء'];
  final List<String> Two = [
    'جمعية إكرام لحفظ الطعام',
    'جمعية حفظ النعمة الخيرية في جدة',
    'جمعية أرزاق لحفظ النعمة بالطائف',
    'جمعية حفظ النعمة بالقنفذة'
  ];
  final GlobalKey<FormState> LoginFormKey = GlobalKey<FormState>(); // Form
  late TextEditingController anotherController, nameController, phoneController;

  var another = '';
  var oneValue = '';
  var selected = '';
  var selected2 = '';
  String select2 = '';
  var oneValue2 = '';

  String select = '';
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  var selectDay = '';
  var selectTime = '';
  void onClickRadioButton(value) {
    print(value);
    select = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    anotherController = TextEditingController();
    nameController = TextEditingController(
        text: GetStorage().read('Name').toString() == ' '
            ? ''
            : GetStorage().read('Name'));
    phoneController = TextEditingController(
        text: GetStorage().read('Phone').toString() == ' '
            ? ''
            : GetStorage().read('Phone'));
  }

  @override
void dispose() {
    super.dispose();
    anotherController.dispose();
  }

  var selectedCatIndex;
  onSelectCat(int index, value) {
    selectedCatIndex = index;
    select = value;
    update();
  }

  var selectedCatIndex2;
  onSelectCat2(int index, value) {
    selectedCatIndex2 = index;
    select2 = value;
    update();
  }
}
