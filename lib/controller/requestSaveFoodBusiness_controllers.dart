import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection';

class RequsetSaveFoodBusinessController extends GetxController {
  final List<String> one = ['زواج', 'عشاء', 'غداء', 'فطور', 'عزاء'];int counter = 0;
final selectedIndexes = [];

  
List multipleSelected = [];
 List<String> Selected =[];
  final Set<DateTime> selectedDaysList = LinkedHashSet<DateTime>(
    equals: isSameDay,
    // hashCode: getHashCode,
  );
  
  List checkListItems = [
    {
      "id": 0,
      "value": false,
      "title": "فطور",
    },
    {
      "id": 1,
      "value": false,
      "title": "غداء",
    },
    {
      "id": 2,
      "value": false,
      "title": "عشاء",
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
  void onClickRadioButton(value) {
    print(value);
    select = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
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
