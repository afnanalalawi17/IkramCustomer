import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class RequsetBenfitController extends GetxController {
  final List<String> one = ['زواج', 'عشاء', 'غداء', 'فطور', 'عزاء'];int counter = 0;

  
List multipleSelected = [];
 List<String> Selected =[];
  
  List checkListItems = [
    {
      "id": 0,
      "value": false,
      "title": "وجبة",
    },
    {
      "id": 1,
      "value": false,
      "title": "فواكه",
    },
    {
      "id": 2,
      "value": false,
      "title": "خضروات",
    },
    {
      "id": 3,
      "value": false,
      "title": "حلويات",
    },
    {
      "id": 4,
      "value": false,
      "title": "تمر",
    },
    {
      "id": 5,
      "value": false,
      "title": "ماء",
    },
    {
      "id": 6,
      "value": false,
      "title": "معجنات",
    },
  ];
  var oneValue = '';
  var selected = '';
  var selected2 = '';
  String select2 = '';
  var oneValue2 = '';

  String select = '';
    CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
var   selectDay = '';
var   selectTime = '';
  late TextEditingController nameController ,phoneController  ;

  void onClickRadioButton(value) {
    print(value);
    select = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
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
  }

  var selectedCatIndex;
  onSelectCat(int index) {
    selectedCatIndex = index;
    
    update();
  }
  
}
