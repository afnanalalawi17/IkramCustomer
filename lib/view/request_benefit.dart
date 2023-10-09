import 'package:ekram_customer/controller/auth_controllers.dart';
import 'package:ekram_customer/controller/bottomNavBar_controllers.dart';
import 'package:ekram_customer/controller/customer_controllers.dart';
import 'package:ekram_customer/controller/location_controllers.dart';
import 'package:ekram_customer/controller/otp_controllers.dart';
import 'package:ekram_customer/controller/requestBenefit_controllers.dart';
import 'package:ekram_customer/controller/requsrSaveFood_controllers.dart';
import 'package:ekram_customer/database/Login_Stat_Controller.dart';
import 'package:ekram_customer/shared/style/Text_style.dart';
import 'package:ekram_customer/shared/widget/box_Text_Field.dart';
import 'package:ekram_customer/shared/widget/box_Text_Field_Basic.dart';
import 'package:ekram_customer/shared/widget/box_Text_Field_Search.dart';
import 'package:ekram_customer/shared/widget/box_Text_Field_gray.dart';
import 'package:ekram_customer/shared/widget/constants.dart';
import 'package:ekram_customer/shared/widget/main_button.dart';
import 'package:ekram_customer/view/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:ui' as ui;

class RequestBenefitView extends StatelessWidget {
  final requsetBenfitController = Get.put(RequsetBenfitController());
   final otpController = Get.put(OtpController());
  final authController = Get.put(AuthController());
    final loginStat = Get.put(LoginStateController());

  TimeOfDay timeOfDay = TimeOfDay.now();
    final locationcontroller = Get.put(LocationController());

  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');
  final controller = Get.put(BottomNavBarController());

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
            Get.offAndToNamed('/CustomTabBar');
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 12),
            child: SvgPicture.asset("assets/images/arrow_back.svg"),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            "طلب استفادة",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'din-next-lt-arabic Light'),
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xff07706D),
      ),
      body: GetBuilder<RequsetBenfitController>(
          init: RequsetBenfitController(),
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
                                      height: heightApp * 0.02,
                                    ),
                                    BoxTextFieldBasic(
                                       controller: requsetBenfitController
                                            .nameController,
                                        asset: 'assets/images/user.svg',
                                        text: 'الاسم'),
                                    BoxTextFieldBasic( controller: requsetBenfitController
                                            .phoneController,
                                        asset: 'assets/images/phone-call.svg',
                                        text: 'رقم الجوال'),
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
                                                      RequsetBenfitController>(
                                                  init:
                                                      RequsetBenfitController(),
                                                  initState: (_) {},
                                                  builder: (_) {
                                                    return Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.88,
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
                                                              BoxTextFieldSearch(
                                                                  text: ''),
                                                              SizedBox(
                                                                height:
                                                                    heightApp *
                                                                        0.03,
                                                              ),
                                                              Expanded(
                                                                child: Column(
                                                                    children: [
                                                                      ListView.separated(
                                                                          shrinkWrap: true,
                                                                          separatorBuilder: (context, index) {
                                                                            return SizedBox(
                                                                              height: heightApp * 0.01,
                                                                            );
                                                                          },
                                                                          // padding: EdgeInsets.all(15),
                                                                          itemCount: 6,
                                                                          itemBuilder: (BuildContext context, int index) {
                                                                            return GestureDetector(
                                                                              onTap: () {
                                                                                // requsetBenfitController.onSelectCat(index);

                                                                                // requsetBenfitController.
                                                                              },
                                                                              child: Container(
                                                                                height: 60,
                                                                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: requsetBenfitController.multipleSelected.contains(requsetBenfitController.checkListItems[index]) ? Color(0XFFCCA750) : Color(0xffEEEEEE))),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Text(requsetBenfitController.checkListItems[index]["title"],
                                                                                          style: TextStyle(
                                                                                            fontSize: 16.0,
                                                                                            color: requsetBenfitController.multipleSelected.contains(requsetBenfitController.checkListItems[index]) ? Color(0XFFCCA750) : Colors.black,
                                                                                          )),
                                                                                      Checkbox(
                                                                                        activeColor: Color(0XFFCCA750),
                                                                                        value: requsetBenfitController.checkListItems[index]["value"],
                                                                                        onChanged: (value) {
                                                                                          // requsetBenfitController.select = value.toString();
                                                                                          requsetBenfitController.checkListItems[index]["value"] = value;
                                                                                          print(requsetBenfitController.checkListItems[index]["value"]);
                                                                                          print(requsetBenfitController.multipleSelected);

                                                                                          if (requsetBenfitController.multipleSelected.contains(requsetBenfitController.checkListItems[index])) {
                                                                                            requsetBenfitController.multipleSelected.remove(requsetBenfitController.checkListItems[index]);
                                                                                          } else {
                                                                                            requsetBenfitController.multipleSelected.add(requsetBenfitController.checkListItems[index]);
                                                                                            requsetBenfitController.Selected.add(requsetBenfitController.checkListItems[index]["title"]);
                                                                                          }

                                                                                          print(requsetBenfitController.Selected.toString());

                                                                                          requsetBenfitController.update();
                                                                                        },
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }),
                                                                    ]),
                                                              ),
                                                              Align(
                                                                  alignment:
                                                                      FractionalOffset
                                                                          .bottomCenter,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        bottom:
                                                                            40),
                                                                    child: MainButton(
                                                                        color: requsetBenfitController.multipleSelected.isEmpty ? const Color(0XFFCCA750).withOpacity(.5) : const Color(0XFFCCA750),
                                                                        text: 'اختيار',
                                                                        press: requsetBenfitController.multipleSelected.isEmpty
                                                                            ? null
                                                                            : () {
                                                                                Navigator.pop(context);
                                                                              }),
                                                                  )),
                                                            ]),
                                                      ),
                                                    );
                                                  });
                                            });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/place.svg'),
                                                Text(
                                                  'نوع المناسبة',
                                                  style: TextStyle(
                                                      color: Color(0XFFB58E40),
                                                      fontSize: 15,
                                                      fontFamily:
                                                          'din-next-lt-arabic light'),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: heightApp * 0.02,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                requsetBenfitController
                                                        .multipleSelected
                                                        .isEmpty
                                                    ? Text(
                                                        'اختر من القائمة',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0XFFD1D1D1),
                                                            fontSize: 15,
                                                            fontFamily:
                                                                'din-next-lt-arabic light'),
                                                      )
                                                    : Text(
                                                        requsetBenfitController
                                                                    .Selected
                                                                .toString()
                                                            .replaceAll('[', '')
                                                            .replaceAll(']', '')
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontFamily:
                                                                'din-next-lt-arabic light'),
                                                      ),
                                                SvgPicture.asset(
                                                    'assets/images/arrow_down_gold.svg')
                                              ],
                                            ),
                                            Divider(
                                              thickness: 1,
                                              color: Color(0xffE4E4E4),
                                            ),
                                            SizedBox(
                                              height: heightApp * 0.02,
                                            ),
                                            GetBuilder<LocationController>(
                                              init: LocationController(),
                                              initState: (_) {},
                                              builder: (_) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        '/GetLocationView');
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                              'assets/images/location.svg'),
                                                          const Text(
                                                            'موقع الاستلام',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0XFFB58E40),
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'din-next-lt-arabic light'),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            heightApp * 0.02,
                                                      ),
                                                      locationcontroller
                                                                  .currentLocation
                                                                  .toString() ==
                                                              ''
                                                          ? const Text(
                                                              'حدد موقع المناسبة',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0XFFD1D1D1),
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      'din-next-lt-arabic light'),
                                                            )
                                                          : Text(
                                                              locationcontroller
                                                                  .currentLocation
                                                                  .toString(),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      'din-next-lt-arabic light'),
                                                            ),
                                                      const Divider(
                                                        thickness: 1,
                                                        color:
                                                            Color(0xffE4E4E4),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                            SizedBox(
                                              height: heightApp * 0.02,
                                            ),

                                            GestureDetector(
                                              onTap: () {
                                                showModalBottomSheet(
                                                    context: context,
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Color(0XFFF8F8F8),
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                10.0),
                                                        topRight:
                                                            Radius.circular(
                                                                10.0),
                                                      ),
                                                    ),
                                                    builder:
                                                        (BuildContext context) {
                                                      return GetBuilder<
                                                              RequsetBenfitController>(
                                                          init:
                                                              RequsetBenfitController(),
                                                          initState: (_) {},
                                                          builder: (_) {
                                                            return Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.66,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            20),
                                                                child: Column(
                                                                    children: [
                                                                      SizedBox(
                                                                        height: heightApp *
                                                                            0.02,
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            45,
                                                                        height:
                                                                            5,
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Color(0xffD5D5D5),
                                                                            borderRadius: BorderRadius.circular(5)),
                                                                      ),
                                                                      SizedBox(
                                                                        height: heightApp *
                                                                            0.02,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          SvgPicture.asset(
                                                                              'assets/images/calendar.svg'),
                                                                          SizedBox(
                                                                            width:
                                                                                widthApp * 0.01,
                                                                          ),
                                                                          Text(
                                                                            'اختر التاريخ',
                                                                            style: TextStyle(
                                                                                color: Color(0XFFB58E40),
                                                                                fontSize: 20,
                                                                                fontFamily: 'din-next-lt-arabic light'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height: heightApp *
                                                                            0.02,
                                                                      ),
                                                                      TableCalendar(
                                                                        locale:
                                                                            'ar_AR',
                                                                        firstDay:
                                                                            DateTime.now(),
                                                                        lastDay: DateTime.utc(
                                                                            2030,
                                                                            3,
                                                                            14),
                                                                        focusedDay:
                                                                            DateTime.now(),
                                                                        calendarFormat:
                                                                            CalendarFormat.month,
                                                                        selectedDayPredicate:
                                                                            (day) {
                                                                          return isSameDay(
                                                                              requsetBenfitController.selectedDay,
                                                                              day);
                                                                        },
                                                                        onDaySelected:
                                                                            (selectedDay,
                                                                                focusedDay) {
                                                                          if (!isSameDay(
                                                                              requsetBenfitController.selectedDay,
                                                                              selectedDay)) {
                                                                            requsetBenfitController.selectedDay =
                                                                                selectedDay;
                                                                            requsetBenfitController.focusedDay =
                                                                                focusedDay;
                                                                            final DateFormat
                                                                                format2 =
                                                                                DateFormat('MMMM', 'ar');
                                                                            print("${requsetBenfitController.focusedDay.day} ${format2.format(requsetBenfitController.focusedDay)} ${requsetBenfitController.focusedDay.year}");
                                                                            requsetBenfitController.selectDay =
                                                                                "${requsetBenfitController.focusedDay.day} ${format2.format(requsetBenfitController.focusedDay)} ${requsetBenfitController.focusedDay.year}";
                                                                            requsetBenfitController.update();
                                                                          }
                                                                          print(
                                                                              formatter);
                                                                        },
                                                                        onPageChanged:
                                                                            (focusedDay) {
                                                                          requsetBenfitController.focusedDay =
                                                                              focusedDay;
                                                                        },
                                                                        onFormatChanged:
                                                                            (format) {
                                                                          if (requsetBenfitController.calendarFormat !=
                                                                              format) {
                                                                            requsetBenfitController.calendarFormat =
                                                                                format;
                                                                            requsetBenfitController.update();
                                                                          }
                                                                        },
                                                                        calendarStyle:
                                                                            CalendarStyle(
                                                                          defaultTextStyle:
                                                                              TextStyle(fontFamily: 'din-next-lt-arabic light'),
                                                                          todayTextStyle: TextStyle(
                                                                              color: Colors.black,
                                                                              fontFamily: 'din-next-lt-arabic light'),
                                                                          selectedTextStyle: TextStyle(
                                                                              color: Colors.black,
                                                                              fontFamily: 'din-next-lt-arabic light'),
                                                                          outsideDaysVisible:
                                                                              false,
                                                                          todayDecoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.transparent,
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                            borderRadius:
                                                                                BorderRadius.circular(15),
                                                                            // color: Color(0XFFCCA750).withOpacity(.20),
                                                                            // borderRadius: BorderRadius.circular(15),
                                                                          ),
                                                                          selectedDecoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                            color:
                                                                                Color(0XFFCCA750).withOpacity(.20),
                                                                            borderRadius:
                                                                                BorderRadius.circular(15),
                                                                          ),
                                                                          defaultDecoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.transparent,
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                            borderRadius:
                                                                                BorderRadius.circular(15),
                                                                          ),
                                                                          weekendDecoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                          ),
                                                                        ),
                                                                        headerStyle: HeaderStyle(
                                                                            leftChevronIcon: Icon(
                                                                              Icons.chevron_left,
                                                                              color: Color(0XFFCCA750),
                                                                            ),
                                                                            rightChevronIcon: const Icon(
                                                                              Icons.chevron_right,
                                                                              color: Color(0XFFCCA750),
                                                                            ),
                                                                            titleTextStyle: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 20,
                                                                              fontFamily: 'din-next-lt-arabic light',
                                                                            ),
                                                                            titleCentered: true,
                                                                            headerPadding: EdgeInsets.all(20),
                                                                            formatButtonDecoration: BoxDecoration(color: Color(0XFFCCA750))),
                                                                        availableCalendarFormats: const {
                                                                          CalendarFormat.month:
                                                                              '',
                                                                        },
                                                                        startingDayOfWeek:
                                                                            StartingDayOfWeek.sunday,
                                                                      ),
                                                                      SizedBox(
                                                                        height: heightApp *
                                                                            0.02,
                                                                      ),
                                                                      MainButton(
                                                                          text:
                                                                              "التالي",
                                                                          color: requsetBenfitController.selectDay.toString() == ''
                                                                              ? const Color(0XFFCCA750).withOpacity(.5)
                                                                              : const Color(0XFFCCA750),
                                                                          press: requsetBenfitController.selectDay.toString() == ''
                                                                              ? null
                                                                              : () {
                                                                                  Navigator.pop(context);
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
                                                                                        return GetBuilder<RequsetBenfitController>(
                                                                                            init: RequsetBenfitController(),
                                                                                            initState: (_) {},
                                                                                            builder: (_) {
                                                                                              return Container(
                                                                                                  height: MediaQuery.of(context).size.height * 0.44,
                                                                                                  child:

                                                                                                      // CupertinoDatePicker(
                                                                                                      //         mode: CupertinoDatePickerMode.time,
                                                                                                      //         initialDateTime:  DateTime.now(),
                                                                                                      //         onDateTimeChanged: (DateTime newDateTime) {
                                                                                                      //           var newTod = TimeOfDay.fromDateTime(newDateTime);
                                                                                                      //           // _updateTimeFunction(newTod);
                                                                                                      //         },
                                                                                                      //         use24hFormat: false,
                                                                                                      //         minuteInterval: 1,

                                                                                                      // )
                                                                                                      Padding(
                                                                                                    padding: const EdgeInsets.only(left: 20, right: 20),
                                                                                                    child: Column(
                                                                                                      children: [
                                                                                                        SizedBox(
                                                                                                          height: heightApp * 0.02,
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 45,
                                                                                                          height: 5,
                                                                                                          decoration: BoxDecoration(color: Color(0xffD5D5D5), borderRadius: BorderRadius.circular(5)),
                                                                                                        ),
                                                                                                        SizedBox(
                                                                                                          height: heightApp * 0.02,
                                                                                                        ),
                                                                                                        Row(
                                                                                                          children: [
                                                                                                            SvgPicture.asset('assets/images/clock.svg'),
                                                                                                            SizedBox(
                                                                                                              width: widthApp * 0.01,
                                                                                                            ),
                                                                                                            Text(
                                                                                                              'اختر الوقت',
                                                                                                              style: TextStyle(color: Color(0XFFB58E40), fontSize: 20, fontFamily: 'din-next-lt-arabic light'),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        SizedBox(
                                                                                                          height: heightApp * 0.02,
                                                                                                        ),
                                                                                                        TimePickerSpinner(
                                                                                                          time: DateTime.now(),
                                                                                                          is24HourMode: false,
                                                                                                          normalTextStyle: TextStyle(
                                                                                                            fontSize: 25,
                                                                                                            color: Color(0XFFE5E5E5),
                                                                                                          ),
                                                                                                          highlightedTextStyle: TextStyle(
                                                                                                            fontSize: 35,
                                                                                                            color: Color(0XFFCCA750),
                                                                                                            fontFamily: 'din-next-lt-arabic light',
                                                                                                          ),
                                                                                                          spacing: 70,
                                                                                                          itemHeight: 70,
                                                                                                          isForce2Digits: true,
                                                                                                          onTimeChange: (time) {
                                                                                                            requsetBenfitController.selectTime = time.toString();

                                                                                                            requsetBenfitController.selectTime = DateFormat('hh:mm a').format(time);
                                                                                                            requsetBenfitController.selectTime = DateFormat('hh:mm a').format(time);
                                                                                                            if (DateFormat('a').format(time) == 'AM') {
                                                                                                              requsetBenfitController.selectTime = '${DateFormat('hh:mm ').format(time)}ص';
                                                                                                            } else if (DateFormat('a').format(time) == 'PM') {
                                                                                                              requsetBenfitController.selectTime = '${DateFormat('hh:mm ').format(time)}م';
                                                                                                            }
                                                                                                            requsetBenfitController.update();
                                                                                                            print(requsetBenfitController.selectTime);
                                                                                                          },
                                                                                                        ),
                                                                                                        SizedBox(
                                                                                                          height: heightApp * 0.02,
                                                                                                        ),
                                                                                                        Flexible(
                                                                                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
                                                                                                            Expanded(
                                                                                                              child: GestureDetector(
                                                                                                                onTap: requsetBenfitController.selectTime.toString() == ''
                                                                                                                    ? null
                                                                                                                    : () {
                                                                                                                        Navigator.pop(context);
                                                                                                                      },
                                                                                                                child: Container(
                                                                                                                  width: 154,
                                                                                                                  height: 60,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    borderRadius: BorderRadius.circular(12),
                                                                                                                    color: requsetBenfitController.selectTime.toString() == '' ? const Color(0XFFCCA750).withOpacity(.5) : const Color(0XFFCCA750),
                                                                                                                  ),
                                                                                                                  child: const Center(
                                                                                                                    child: Text(
                                                                                                                      'تحديد الوقت',
                                                                                                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'din-next-lt-arabic light'),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            SizedBox(
                                                                                                              width: widthApp * 0.04,
                                                                                                            ),
                                                                                                            Expanded(
                                                                                                              child: GestureDetector(
                                                                                                                onTap: () {
                                                                                                                  Navigator.pop(context);
                                                                                                                },
                                                                                                                child: Container(
                                                                                                                  width: 154,
                                                                                                                  height: 60,
                                                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white, border: Border.all(color: const Color(0XFFCCA750), width: 2)),
                                                                                                                  child: const Center(
                                                                                                                    child: Text(
                                                                                                                      'تراجع',
                                                                                                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0XFFCCA750), fontFamily: 'din-next-lt-arabic light'),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ]),
                                                                                                        )
                                                                                                      ],
                                                                                                    ),
                                                                                                  ));
                                                                                            });
                                                                                      });
                                                                                })
                                                                    ]),
                                                              ),
                                                            );
                                                          });
                                                    });
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/images/calendar.svg'),
                                                      Text(
                                                        'التوقيت المناسب لاستلام النعمة',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0XFFB58E40),
                                                            fontSize: 15,
                                                            fontFamily:
                                                                'din-next-lt-arabic light'),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: heightApp * 0.02,
                                                  ),
                                                  requsetBenfitController
                                                                  .selectDay ==
                                                              '' &&
                                                          requsetBenfitController
                                                                  .selectTime ==
                                                              ''
                                                      ? Text(
                                                          'حدد الوقت والتاريخ',
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
                                                          '${requsetBenfitController.selectDay} - ${requsetBenfitController.selectTime}',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  'din-next-lt-arabic light'),
                                                        ),
                                                  Divider(
                                                    thickness: 1,
                                                    color: Color(0xffE4E4E4),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: heightApp * 0.02,
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/add-user.svg'),
                                                Text(
                                                  'عدد المستفيدين',
                                                  style: TextStyle(
                                                      color: Color(0XFFB58E40),
                                                      fontSize: 15,
                                                      fontFamily:
                                                          'din-next-lt-arabic light'),
                                                ),
                                              ],
                                            ),
                                            // SizedBox(
                                            //   height: heightApp * 0.01,
                                            // ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  requsetBenfitController
                                                      .counter
                                                      .toString(),
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      color:
                                                          requsetBenfitController
                                                                      .counter ==
                                                                  0
                                                              ? Color(
                                                                  0XFFD1D1D1)
                                                              : Colors.black,
                                                      fontSize: 15,
                                                      fontFamily:
                                                          'din-next-lt-arabic light'),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        GestureDetector(
                                                            onTap: () {
                                                              requsetBenfitController
                                                                  .counter++;
                                                              requsetBenfitController
                                                                  .update();
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_drop_up,
                                                              color: Color(
                                                                  0XFFCCA750),
                                                              size: 30.0,
                                                            )),
                                                        GestureDetector(
                                                            onTap: () {
                                                              requsetBenfitController
                                                                          .counter ==
                                                                      0
                                                                  ? print(
                                                                      'counter at 0')
                                                                  : requsetBenfitController
                                                                      .counter--;
                                                              requsetBenfitController
                                                                  .update();
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_drop_down,
                                                              size: 30.0,
                                                              color: requsetBenfitController
                                                                          .counter ==
                                                                      0
                                                                  ? Color(0XFFCCA750)
                                                                      .withOpacity(
                                                                          .3)
                                                                  : Color(
                                                                      0XFFCCA750),
                                                            )),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            // : Text(
                                            //     '${requsetBenfitController.selectDay} - ${requsetBenfitController.selectTime}',
                                            //     style: TextStyle(
                                            //         fontSize: 15,
                                            //         fontFamily:
                                            //             'din-next-lt-arabic light'),
                                            //   ),
                                            Divider(
                                              thickness: 1,
                                              color: Color(0xffE4E4E4),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]))))),
                  Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: MainButton(
                            color: requsetBenfitController.multipleSelected.isEmpty ||
                                    requsetBenfitController.selectDay == '' ||
                                    requsetBenfitController.selectTime == '' ||
                                    requsetBenfitController.counter == 0
                                ? const Color(0XFFCCA750).withOpacity(.5)
                                : const Color(0XFFCCA750),
                            text: 'إتمام الطلب',
                            press: requsetBenfitController.multipleSelected.isEmpty ||
                                    requsetBenfitController.selectDay == '' ||
                                    requsetBenfitController.selectTime == '' || requsetBenfitController.counter == 0
                                ? null
                        
                                : () {
                         if (loginStat.loginState == 'notLogin') {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0)),
                                              elevation: 0.0,
                                              backgroundColor:
                                                  Colors.transparent,
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 0.0, right: 0.0),
                                                child: Stack(
                                                  children: <Widget>[
                                                    Container(
                                                      height: 366,
                                                      width: 368,
                                                      padding:
                                                          const EdgeInsets.only(
                                                        top: 18.0,
                                                      ),
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 13.0,
                                                              left: 8.0),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          shape: BoxShape
                                                              .rectangle,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                          boxShadow: <BoxShadow>[
                                                            const BoxShadow(
                                                              color: Colors
                                                                  .black26,
                                                              blurRadius: 0.0,
                                                              offset: Offset(
                                                                  0.0, 0.0),
                                                            ),
                                                          ]),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          SizedBox(
                                                            height: heightApp *
                                                                0.02,
                                                          ),
                                                          SvgPicture.asset(
                                                              'assets/images/login.svg'),
                                                          SizedBox(
                                                            height: heightApp *
                                                                0.02,
                                                          ),
                                                          const Text(
                                                            'زائرنا الكريم',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0XFFCCA750),
                                                                fontSize: 24,
                                                                fontFamily:
                                                                    'din-next-lt-arabic light'),
                                                          ),
                                                          SizedBox(
                                                            height: heightApp *
                                                                0.01,
                                                          ),
                                                          const Text(
                                                            'يرجى تسجيل الدخول حتى تتمكن من إتمام الطلب',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff55585D),
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'din-next-lt-arabic light'),
                                                          ),
                                                          SizedBox(
                                                            height: heightApp *
                                                                0.02,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: MainButton(
                                                                color: const Color(
                                                                    0XFFCCA750),
                                                                text:
                                                                    'تسجيل الدخول',
                                                                press: () {
                                                                  Navigator.pop(
                                                                      context);

                                                                  showModalBottomSheet(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return GetBuilder<
                                                                                AuthController>(
                                                                            init:
                                                                                AuthController(),
                                                                            initState:
                                                                                (_) {},
                                                                            builder:
                                                                                (_) {
                                                                              return Padding(
                                                                                padding: EdgeInsets.only(
                                                                                  bottom: MediaQuery.of(context).viewInsets.bottom,
                                                                                ),
                                                                                child: SingleChildScrollView(
                                                                                  child: ClipRRect(
                                                                                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                                                                                      child: Container(
                                                                                          height: 349,
                                                                                          color: Colors.white,
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsets.all(20.0),
                                                                                            child: Column(children: [
                                                                                              Container(
                                                                                                width: 45,
                                                                                                height: 5,
                                                                                                decoration: BoxDecoration(color: const Color(0xffD5D5D5), borderRadius: BorderRadius.circular(5)),
                                                                                              ),
                                                                                              SizedBox(
                                                                                                height: heightApp * 0.02,
                                                                                              ),
                                                                                              Row(
                                                                                                children: <Widget>[
                                                                                                  Expanded(
                                                                                                      child: Form(
                                                                                                    key: authController.LoginFormKey,
                                                                                                    child: Column(
                                                                                                      children: [
                                                                                                        BoxTextField(
                                                                                                            controller: authController.phoneController,
                                                                                                            onSaved: (value) {
                                                                                                              authController.phone = value;
                                                                                                            },
                                                                                                            onChanged: (value) {
                                                                                                              authController.phone = value;
                                                                                                              authController.phoneController.text.length == 9 ? authController.enanble = true : authController.enanble = false;

                                                                                                              authController.update();
                                                                                                            },
                                                                                                            validator: (value) {
                                                                                                              return authController.validateMobile(value!);
                                                                                                            },
                                                                                                            text: 'تسجيل الدخول / التسجيل'),
                                                                                                        SizedBox(
                                                                                                          height: heightApp * 0.01,
                                                                                                        ),
                                                                                                        const Text(
                                                                                                          'بالضغط على تسجيل الدخول, فأنت توافق على',
                                                                                                          style: TextStyle(color: Color(0xff55585D), fontSize: 14, fontFamily: 'din-next-lt-arabic light'),
                                                                                                        ),
                                                                                                        const Row(
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              ' الشروط والأحكام',
                                                                                                              style: TextStyle(color: Color(0xffA2B156), fontSize: 14, fontFamily: 'din-next-lt-arabic light'),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              ' وانك قد قرأت',
                                                                                                              style: TextStyle(color: Color(0xff55585D), fontSize: 14, fontFamily: 'din-next-lt-arabic light'),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              ' سياسة الخصوصية ',
                                                                                                              style: TextStyle(color: Color(0xffA2B156), fontSize: 14, fontFamily: 'din-next-lt-arabic light'),
                                                                                                            )
                                                                                                          ],
                                                                                                        ),
                                                                                                        SizedBox(
                                                                                                          height: heightApp * 0.02,
                                                                                                        ),
                                                                                                        MainButton(
                                                                                                            color: authController.enanble == false ? const Color(0XFFCCA750).withOpacity(.5) : const Color(0XFFCCA750),
                                                                                                            text: "تسجيل",
                                                                                                            press: authController.enanble == false
                                                                                                                ? null
                                                                                                                : () {
                                                                                                                    Navigator.pop(context);

                                                                                                                    if (authController.phoneController.text.toString() == '566220639') {
                                                                                                                      GetStorage().write('TypeUser', 'Customer');
                                                                                                                      GetStorage().write('Name', 'أفنان');
                                                                                                                      GetStorage().write('Phone', '0566220639');
                                                                                                                      requsetBenfitController.nameController.text =   GetStorage().read('Name').toString();
                                                                                                                      requsetBenfitController.phoneController.text =  GetStorage().read('Phone').toString();
                                                                                                                    } else if (authController.phoneController.text.toString() == '555543537') {
                                                                                                                      GetStorage().write('TypeUser', 'Business');
                                                                                                                    }
                                                                                                                    requsetBenfitController.update();
                                                                                                                    authController.update();

                                                                                                                    showModalBottomSheet(
                                                                                                                        context: context,
                                                                                                                        builder: (BuildContext context) {
                                                                                                                          return GetBuilder<OtpController>(
                                                                                                                              init: OtpController(),
                                                                                                                              initState: (_) {},
                                                                                                                              builder: (_) {
                                                                                                                                return Padding(
                                                                                                                                  padding: EdgeInsets.only(
                                                                                                                                    bottom: MediaQuery.of(context).viewInsets.bottom,
                                                                                                                                  ),
                                                                                                                                  child: SingleChildScrollView(
                                                                                                                                    child: ClipRRect(
                                                                                                                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                                                                                                                                        child: Container(
                                                                                                                                            height: 349,
                                                                                                                                            color: Colors.white,
                                                                                                                                            child: Padding(
                                                                                                                                              padding: const EdgeInsets.all(20.0),
                                                                                                                                              child: Column(children: [
                                                                                                                                                Container(
                                                                                                                                                  width: 45,
                                                                                                                                                  height: 5,
                                                                                                                                                  decoration: BoxDecoration(color: const Color(0xffD5D5D5), borderRadius: BorderRadius.circular(5)),
                                                                                                                                                ),
                                                                                                                                                SizedBox(
                                                                                                                                                  height: heightApp * 0.02,
                                                                                                                                                ),
                                                                                                                                                Row(
                                                                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                                  children: [
                                                                                                                                                    const Text(
                                                                                                                                                      "ادخل رمز التحقق المرسل الى ",
                                                                                                                                                      style: TextStyle(color: Color(0xff55585D), fontSize: 15, fontFamily: 'din-next-lt-arabic light'),
                                                                                                                                                    ),
                                                                                                                                                    Text(
                                                                                                                                                      authController.phoneController.text.toString(),
                                                                                                                                                      textDirection: ui.TextDirection.ltr,
                                                                                                                                                      style: const TextStyle(color: Color(0xffCCA750), fontSize: 15, fontFamily: 'din-next-lt-arabic light'),
                                                                                                                                                    ),
                                                                                                                                                  ],
                                                                                                                                                ),
                                                                                                                                                SizedBox(
                                                                                                                                                  height: heightApp * 0.02,
                                                                                                                                                ),
                                                                                                                                                Row(
                                                                                                                                                  children: <Widget>[
                                                                                                                                                    Expanded(
                                                                                                                                                        child: Column(
                                                                                                                                                      children: [
                                                                                                                                                        Padding(
                                                                                                                                                          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 40),
                                                                                                                                                          child: Directionality(
                                                                                                                                                              textDirection: ui.TextDirection.ltr,
                                                                                                                                                              child: PinCodeTextField(
                                                                                                                                                                controller: otpController.otpController,
                                                                                                                                                                cursorColor: const Color(0XFFCCA750),
                                                                                                                                                                textStyle: const TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'din-next-lt-arabic light'),
                                                                                                                                                                appContext: context,
                                                                                                                                                                length: 4,
                                                                                                                                                                obscureText: false,
                                                                                                                                                                keyboardType: TextInputType.number,
                                                                                                                                                                animationType: AnimationType.fade,
                                                                                                                                                                pinTheme: PinTheme(
                                                                                                                                                                  borderRadius: BorderRadius.circular(12),
                                                                                                                                                                  shape: PinCodeFieldShape.box,
                                                                                                                                                                  fieldWidth: 58,
                                                                                                                                                                  fieldHeight: 57,
                                                                                                                                                                  activeColor: const Color(0XFFF2F2F2),
                                                                                                                                                                  activeFillColor: const Color(0XFFF2F2F2),
                                                                                                                                                                  inactiveFillColor: const Color(0XFFF2F2F2),
                                                                                                                                                                  inactiveColor: const Color(0XFFF2F2F2),
                                                                                                                                                                  borderWidth: 2,
                                                                                                                                                                  selectedColor: const Color(0XFFF2F2F2),
                                                                                                                                                                  selectedFillColor: const Color(0XFFF2F2F2),
                                                                                                                                                                ),
                                                                                                                                                                animationDuration: const Duration(milliseconds: 300),
                                                                                                                                                                enableActiveFill: true,
                                                                                                                                                                // errorAnimationController: errorController,
                                                                                                                                                                // controller: otpController.otpController,
                                                                                                                                                                onCompleted: (value) {
                                                                                                                                                                  // otpController.otp = value;
                                                                                                                                                                },
                                                                                                                                                                onChanged: (value) {
                                                                                                                                                                  otpController.otpController.text.length == 4 ? otpController.enanble = true : otpController.enanble = false;
                                                                                                                                                                  otpController.update();
                                                                                                                                                                },
                                                                                                                                                                validator: (value) {
                                                                                                                                                                  return null;

                                                                                                                                                                  // return controller.validate(value!);
                                                                                                                                                                },
                                                                                                                                                                beforeTextPaste: (text) {
                                                                                                                                                                  print("Allowing to paste ");
                                                                                                                                                                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                                                                                                                                                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                                                                                                                                                  return true;
                                                                                                                                                                },
                                                                                                                                                              )),
                                                                                                                                                        ),
                                                                                                                                                        Obx(() {
                                                                                                                                                          if (otpController.codeError.isFalse) {
                                                                                                                                                            return Center(
                                                                                                                                                              child: Column(
                                                                                                                                                                children: [
                                                                                                                                                                  Row(
                                                                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                                                    children: [
                                                                                                                                                                      const Text(
                                                                                                                                                                        ' إعادة إرسال الرمز بعد ',
                                                                                                                                                                        style: TextStyle(color: Color(0xff55585D), fontSize: 14, fontFamily: 'din-next-lt-arabic light'),
                                                                                                                                                                      ),
                                                                                                                                                                      !otpController.timeOutTimer.value || otpController.codeError.value
                                                                                                                                                                          ? Timer1(
                                                                                                                                                                              controller: otpController,
                                                                                                                                                                            )
                                                                                                                                                                          : const Text(
                                                                                                                                                                              "0",
                                                                                                                                                                              style: TextStyle(color: Color(0xffA2B156), fontSize: 14, fontFamily: 'din-next-lt-arabic light'),
                                                                                                                                                                            ),
                                                                                                                                                                      const Text(
                                                                                                                                                                        ' ثانية',
                                                                                                                                                                        textAlign: TextAlign.center,
                                                                                                                                                                        style: TextStyle(color: Color(0xff55585D), fontSize: 14, fontFamily: 'din-next-lt-arabic light'),
                                                                                                                                                                      ),
                                                                                                                                                                    ],
                                                                                                                                                                  ),
                                                                                                                                                                  otpController.timeOutTimer.value || otpController.codeError.value
                                                                                                                                                                      ? Center(
                                                                                                                                                                          child: TextButton(
                                                                                                                                                                            onPressed: () {
                                                                                                                                                                              otpController.codeError(false);

                                                                                                                                                                              otpController.timeOutTimer(false);
                                                                                                                                                                            },
                                                                                                                                                                            child: const Text(
                                                                                                                                                                              'إعادة ارسال الرمز',
                                                                                                                                                                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffA2B156), fontFamily: 'din-next-lt-arabic Bold'),
                                                                                                                                                                            ),
                                                                                                                                                                          ),
                                                                                                                                                                        )
                                                                                                                                                                      : Container()
                                                                                                                                                                ],
                                                                                                                                                              ),
                                                                                                                                                            );
                                                                                                                                                          } else {
                                                                                                                                                            return Container();
                                                                                                                                                          }
                                                                                                                                                        }),
                                                                                                                                                        SizedBox(
                                                                                                                                                          height: heightApp * 0.02,
                                                                                                                                                        ),
                                                                                                                                                        Obx(() {
                                                                                                                                                          if (otpController.timeOutTimer.isFalse || otpController.codeError.isFalse) {
                                                                                                                                                            return GestureDetector(
                                                                                                                                                              onTap: otpController.enanble == false
                                                                                                                                                                  ? null
                                                                                                                                                                  : () async {
                                                                                                                                                                      otpController.startLoading();
                                                                                                                                                                      await Future.delayed(const Duration(seconds: 2));
                                                                                                                                                                      if (GetStorage().read('TypeUser') == 'Customer') {
                                                                                                                                                                        Get.toNamed('/EditProfileView');
                                                                                                                                                                      } else {
                                                                                                                                                                        controller.selectedTab = 2;
                                                                                                                                                                        Get.offAndToNamed('/CustomTabBar');
                                                                                                                                                                        controller.update();
                                                                                                                                                                      }

                                                                                                                                                                      authController.phoneController.clear();
                                                                                                                                                                      otpController.otpController.clear();
                                                                                                                                                                    },
                                                                                                                                                              child: Container(
                                                                                                                                                                width: otpController.isLoading ? 60 : double.infinity,
                                                                                                                                                                height: 60,
                                                                                                                                                                decoration: BoxDecoration(
                                                                                                                                                                  borderRadius: BorderRadius.circular(12),
                                                                                                                                                                  color: otpController.enanble == false ? const Color(0XFFCCA750).withOpacity(.5) : const Color(0XFFCCA750),
                                                                                                                                                                ),
                                                                                                                                                                child: Center(
                                                                                                                                                                    child: otpController.isLoading
                                                                                                                                                                        ? const CircularProgressIndicator(
                                                                                                                                                                            color: Colors.white,
                                                                                                                                                                            strokeWidth: 5,
                                                                                                                                                                          )
                                                                                                                                                                        : Text(
                                                                                                                                                                            'تحقق',
                                                                                                                                                                            style: kWhite_text,
                                                                                                                                                                          )),
                                                                                                                                                              ),
                                                                                                                                                            );
                                                                                                                                                          } else {
                                                                                                                                                            return Container();
                                                                                                                                                          }
                                                                                                                                                        }),
                                                                                                                                                      ],
                                                                                                                                                    )),
                                                                                                                                                  ],
                                                                                                                                                )
                                                                                                                                              ]),
                                                                                                                                            ))),
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                              });
                                                                                                                        });
                                                                                                                  })
                                                                                                      ],
                                                                                                    ),
                                                                                                  )),
                                                                                                ],
                                                                                              )
                                                                                            ]),
                                                                                          ))),
                                                                                ),
                                                                              );
                                                                            });
                                                                      });
                                                                }),
                                                          ),
                                                          SizedBox(
                                                            height: heightApp *
                                                                0.02,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 0.0,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .selectedTab = 0;
                                                          Get.offAndToNamed(
                                                              '/CustomTabBar');
                                                          controller.update();
                                                        },
                                                        child: Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Container(
                                                            decoration:
                                                                const BoxDecoration(
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .black26,
                                                                    blurRadius:
                                                                        15,
                                                                  )
                                                                ]),
                                                            child:
                                                                const CircleAvatar(
                                                              radius: 18.0,
                                                              backgroundColor:
                                                                  Colors.white,
                                                              child: Icon(
                                                                  Icons.close,
                                                                  color: Colors
                                                                      .red),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    } else
                                               
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
                                                    "عزيزي المستفيد",
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
                                                                    '/OrderDetailsBenfitView');

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
                                                               controller.selectedTab = 0;
                          Get.offAllNamed('/CustomTabBar');
                          controller.update();
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
