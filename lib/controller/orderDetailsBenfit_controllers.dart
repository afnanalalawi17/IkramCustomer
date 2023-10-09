import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class OrderDetailsBenfitController extends GetxController {
  
  var status = 
  'تحت الاجراء';

var status1 = 1;
var status2 = 0;
var status3 = 0;
var status4 = 0;
var status5 = 0;
var status6 = 0;
 var current = 0;
 late TextEditingController rateController;
  


   var rate = '';
  @override
  void onInit() {
    super.onInit();
    rateController = TextEditingController();
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

