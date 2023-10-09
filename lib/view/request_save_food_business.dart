import 'package:ekram_customer/controller/bottomNavBar_controllers.dart';
import 'package:ekram_customer/controller/customer_controllers.dart';
import 'package:ekram_customer/controller/requestSaveFoodBusiness_controllers.dart';
import 'package:ekram_customer/controller/requsrSaveFood_controllers.dart';
import 'package:ekram_customer/shared/widget/box_Text_Field_Basic.dart';
import 'package:ekram_customer/shared/widget/box_Text_Field_Search.dart';
import 'package:ekram_customer/shared/widget/box_Text_Field_gray.dart';
import 'package:ekram_customer/shared/widget/constants.dart';
import 'package:ekram_customer/shared/widget/main_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class RequestSaveFoodBusinessView extends StatelessWidget {
  final requsetSaveFoodBussinessController =
      Get.put(RequsetSaveFoodBusinessController());
  final controller = Get.put(BottomNavBarController());

  TimeOfDay timeOfDay = TimeOfDay.now();
  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) { var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff07706D),
      appBar: AppBar(centerTitle: true,
        leadingWidth: 60,
        leading: GestureDetector(
          onTap: () {
            controller.selectedTab = 0;
            Get.offAndToNamed('/CustomTabBar');
            controller.update();
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 12),
            child: SvgPicture.asset("assets/images/arrow_back.svg"),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            "طلب حفظ نعمة",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'din-next-lt-arabic Light'),
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xff07706D),
      ),
      body: GetBuilder<RequsetSaveFoodBusinessController>(
          init: RequsetSaveFoodBusinessController(),
          initState: (_) {},
          builder: (_) {
            return Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: const BoxDecoration(
                  color: Color(0XFFF8F8F8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: Column(children: [
                  SizedBox(
                    height: heightApp * 0.02,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Color(0xffEEEEEE))),
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Column(children: [
                                    SizedBox(
                                      height: heightApp * 0.04,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 25,
                                          width: 5,
                                          decoration: BoxDecoration(
                                              color: Color(0XFFCCA750),
                                              borderRadius:
                                                  BorderRadius.circular(1)),
                                        ),
                                        SizedBox(
                                          width: widthApp * 0.02,
                                        ),
                                        Text(
                                          'وقت الطعام',
                                          style: TextStyle(
                                              color: Color(0XFFCCA750),
                                              fontSize: 15,
                                              fontFamily:
                                                  'din-next-lt-arabic Light'),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.02,
                                    ),
                                    Container(
                                        height: 54,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xffEEEEEE))),
                                        child: ListView.separated(
                                          padding: EdgeInsets.only(
                                              left: 20, right: 20),
                                          separatorBuilder: (context, index) {
                                            return SizedBox(
                                              width: widthApp * 0.08,
                                            );
                                          },
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (_, index) {
                                            return Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Checkbox(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  value:
                                                      requsetSaveFoodBussinessController
                                                          .selectedIndexes
                                                          .contains(index),
                                                  onChanged: (value) {
                                                    if (requsetSaveFoodBussinessController
                                                        .selectedIndexes
                                                        .contains(index)) {
                                                      requsetSaveFoodBussinessController
                                                          .selectedIndexes
                                                          .remove(
                                                              index); // unselect
                                                    } else {
                                                      requsetSaveFoodBussinessController
                                                          .selectedIndexes
                                                          .add(index); // select
                                                    }
                                                    requsetSaveFoodBussinessController
                                                        .update();
                                                  },
                                                  checkColor: Colors.white,
                                                  activeColor:
                                                      Color(0XFFCCA750),
                                                ),
                                                Text(
                                                    "${requsetSaveFoodBussinessController.checkListItems[index]['title']}",
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontFamily:
                                                          'din-next-lt-arabic light',
                                                      color: requsetSaveFoodBussinessController
                                                              .selectedIndexes
                                                              .contains(
                                                                  requsetSaveFoodBussinessController
                                                                          .checkListItems[
                                                                      index])
                                                          ? Color(0XFFCCA750)
                                                          : Colors.black,
                                                    )),
                                              ],
                                            );
                                          },
                                          itemCount:
                                              requsetSaveFoodBussinessController
                                                  .checkListItems.length,
                                        )),
                                    SizedBox(
                                      height: heightApp * 0.02,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 25,
                                          width: 5,
                                          decoration: BoxDecoration(
                                              color: Color(0XFFCCA750),
                                              borderRadius:
                                                  BorderRadius.circular(1)),
                                        ),
                                        SizedBox(
                                          width: widthApp * 0.02,
                                        ),
                                        Text(
                                          'تاريخ تسليم النعمة',
                                          style: TextStyle(
                                              color: Color(0XFFCCA750),
                                              fontSize: 15,
                                              fontFamily:
                                                  'din-next-lt-arabic Light'),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.02,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            backgroundColor: Color(0XFFF8F8F8),
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                topRight: Radius.circular(10.0),
                                              ),
                                            ),
                                            builder: (BuildContext context) {
                                              return GetBuilder<
                                                      RequsetSaveFoodBusinessController>(
                                                  init:
                                                      RequsetSaveFoodBusinessController(),
                                                  initState: (_) {},
                                                  builder: (_) {
                                                    return Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.66,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 20,
                                                                right: 20),
                                                        child: Column(
                                                            children: [
                                                              SizedBox(
                                                                height:
                                                                    heightApp *
                                                                        0.02,
                                                              ),
                                                              Container(
                                                                width: 45,
                                                                height: 5,
                                                                decoration: BoxDecoration(
                                                                    color: Color(
                                                                        0xffD5D5D5),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5)),
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    heightApp *
                                                                        0.02,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  SvgPicture.asset(
                                                                      'assets/images/calendar.svg'),
                                                                  SizedBox(
                                                                    width:
                                                                        widthApp *
                                                                            0.01,
                                                                  ),
                                                                  Text(
                                                                    'اختر التاريخ',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0XFFB58E40),
                                                                        fontSize:
                                                                            20,
                                                                        fontFamily:
                                                                            'din-next-lt-arabic light'),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    heightApp *
                                                                        0.02,
                                                              ),
                                                              TableCalendar(
                                                                locale: 'ar_AR',
                                                                firstDay:
                                                                    DateTime
                                                                        .now(),
                                                                lastDay:
                                                                    DateTime.utc(
                                                                        2030,
                                                                        3,
                                                                        14),
                                                                focusedDay:
                                                                    DateTime
                                                                        .now(),
                                                                calendarFormat:
                                                                    CalendarFormat
                                                                        .month,
                                                                selectedDayPredicate:
                                                                    (day) {
                                                                  return requsetSaveFoodBussinessController
                                                                      .selectedDaysList
                                                                      .contains(
                                                                          day);
                                                                },
                                                                onDaySelected:
                                                                    (selectedDay,
                                                                        focusedDay) {
                                                                  if (requsetSaveFoodBussinessController
                                                                      .selectedDaysList
                                                                      .contains(
                                                                          selectedDay)) {
                                                                    requsetSaveFoodBussinessController
                                                                        .selectedDaysList
                                                                        .remove(
                                                                            selectedDay);
                                                                  } else if (requsetSaveFoodBussinessController
                                                                          .selectedDaysList
                                                                          .length <=
                                                                      4) {
                                                                    requsetSaveFoodBussinessController
                                                                        .selectedDaysList
                                                                        .add(
                                                                            selectedDay);
                                                                  }

                                                                  final DateFormat
                                                                      format2 =
                                                                      DateFormat(
                                                                          'MMMM',
                                                                          'ar');

                                                                  print(
                                                                      "${requsetSaveFoodBussinessController.focusedDay.day} ${format2.format(requsetSaveFoodBussinessController.focusedDay)} ${requsetSaveFoodBussinessController.focusedDay.year}");
                                                                  requsetSaveFoodBussinessController
                                                                          .selectDay =
                                                                      "${requsetSaveFoodBussinessController.focusedDay.day} ${format2.format(requsetSaveFoodBussinessController.focusedDay)} ${requsetSaveFoodBussinessController.focusedDay.year}";
                                                                  requsetSaveFoodBussinessController
                                                                      .update();
                                                                },
                                                                onPageChanged:
                                                                    (focusedDay) {
                                                                  requsetSaveFoodBussinessController
                                                                          .focusedDay =
                                                                      focusedDay;
                                                                },
                                                                onFormatChanged:
                                                                    (format) {
                                                                  if (requsetSaveFoodBussinessController
                                                                          .calendarFormat !=
                                                                      format) {
                                                                    requsetSaveFoodBussinessController
                                                                            .calendarFormat =
                                                                        format;
                                                                    requsetSaveFoodBussinessController
                                                                        .update();
                                                                  }
                                                                },
                                                                calendarStyle:
                                                                    CalendarStyle(
                                                                  defaultTextStyle:
                                                                      TextStyle(
                                                                          fontFamily:
                                                                              'din-next-lt-arabic light'),
                                                                  todayTextStyle:
                                                                      TextStyle(
                                                                          // color: Colors
                                                                          //     .black,
                                                                          fontFamily:
                                                                              'din-next-lt-arabic light'),
                                                                  selectedTextStyle:
                                                                      TextStyle(
                                                                          // color: Colors
                                                                          //     .black,
                                                                          fontFamily:
                                                                              'din-next-lt-arabic light'),
                                                                  outsideDaysVisible:
                                                                      false,
                                                                  todayDecoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .transparent,
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    // color: Color(0XFFCCA750).withOpacity(.20),
                                                                    // borderRadius: BorderRadius.circular(15),
                                                                  ),
                                                                  selectedDecoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                    color: Color(
                                                                            0XFFCCA750)
                                                                        .withOpacity(
                                                                            .20),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                  ),
                                                                  defaultDecoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .transparent,
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                  ),
                                                                  weekendDecoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                  ),
                                                                ),
                                                                headerStyle:
                                                                    HeaderStyle(
                                                                        leftChevronIcon:
                                                                            Icon(
                                                                          Icons
                                                                              .chevron_left,
                                                                          color:
                                                                              Color(0XFFCCA750),
                                                                        ),
                                                                        rightChevronIcon:
                                                                            const Icon(
                                                                          Icons
                                                                              .chevron_right,
                                                                          color:
                                                                              Color(0XFFCCA750),
                                                                        ),
                                                                        titleTextStyle:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              20,
                                                                          fontFamily:
                                                                              'din-next-lt-arabic light',
                                                                        ),
                                                                        titleCentered:
                                                                            true,
                                                                        headerPadding:
                                                                            EdgeInsets.all(
                                                                                20),
                                                                        formatButtonDecoration:
                                                                            BoxDecoration(color: Color(0XFFCCA750))),
                                                                availableCalendarFormats: const {
                                                                  CalendarFormat
                                                                      .month: '',
                                                                },
                                                                startingDayOfWeek:
                                                                    StartingDayOfWeek
                                                                        .sunday,
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    heightApp *
                                                                        0.02,
                                                              ),
                                                              MainButton(
                                                                  text: 'تحديد',
                                                                  press: requsetSaveFoodBussinessController
                                                                          .selectedDaysList
                                                                          .isEmpty
                                                                      ? null
                                                                      : () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                  color: requsetSaveFoodBussinessController
                                                                          .selectedDaysList
                                                                          .isEmpty
                                                                      ? const Color(
                                                                              0XFFCCA750)
                                                                          .withOpacity(
                                                                              .5)
                                                                      : const Color(
                                                                          0XFFCCA750))
                                                            ]),
                                                      ),
                                                    );
                                                  });
                                            });
                                      },
                                      child: Container(
                                          height: 54,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xffEEEEEE))),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                requsetSaveFoodBussinessController
                                                        .selectedDaysList
                                                        .isEmpty
                                                    ? Text(
                                                        'حدد التاريخ',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                            color: Color(
                                                                0XFFD1D1D1),
                                                            fontSize: 15,
                                                            fontFamily:
                                                                'din-next-lt-arabic light'),
                                                      )
                                                    : Text(
                                                        'تم تحديد ' +
                                                            requsetSaveFoodBussinessController
                                                                .selectedDaysList
                                                                .length
                                                                .toString() +
                                                            ' مواعيد',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontFamily:
                                                                'din-next-lt-arabic light'),
                                                      ),
                                                SvgPicture.asset(
                                                    'assets/images/calendar.svg'),

                                              ],
                                            ),
                                          )),
                                    ), SizedBox(
                                      height: heightApp * 0.02,
                                    ),Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 25,
                                              width: 5,
                                              decoration: BoxDecoration(
                                                  color: Color(0XFFCCA750),
                                                  borderRadius:
                                                      BorderRadius.circular(1)),
                                            ),
                                            SizedBox(
                                              width: widthApp * 0.02,
                                            ),
                                            Text(
                                              'ملاحظات اضافية',
                                              style: TextStyle(
                                                  color: Color(0XFFCCA750),
                                                  fontSize: 15,
                                                  fontFamily:
                                                      'din-next-lt-arabic Light'),
                                            )
                                          ],
                                        ),
                                        Text('(اختياري)',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontFamily:
                                                                'din-next-lt-arabic light'),
                                                      ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.02,
                                    ),

                                    TextField(
                                      cursorColor: Color(0XFFCCA750),
              style:  TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'din-next-lt-arabic light'),
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              textAlign: TextAlign.right,
              onChanged: (value){

              },
           
            
              keyboardType: TextInputType.text,
              // controller: controller,
              decoration: InputDecoration(
         
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xffEEEEEE), width: 1),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xffEEEEEE), width: 1),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0XFFDBDADA), width: 1),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'أو أدخل مبلغ آخر',
                hintStyle: TextStyle(
                                                            color: Color(
                                                                0XFFD1D1D1),
                                                            fontSize: 15,
                                                            fontFamily:
                                                                'din-next-lt-arabic light'),
                contentPadding: EdgeInsets.all(16),
             
              ),
              // validator: validator
              ),
                                 SizedBox(height:heightApp*0.04 ,)  
                                  ]))))),
                  Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: MainButton(
                            color: requsetSaveFoodBussinessController.selectedIndexes.isEmpty||
                                    requsetSaveFoodBussinessController.selectedDaysList.isEmpty 
                                ? const Color(0XFFCCA750).withOpacity(.5)
                                : const Color(0XFFCCA750),
                            text: 'إتمام الطلب',
                            press:  requsetSaveFoodBussinessController.selectedIndexes.isEmpty||
                                    requsetSaveFoodBussinessController.selectedDaysList.isEmpty 
                                ? null
                                : () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            // title: Text("Success"),
                                            content: Container(
                                              height: 363,
                                              width: 368,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: heightApp * 0.04,
                                                  ),
                                                  SvgPicture.asset(
                                                      'assets/images/sucess.svg'),
                                                  SizedBox(
                                                    height: heightApp * 0.02,
                                                  ),
                                                  Text(
                                                    "شكرًا لك !",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0XFFCCA750),
                                                        fontSize: 18,
                                                        fontFamily:
                                                            'din-next-lt-arabic light'),
                                                  ),
                                                  SizedBox(
                                                    height: heightApp * 0.01,
                                                  ),
                                                  Text(
                                                    "تم تأكيد طلبك بنجاح",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff55585D),
                                                        fontSize: 18,
                                                        fontFamily:
                                                            'din-next-lt-arabic light'),
                                                  ),
                                                  SizedBox(
                                                    height: heightApp * 0.04,
                                                  ),
                                                  Flexible(
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: <Widget>[
                                                          Expanded(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                Get.toNamed(
                                                                    '/OrderDetailsSaveFoodBuseinessView');
                                                              },
                                                              child: Container(
                                                                width: 154,
                                                                height: 60,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  color: Color(
                                                                      0XFFCCA750),
                                                                ),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    'تتبع الطلب',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            'din-next-lt-arabic light'),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                widthApp * 0.04,
                                                          ),
                                                          Expanded(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                controller
                                                                    .selectedTab = 0;
                                                                Get.offAllNamed(
                                                                    '/CustomTabBar');
                                                                controller
                                                                    .update();
                                                              },
                                                              child: Container(
                                                                width: 154,
                                                                height: 60,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    color: Colors
                                                                        .white,
                                                                    border: Border.all(
                                                                        color: const Color(
                                                                            0XFFCCA750),
                                                                        width:
                                                                            2)),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    'عودة للرئيسية',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: const Color(
                                                                            0XFFCCA750),
                                                                        fontFamily:
                                                                            'din-next-lt-arabic light'),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ]),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  }),
                      )),
                ]));
          }),
    );
  }
}
