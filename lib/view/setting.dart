import 'package:ekram_customer/controller/auth_controllers.dart';
import 'package:ekram_customer/controller/bottomNavBar_controllers.dart';
import 'package:ekram_customer/controller/orderDetailsSaveFood_controllers.dart';
import 'package:ekram_customer/controller/otp_controllers.dart';
import 'package:ekram_customer/controller/payment_controllers.dart';
import 'package:ekram_customer/controller/requestBenefit_controllers.dart';
import 'package:ekram_customer/controller/requsrSaveFood_controllers.dart';
import 'package:ekram_customer/database/Login_Stat_Controller.dart';
import 'package:ekram_customer/shared/style/Text_style.dart';
import 'package:ekram_customer/shared/widget/box_Text_Field.dart';
import 'package:ekram_customer/shared/widget/box_Text_Field_Payment.dart';
import 'package:ekram_customer/shared/widget/constants.dart';
import 'package:ekram_customer/shared/widget/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:timelines/timelines.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:ui' as ui;

import 'package:pin_code_fields/pin_code_fields.dart';

class SettingView extends StatelessWidget {
  final otpController = Get.put(OtpController());
  final authController = Get.put(AuthController());
  final loginStat = Get.put(LoginStateController());
  final controller = Get.put(BottomNavBarController());
  final requsetBenfitController = Get.put(RequsetBenfitController());

  final orderDetailsController = Get.put(OrderDetailsSaveFoodController());
  final paymentController = Get.put(PaymentController());
  final requsetSaveFoodController = Get.put(RequsetSaveFoodController());

  List<Price_Model> PriceList = [
    Price_Model(
      text: '10 ر.س',
    ),
    Price_Model(
      text: '50 ر.س',
    ),
    Price_Model(
      text: '500 ر.س',
    ),
  ];
  List<Projects_Model> ProjectsList = [
    Projects_Model(
      text: 'مشاريع الإطعام الخيري',
    ),
    Projects_Model(
      text: 'مشاريع حفظ النعمة',
    ),
    Projects_Model(
      text: 'مشاريع السقيا',
    ),
    Projects_Model(
      text: 'مشاريع الصدقة الجارية',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffF8F8F8),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (loginStat.loginState == 'notLogin' ||
              GetStorage().read('TypeUser') == null)
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                    height: 150,
                    decoration: BoxDecoration(color: Color(0xff07706D)),
                    child: Stack(children: <Widget>[
                      Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset("assets/images/Path.png")),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 12, right: 12, bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "مرحبا بك ...",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'din-next-lt-arabic Medium'),
                                ),
                                Text(
                                  "في تطبيق إكرام",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontFamily: 'din-next-lt-arabic Bold'),
                                ),
                              ],
                            ),
                            Image.asset("assets/images/ekram-logo.png")
                          ],
                        ),
                      ),
                    ])),
              ],
            ),
          if (loginStat.loginState == 'Login')
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                    height: 215,
                    decoration: BoxDecoration(color: Color(0xff07706D)),
                    child: Stack(children: <Widget>[
                      Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset("assets/images/Path.png")),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                    onTap:
                                        GetStorage().read('TypeUser') ==
                                                'Customer'
                                            ? () {
                                                showModalBottomSheet(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return GetBuilder<
                                                              AuthController>(
                                                          init:
                                                              AuthController(),
                                                          initState: (_) {},
                                                          builder: (_) {
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .only(
                                                                bottom: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets
                                                                    .bottom,
                                                              ),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: ClipRRect(
                                                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                                                                    child: Container(
                                                                        height: 443,
                                                                        color: Colors.white,
                                                                        child: Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(20.0),
                                                                          child:
                                                                              Column(children: [
                                                                            Container(
                                                                              width: 45,
                                                                              height: 5,
                                                                              decoration: BoxDecoration(color: Color(0xffD5D5D5), borderRadius: BorderRadius.circular(5)),
                                                                            ),
                                                                            SizedBox(
                                                                              height: heightApp * 0.02,
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    Container(
                                                                                      height: 30,
                                                                                      width: 4,
                                                                                      decoration: BoxDecoration(color: Color(0xff97A341), borderRadius: BorderRadius.circular(1)),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: widthApp * 0.02,
                                                                                    ),
                                                                                    Text(
                                                                                      'ألقابي',
                                                                                      style: TextStyle(color: Color(0XFFA2B156), fontSize: 18, fontFamily: 'din-next-lt-arabic Light'),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                                GestureDetector(
                                                                                  onTap: () {
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  child: SvgPicture.asset('assets/images/close.svg'),
                                                                                )
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: heightApp * 0.03,
                                                                            ),
                                                                            Column(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: <Widget>[
                                                                                Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                                                                                  Container(
                                                                                    height: 30,
                                                                                    width: 30,
                                                                                    decoration: BoxDecoration(color: Color(0XFFCCA750), borderRadius: BorderRadius.circular(11)),
                                                                                    child: Center(
                                                                                        child: Icon(
                                                                                      Icons.check_rounded,
                                                                                      color: Colors.white,
                                                                                    )),
                                                                                  ),
                                                                                  Stack(
                                                                                    children: [
                                                                                      Container(
                                                                                        height: 5,
                                                                                        width: 100,
                                                                                        color: Color(0XFFE1E2E3),
                                                                                      ),
                                                                                      Container(height: 5, width: 100, color: Color(0XFFCCA750)),
                                                                                    ],
                                                                                  ),
                                                                                  Container(
                                                                                    height: 30,
                                                                                    width: 30,
                                                                                    decoration: BoxDecoration(color: Color(0XFFCCA750), borderRadius: BorderRadius.circular(11)),
                                                                                    child: Center(
                                                                                        child: Icon(
                                                                                      Icons.check_rounded,
                                                                                      color: Colors.white,
                                                                                    )),
                                                                                  ),
                                                                                  Stack(
                                                                                    children: [
                                                                                      Container(
                                                                                        height: 5,
                                                                                        width: 100,
                                                                                        color: Color(0XFFE1E2E3),
                                                                                      ),
                                                                                      Container(height: 5, width: 40, color: Color(0XFFCCA750)),
                                                                                    ],
                                                                                  ),
                                                                                  Container(
                                                                                    height: 30,
                                                                                    width: 30,
                                                                                    decoration: BoxDecoration(color: Color(0XFFE1E2E3), borderRadius: BorderRadius.circular(11)),
                                                                                    // child: Center(child: Icon(Icons.check_rounded,color: Colors.white,)),
                                                                                  ),
                                                                                ]),
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: heightApp * 0.01,
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 20, right: 20),
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      Text('10'),
                                                                                      SizedBox(height: heightApp * 0.01),
                                                                                      Image.asset('assets/images/pronzemedal.png'),
                                                                                      SizedBox(height: heightApp * 0.01),
                                                                                      Text(
                                                                                        'صديق إكرام \n البرونزي',
                                                                                        style: TextStyle(color: Color(0xffBFA06B), fontSize: 15, fontFamily: 'din-next-lt-arabic Light'),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Column(
                                                                                    children: [
                                                                                      Text('100'),
                                                                                      SizedBox(height: heightApp * 0.01),
                                                                                      Image.asset('assets/images/medal.png'),
                                                                                      SizedBox(height: heightApp * 0.01),
                                                                                      Text(
                                                                                        'صديق إكرام \n الفضي',
                                                                                        style: TextStyle(color: Color(0xff839541), fontSize: 15, fontFamily: 'din-next-lt-arabic Light'),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Column(
                                                                                    children: [
                                                                                      Text('300'),
                                                                                      SizedBox(height: heightApp * 0.01),
                                                                                      Image.asset('assets/images/goldmedal.png'),
                                                                                      SizedBox(height: heightApp * 0.01),
                                                                                      Text(
                                                                                        'صديق إكرام \n الذهبي',
                                                                                        style: TextStyle(color: Color(0xffCFAD32), fontSize: 15, fontFamily: 'din-next-lt-arabic Light'),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            SizedBox(height: heightApp * 0.04),
                                                                            Container(
                                                                              height: 72,
                                                                              width: 368,
                                                                              decoration: BoxDecoration(color: Color(0xffF8F8F8), borderRadius: BorderRadius.circular(10)),
                                                                              child: Center(
                                                                                child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                                  Text(
                                                                                    ' رحلاتي في حفظ النعمة : 120',
                                                                                    style: TextStyle(color: Color(0xff839541), fontSize: 15, fontFamily: 'din-next-lt-arabic Light'),
                                                                                  ),
                                                                                  Text(
                                                                                    'المتبقي على الهدف القادم : 180',
                                                                                    style: TextStyle(color: Color(0xffCFAD32), fontSize: 15, fontFamily: 'din-next-lt-arabic Light'),
                                                                                  )
                                                                                ]),
                                                                              ),
                                                                            )
                                                                          ]),
                                                                        ))),
                                                              ),
                                                            );
                                                          });
                                                    });
                                              }
                                            : () {
                                                showModalBottomSheet(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return GetBuilder<
                                                              AuthController>(
                                                          init:
                                                              AuthController(),
                                                          initState: (_) {},
                                                          builder: (_) {
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .only(
                                                                bottom: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets
                                                                    .bottom,
                                                              ),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: ClipRRect(
                                                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                                                                    child: Container(
                                                                        height: 443,
                                                                        color: Colors.white,
                                                                        child: Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(20.0),
                                                                          child:
                                                                              Column(children: [
                                                                            Container(
                                                                              width: 45,
                                                                              height: 5,
                                                                              decoration: BoxDecoration(color: Color(0xffD5D5D5), borderRadius: BorderRadius.circular(5)),
                                                                            ),
                                                                            SizedBox(
                                                                              height: heightApp * 0.02,
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    Container(
                                                                                      height: 30,
                                                                                      width: 4,
                                                                                      decoration: BoxDecoration(color: Color(0xff97A341), borderRadius: BorderRadius.circular(1)),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: widthApp * 0.02,
                                                                                    ),
                                                                                    Text(
                                                                                      'ألقابي',
                                                                                      style: TextStyle(color: Color(0XFFA2B156), fontSize: 18, fontFamily: 'din-next-lt-arabic Light'),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                                GestureDetector(
                                                                                  onTap: () {
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  child: SvgPicture.asset('assets/images/close.svg'),
                                                                                )
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: heightApp * 0.03,
                                                                            ),
                                                                            Column(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: <Widget>[
                                                                                Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                                                                                  Container(
                                                                                    height: 30,
                                                                                    width: 30,
                                                                                    decoration: BoxDecoration(color: Color(0XFFCCA750), borderRadius: BorderRadius.circular(11)),
                                                                                    child: Center(
                                                                                        child: Icon(
                                                                                      Icons.check_rounded,
                                                                                      color: Colors.white,
                                                                                    )),
                                                                                  ),
                                                                                  Stack(
                                                                                    children: [
                                                                                      Container(
                                                                                        height: 5,
                                                                                        width: 100,
                                                                                        color: Color(0XFFE1E2E3),
                                                                                      ),
                                                                                      Container(height: 5, width: 100, color: Color(0XFFCCA750)),
                                                                                    ],
                                                                                  ),
                                                                                  Container(
                                                                                    height: 30,
                                                                                    width: 30,
                                                                                    decoration: BoxDecoration(color: Color(0XFFCCA750), borderRadius: BorderRadius.circular(11)),
                                                                                    child: Center(
                                                                                        child: Icon(
                                                                                      Icons.check_rounded,
                                                                                      color: Colors.white,
                                                                                    )),
                                                                                  ),
                                                                                  Stack(
                                                                                    children: [
                                                                                      Container(
                                                                                        height: 5,
                                                                                        width: 100,
                                                                                        color: Color(0XFFE1E2E3),
                                                                                      ),
                                                                                      Container(height: 5, width: 40, color: Color(0XFFCCA750)),
                                                                                    ],
                                                                                  ),
                                                                                  Container(
                                                                                    height: 30,
                                                                                    width: 30,
                                                                                    decoration: BoxDecoration(color: Color(0XFFE1E2E3), borderRadius: BorderRadius.circular(11)),
                                                                                    // child: Center(child: Icon(Icons.check_rounded,color: Colors.white,)),
                                                                                  ),
                                                                                ]),
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: heightApp * 0.01,
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 20, right: 20),
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      Text('1000'),
                                                                                      SizedBox(height: heightApp * 0.01),
                                                                                      Image.asset('assets/images/pronzemedal.png'),
                                                                                      SizedBox(height: heightApp * 0.01),
                                                                                      Text(
                                                                                        'شريك إكرام \n البرونزي',
                                                                                        style: TextStyle(color: Color(0xffBFA06B), fontSize: 15, fontFamily: 'din-next-lt-arabic Light'),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Column(
                                                                                    children: [
                                                                                      Text('5000'),
                                                                                      SizedBox(height: heightApp * 0.01),
                                                                                      Image.asset('assets/images/medal.png'),
                                                                                      SizedBox(height: heightApp * 0.01),
                                                                                      Text(
                                                                                        'شريك إكرام \n الفضي',
                                                                                        style: TextStyle(color: Color(0xff839541), fontSize: 15, fontFamily: 'din-next-lt-arabic Light'),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Column(
                                                                                    children: [
                                                                                      Text('10000'),
                                                                                      SizedBox(height: heightApp * 0.01),
                                                                                      Image.asset('assets/images/goldmedal.png'),
                                                                                      SizedBox(height: heightApp * 0.01),
                                                                                      Text(
                                                                                        'شريك إكرام \n الذهبي',
                                                                                        style: TextStyle(color: Color(0xffCFAD32), fontSize: 15, fontFamily: 'din-next-lt-arabic Light'),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            SizedBox(height: heightApp * 0.04),
                                                                            Container(
                                                                              height: 72,
                                                                              width: 368,
                                                                              decoration: BoxDecoration(color: Color(0xffF8F8F8), borderRadius: BorderRadius.circular(10)),
                                                                              child: Center(
                                                                                child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                                  Text(
                                                                                    ' رحلاتي في حفظ النعمة : 120',
                                                                                    style: TextStyle(color: Color(0xff839541), fontSize: 15, fontFamily: 'din-next-lt-arabic Light'),
                                                                                  ),
                                                                                  Text(
                                                                                    'المتبقي على الهدف القادم : 180',
                                                                                    style: TextStyle(color: Color(0xffCFAD32), fontSize: 15, fontFamily: 'din-next-lt-arabic Light'),
                                                                                  )
                                                                                ]),
                                                                              ),
                                                                            )
                                                                          ]),
                                                                        ))),
                                                              ),
                                                            );
                                                          });
                                                    });
                                              },
                                    child:
                                        Image.asset('assets/images/medal.png')),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (loginStat.loginState == 'Login' &&
                                        GetStorage().read('TypeUser') ==
                                            'Customer')
                                      Row(
                                        children: [
                                          Text(
                                            " مرحبا بك  ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontFamily:
                                                    'din-next-lt-arabic Medium'),
                                          ),
                                          Text(
                                            "صديق إكرام الفضي..",
                                            style: TextStyle(
                                                color: Color(0XFFB6DA4E),
                                                fontSize: 15,
                                                fontFamily:
                                                    'din-next-lt-arabic Medium'),
                                          ),
                                        ],
                                      )
                                    else if (loginStat.loginState == 'Login' &&
                                        GetStorage().read('TypeUser') ==
                                            'Business')
                                      Row(
                                        children: [
                                          Text(
                                            " مرحبا بك  ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontFamily:
                                                    'din-next-lt-arabic Medium'),
                                          ),
                                          Text(
                                            "شريك إكرام الفضي..",
                                            style: TextStyle(
                                                color: Color(0XFFB6DA4E),
                                                fontSize: 15,
                                                fontFamily:
                                                    'din-next-lt-arabic Medium'),
                                          ),
                                        ],
                                      ),
                                    if (loginStat.loginState != 'Login')
                                      Text(
                                        "مرحبا بك",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily:
                                                'din-next-lt-arabic Medium'),
                                      )
                                    else if (loginStat.loginState == 'Login' &&
                                        GetStorage().read('TypeUser') ==
                                            'Customer')
                                      Text(
                                        "أفنان أحمد العلاوي",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontFamily:
                                                'din-next-lt-arabic Bold'),
                                      )
                                    else if (loginStat.loginState == 'Login' &&
                                        GetStorage().read('TypeUser') ==
                                            'Business')
                                      Text(
                                        "فنادق ومنتجعات هيلتون",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontFamily:
                                                'din-next-lt-arabic Bold'),
                                      ),
                                    if (loginStat.loginState == 'notLogin')
                                      Text(
                                        "في تطبيق إكرام",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontFamily:
                                                'din-next-lt-arabic Bold'),
                                      )
                                  ],
                                ),
                              ],
                            ),
                            if (loginStat.loginState == 'Login')
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed('/ProfileView');
                                },
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: Color(0xffD2D2D2).withOpacity(.2),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Icon(
                                      Icons.person_2,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ])),
                FractionalTranslation(
                  translation: Offset(0.0, 0.5),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      width: 368,
                      height: 120,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 22, left: 22, right: 22),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                SvgPicture.asset(
                                    'assets/images/compluteTrip.svg'),
                                Text(
                                  'رحلاتي في حفظ النعمة',
                                  style: TextStyle(
                                      color: Color(0XFFCCA750),
                                      fontSize: 12,
                                      fontFamily: 'din-next-lt-arabic Bold'),
                                ),
                                Text(
                                  '120',
                                  style: TextStyle(
                                      color: Color(0XFFA2B156),
                                      fontSize: 18,
                                      fontFamily: 'din-next-lt-arabic Light'),
                                )
                              ],
                            ),
                            const Spacer(),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.1 / 2,
                              width: 1,
                              color: Color(0xffEEEEEE),
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                            ),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/NumberBenefitNow.svg'
                               ),
                                Text(
                                  'عدد المستفيدين',
                                  style: TextStyle(
                                      color: Color(0XFFCCA750),
                                      fontSize: 12,
                                      fontFamily: 'din-next-lt-arabic Bold'),
                                ),
                                Text(
                                  '1521',
                                  style: TextStyle(
                                      color: Color(0XFFA2B156),
                                      fontSize: 18,
                                      fontFamily: 'din-next-lt-arabic Light'),
                                )
                              ],
                            ),
                            const Spacer(),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.1 / 2,
                              width: 1,
                              color: Color(0xffEEEEEE),
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                            ),
                            Column(
                              children: [
                                SvgPicture.asset('assets/images/Total.svg'),
                                Text(
                                  'اجمالي تبرعاتي',
                                  style: TextStyle(
                                      color: Color(0XFFCCA750),
                                      fontSize: 12,
                                      fontFamily: 'din-next-lt-arabic Bold'),
                                ),
                                Text(
                                  '7,412' + 'ريال',
                                  style: TextStyle(
                                      color: Color(0XFFA2B156),
                                      fontSize: 18,
                                      fontFamily: 'din-next-lt-arabic Light'),
                                )
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      )),
                )
              ],
            ),
          if (loginStat.loginState == 'Login')
            SizedBox(height: heightApp * 0.06),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                // height: 379,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Color(0XFFF8F8F8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 20, bottom: 20),
                  child: Column(
                    children: [
                      if (loginStat.loginState == 'notLogin')
                        Text(
                          "يرجى تسجيل الدخول حتى تستطيع استخدام التطبيق بشكل كامل",
                          style: TextStyle(
                              color: Color(0xff55585D),
                              fontSize: 14,
                              fontFamily: 'din-next-lt-arabic light'),
                        ),
                      SizedBox(
                        height: heightApp * 0.02,
                      ),
                      if (loginStat.loginState == 'notLogin')
                        MainButton(
                            color: Color(0XFFCCA750),
                            text: "تسجيل الدخول/ تسجيل",
                            press: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return GetBuilder<AuthController>(
                                        init: AuthController(),
                                        initState: (_) {},
                                        builder: (_) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom,
                                            ),
                                            child: SingleChildScrollView(
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  20.0)),
                                                  child: Container(
                                                      height: 349,
                                                      color: Colors.white,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(20.0),
                                                        child: Column(
                                                            children: [
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
                                                                children: <Widget>[
                                                                  Expanded(
                                                                      child:
                                                                          Form(
                                                                    key: authController
                                                                        .LoginFormKey,
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        BoxTextField(
                                                                            controller: authController
                                                                                .phoneController,
                                                                            onSaved:
                                                                                (value) {
                                                                              authController.phone = value;
                                                                            },
                                                                            onChanged:
                                                                                (value) {
                                                                              authController.phone = value;
                                                                              authController.phoneController.text.length == 9 ? authController.enanble = true : authController.enanble = false;

                                                                              authController.update();
                                                                            },
                                                                            validator:
                                                                                (value) {
                                                                              return authController.validateMobile(value!);
                                                                            },
                                                                            text:
                                                                                'تسجيل الدخول / التسجيل'),
                                                                        SizedBox(
                                                                          height:
                                                                              heightApp * 0.01,
                                                                        ),
                                                                        Text(
                                                                          'بالضغط على تسجيل الدخول, فأنت توافق على',
                                                                          style: TextStyle(
                                                                              color: Color(0xff55585D),
                                                                              fontSize: 14,
                                                                              fontFamily: 'din-next-lt-arabic light'),
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
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
                                                                          height:
                                                                              heightApp * 0.02,
                                                                        ),
                                                                        MainButton(
                                                                            color: authController.enanble == false
                                                                                ? const Color(0XFFCCA750).withOpacity(.5)
                                                                                : const Color(0XFFCCA750),
                                                                            text: "تسجيل",
                                                                            press: authController.enanble == false
                                                                                ? null
                                                                                : () {
                                                                                    if (authController.phoneController.text.toString() == '566220639') {
                                                                                      GetStorage().write('TypeUser', 'Customer');
                                                                                      GetStorage().write('Name', 'أفنان');
                                                                                      GetStorage().write('Phone', '0566220639');
                                                                                      requsetSaveFoodController.nameController.text = GetStorage().read('Name').toString();
                                                                                      requsetSaveFoodController.phoneController.text = GetStorage().read('Phone').toString();
                                                                                      requsetBenfitController.nameController.text = GetStorage().read('Name').toString();
                                                                                      requsetBenfitController.phoneController.text = GetStorage().read('Phone').toString();
                                                                                    } else if (authController.phoneController.text.toString() == '555543537') {
                                                                                      GetStorage().write('TypeUser', 'Business');
                                                                                      controller.selectedTab = 0;
                                                                                      Get.offAndToNamed('/CustomTabBar');
                                                                                      controller.update();
                                                                                    }
                                                                                    requsetSaveFoodController.update();
                                                                                    requsetBenfitController.update();

                                                                                    authController.update();
                                                                                    Navigator.pop(context);

                                                                                    showModalBottomSheet(
                                                                                        context: context,
                                                                                        builder: (BuildContext context1) {
                                                                                          return GetBuilder<OtpController>(
                                                                                              init: OtpController(),
                                                                                              initState: (_) {},
                                                                                              builder: (_) {
                                                                                                return Padding(
                                                                                                  padding: EdgeInsets.only(
                                                                                                    bottom: MediaQuery.of(context1).viewInsets.bottom,
                                                                                                  ),
                                                                                                  child: SingleChildScrollView(
                                                                                                    child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                                                                                                        child: Container(
                                                                                                            height: 349,
                                                                                                            color: Colors.white,
                                                                                                            child: Padding(
                                                                                                              padding: const EdgeInsets.all(20.0),
                                                                                                              child: Column(children: [
                                                                                                                Container(
                                                                                                                  width: 45,
                                                                                                                  height: 5,
                                                                                                                  decoration: BoxDecoration(color: Color(0xffD5D5D5), borderRadius: BorderRadius.circular(5)),
                                                                                                                ),
                                                                                                                SizedBox(
                                                                                                                  height: heightApp * 0.02,
                                                                                                                ),
                                                                                                                Row(
                                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      "ادخل رمز التحقق المرسل الى ",
                                                                                                                      style: TextStyle(color: Color(0xff55585D), fontSize: 15, fontFamily: 'din-next-lt-arabic light'),
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      authController.phoneController.text.toString(),
                                                                                                                      textDirection: TextDirection.ltr,
                                                                                                                      style: TextStyle(color: Color(0xffCCA750), fontSize: 15, fontFamily: 'din-next-lt-arabic light'),
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
                                                                                                                              textDirection: TextDirection.ltr,
                                                                                                                              child: PinCodeTextField(
                                                                                                                                controller: otpController.otpController,
                                                                                                                                cursorColor: Color(0XFFCCA750),
                                                                                                                                textStyle: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'din-next-lt-arabic light'),
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
                                                                                                                                  activeColor: Color(0XFFF2F2F2),
                                                                                                                                  activeFillColor: Color(0XFFF2F2F2),
                                                                                                                                  inactiveFillColor: Color(0XFFF2F2F2),
                                                                                                                                  inactiveColor: Color(0XFFF2F2F2),
                                                                                                                                  borderWidth: 2,
                                                                                                                                  selectedColor: Color(0XFFF2F2F2),
                                                                                                                                  selectedFillColor: Color(0XFFF2F2F2),
                                                                                                                                ),
                                                                                                                                animationDuration: Duration(milliseconds: 300),
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
                                                                                                                                      Text(
                                                                                                                                        ' إعادة إرسال الرمز بعد ',
                                                                                                                                        style: TextStyle(color: Color(0xff55585D), fontSize: 14, fontFamily: 'din-next-lt-arabic light'),
                                                                                                                                      ),
                                                                                                                                      !otpController.timeOutTimer.value || otpController.codeError.value
                                                                                                                                          ? Timer1(
                                                                                                                                              controller: otpController,
                                                                                                                                            )
                                                                                                                                          : Text(
                                                                                                                                              "0",
                                                                                                                                              style: TextStyle(color: Color(0xffA2B156), fontSize: 14, fontFamily: 'din-next-lt-arabic light'),
                                                                                                                                            ),
                                                                                                                                      Text(
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
                                                                                                                                            child: Text(
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
                                                                                                                                        controller.update();
                                                                                                                                      } else {
                                                                                                                                        loginStat.changeLoginState('Login');

                                                                                                                                        controller.selectedTab = 0;
                                                                                                                                        Get.offAndToNamed('/CustomTabBar');
                                                                                                                                        controller.update();
                                                                                                                                      }
                                                                                                                                      authController.phoneController.clear();
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
                                                                                                                                        ? CircularProgressIndicator(
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
                      if (loginStat.loginState != 'Login')
                        SizedBox(
                          height: heightApp * 0.02,
                        ),
                      if (loginStat.loginState == 'Login' &&
                          GetStorage().read('TypeUser') == 'Customer')
                        SingleChildScrollView(
                          child: Container(
                            height: loginStat.loginState == 'Login' ? 480 : 360,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Color(0xffEEEEEE))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(children: [
                                SizedBox(
                                  height: heightApp * 0.02,
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.offAllNamed('/NotificationView');
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                  "assets/images/notification.svg"),
                                              SizedBox(
                                                width: widthApp * 0.01,
                                              ),
                                              Text(
                                                "الاشعارات",
                                                style: TextStyle(
                                                    color: Color(0xff504E49),
                                                    fontSize: 15,
                                                    fontFamily:
                                                        'din-next-lt-arabic light'),
                                              ),
                                            ],
                                          ),
                                          SvgPicture.asset(
                                              "assets/images/Iconly-Light-Arrow - Right 2.svg")
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.01,
                                    ),
                                    Divider(
                                      color: Color(0xffEEEEEE),
                                      thickness: 1.0,
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.01,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed('/AboutView');
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                  "assets/images/info.svg"),
                                              SizedBox(
                                                width: widthApp * 0.01,
                                              ),
                                              Text(
                                                "عن إكرام",
                                                style: TextStyle(
                                                    color: Color(0xff504E49),
                                                    fontSize: 15,
                                                    fontFamily:
                                                        'din-next-lt-arabic light'),
                                              ),
                                            ],
                                          ),
                                          SvgPicture.asset(
                                              "assets/images/Iconly-Light-Arrow - Right 2.svg")
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.01,
                                    ),
                                    Divider(
                                      color: Color(0xffEEEEEE),
                                      thickness: 1.0,
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.01,
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/CommonQuestionView');
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                              "assets/images/faq.svg"),
                                          SizedBox(
                                            width: widthApp * 0.01,
                                          ),
                                          Text(
                                            "الأسئلة الشائعة",
                                            style: TextStyle(
                                                color: Color(0xff504E49),
                                                fontSize: 15,
                                                fontFamily:
                                                    'din-next-lt-arabic light'),
                                          ),
                                        ],
                                      ),
                                      SvgPicture.asset(
                                          "assets/images/Iconly-Light-Arrow - Right 2.svg")
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: heightApp * 0.01,
                                ),
                                Divider(
                                  color: Color(0xffEEEEEE),
                                  thickness: 1.0,
                                ),
                                SizedBox(
                                  height: heightApp * 0.01,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/ContactView');
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                              "assets/images/customer-support.svg"),
                                          SizedBox(
                                            width: widthApp * 0.01,
                                          ),
                                          Text(
                                            "تواصل معنا",
                                            style: TextStyle(
                                                color: Color(0xff504E49),
                                                fontSize: 15,
                                                fontFamily:
                                                    'din-next-lt-arabic light'),
                                          ),
                                        ],
                                      ),
                                      SvgPicture.asset(
                                          "assets/images/Iconly-Light-Arrow - Right 2.svg")
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: heightApp * 0.01,
                                ),
                                Divider(
                                  color: Color(0xffEEEEEE),
                                  thickness: 1.0,
                                ),
                                SizedBox(
                                  height: heightApp * 0.01,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                              "assets/images/language.svg"),
                                          SizedBox(
                                            width: widthApp * 0.01,
                                          ),
                                          Text(
                                            "اللغة (العربية)",
                                            style: TextStyle(
                                                color: Color(0xff504E49),
                                                fontSize: 15,
                                                fontFamily:
                                                    'din-next-lt-arabic light'),
                                          ),
                                        ],
                                      ),
                                      SvgPicture.asset(
                                          "assets/images/Iconly-Light-Arrow - Right 2.svg")
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: heightApp * 0.01,
                                ),
                                Divider(
                                  color: Color(0xffEEEEEE),
                                  thickness: 1.0,
                                ),
                                SizedBox(
                                  height: heightApp * 0.01,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          // Future.delayed(Duration(seconds: 2),
                                          //     () {
                                          //   controller.selectedTab = 0;
                                          //   Get.offAndToNamed('/CustomTabBar');
                                          //   controller.update();
                                          // });
                                          return Dialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16.0)),
                                            elevation: 0.0,
                                            backgroundColor: Colors.transparent,
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: 0.0, right: 0.0),
                                              child: Stack(
                                                children: <Widget>[
                                                  Container(
                                                    height: 205,
                                                    width: 368,
                                                    // padding: EdgeInsets.only(
                                                    //   top: 18.0,
                                                    // ),
                                                    margin: EdgeInsets.only(
                                                        top: 8.0, left: 8.0),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        shape:
                                                            BoxShape.rectangle,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        boxShadow: <BoxShadow>[
                                                          BoxShadow(
                                                            color:
                                                                Colors.black26,
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
                                                        // Text(
                                                        //   "تقييم التطبيق ",
                                                        //   style: TextStyle(
                                                        //       color: Color(
                                                        //           0XFFCCA750),
                                                        //       fontSize: 24,
                                                        //       fontFamily:
                                                        //           'din-next-lt-arabic light'),
                                                        // ),
                                                        SizedBox(
                                                          height:
                                                              heightApp * 0.01,
                                                        ),
                                                        SizedBox(
                                                          child:
                                                              RatingBar.builder(
                                                            wrapAlignment:
                                                                WrapAlignment
                                                                    .end,
                                                            unratedColor: Color(
                                                                0xffE4E4E4),
                                                            itemSize: 50,
                                                            initialRating: 0,
                                                            minRating: 1,
                                                            direction:
                                                                Axis.horizontal,
                                                            allowHalfRating:
                                                                true,
                                                            itemCount: 5,
                                                            itemPadding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        2.0),
                                                            itemBuilder:
                                                                (context, _) =>
                                                                    Icon(
                                                              Icons
                                                                  .star_rate_rounded,
                                                              color:
                                                                  Colors.amber,
                                                            ),
                                                            onRatingUpdate:
                                                                (rating) {
                                                              print(rating);
                                                            },
                                                          ),
                                                        ),

                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(22.0),
                                                          child: MainButton(
                                                              color: Color(
                                                                  0XFFCCA750),
                                                              text: 'إرسال',
                                                              press: () {
                                                                Navigator.pop(
                                                                    context);
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      Future.delayed(
                                                                          Duration(
                                                                              seconds: 2),
                                                                          () {
                                                                        controller
                                                                            .selectedTab = 0;
                                                                        Get.offAndToNamed(
                                                                            '/CustomTabBar');
                                                                        controller
                                                                            .update();
                                                                      });
                                                                      return Dialog(
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0)),
                                                                        elevation:
                                                                            0.0,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        child:
                                                                            Container(
                                                                          margin: EdgeInsets.only(
                                                                              left: 0.0,
                                                                              right: 0.0),
                                                                          child:
                                                                              Stack(
                                                                            children: <Widget>[
                                                                              Container(
                                                                                height: 305,
                                                                                width: 368,
                                                                                padding: EdgeInsets.only(
                                                                                  top: 18.0,
                                                                                ),
                                                                                margin: EdgeInsets.only(top: 13.0, left: 8.0),
                                                                                decoration: BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(16.0), boxShadow: <BoxShadow>[
                                                                                  BoxShadow(
                                                                                    color: Colors.black26,
                                                                                    blurRadius: 0.0,
                                                                                    offset: Offset(0.0, 0.0),
                                                                                  ),
                                                                                ]),
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: <Widget>[
                                                                                    SizedBox(
                                                                                      height: heightApp * 0.04,
                                                                                    ),
                                                                                    SvgPicture.asset('assets/images/thanks.svg'),
                                                                                    SizedBox(
                                                                                      height: heightApp * 0.02,
                                                                                    ),
                                                                                    Text(
                                                                                      "شكرا",
                                                                                      style: TextStyle(color: Color(0XFFCCA750), fontSize: 24, fontFamily: 'din-next-lt-arabic light'),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: heightApp * 0.01,
                                                                                    ),
                                                                                    Text(
                                                                                      "تمت عملية التقييم بنجاح",
                                                                                      style: TextStyle(color: Color(0xff55585D), fontSize: 18, fontFamily: 'din-next-lt-arabic light'),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: heightApp * 0.04,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Positioned(
                                                                                left: 0.0,
                                                                                child: GestureDetector(
                                                                                  onTap: () {
                                                                                    controller.selectedTab = 0;
                                                                                    Get.offAndToNamed('/CustomTabBar');
                                                                                    controller.update();
                                                                                  },
                                                                                  child: Align(
                                                                                    alignment: Alignment.topLeft,
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(boxShadow: [
                                                                                        BoxShadow(
                                                                                          color: Colors.black26,
                                                                                          blurRadius: 15,
                                                                                        )
                                                                                      ]),
                                                                                      child: CircleAvatar(
                                                                                        radius: 18.0,
                                                                                        backgroundColor: Colors.white,
                                                                                        child: Icon(Icons.close, color: Colors.red),
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
                                                              }),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 0.0,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        controller.selectedTab =
                                                            0;
                                                        Get.offAndToNamed(
                                                            '/CustomTabBar');
                                                        controller.update();
                                                      },
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                  boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .black26,
                                                                  blurRadius:
                                                                      15,
                                                                )
                                                              ]),
                                                          child: CircleAvatar(
                                                            radius: 18.0,
                                                            backgroundColor:
                                                                Colors.white,
                                                            child: Icon(
                                                                Icons.close,
                                                                color:
                                                                    Colors.red),
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
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                              "assets/images/star.svg"),
                                          SizedBox(
                                            width: widthApp * 0.01,
                                          ),
                                          Text(
                                            "تقييم التطبيق",
                                            style: TextStyle(
                                                color: Color(0xff504E49),
                                                fontSize: 15,
                                                fontFamily:
                                                    'din-next-lt-arabic light'),
                                          ),
                                        ],
                                      ),
                                      SvgPicture.asset(
                                          "assets/images/Iconly-Light-Arrow - Right 2.svg")
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: heightApp * 0.01,
                                ),
                                Divider(
                                  color: Color(0xffEEEEEE),
                                  thickness: 1.0,
                                ),
                                SizedBox(
                                  height: heightApp * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/images/share.svg"),
                                        SizedBox(
                                          width: widthApp * 0.01,
                                        ),
                                        Text(
                                          "مشاركة التطبيق",
                                          style: TextStyle(
                                              color: Color(0xff504E49),
                                              fontSize: 15,
                                              fontFamily:
                                                  'din-next-lt-arabic light'),
                                        ),
                                      ],
                                    ),
                                    SvgPicture.asset(
                                        "assets/images/Iconly-Light-Arrow - Right 2.svg")
                                  ],
                                ),
                                if (loginStat.loginState == 'Login')
                                  SizedBox(
                                    height: heightApp * 0.01,
                                  ),
                                if (loginStat.loginState == 'Login')
                                  Divider(
                                    color: Color(0xffEEEEEE),
                                    thickness: 1.0,
                                  ),
                                if (loginStat.loginState == 'Login')
                                  SizedBox(
                                    height: heightApp * 0.01,
                                  ),
                                if (loginStat.loginState == 'Login')
                                  GestureDetector(
                                    onTap: () {
                                      controller.selectedTab = 0;
                                      Get.offAllNamed('/CustomTabBar');
                                      controller.update();
                                      GetStorage().remove('TypeUser');
                                      loginStat.changeLoginState('notLogin');

                                      GetStorage().remove('Name');
                                      GetStorage().remove('Phone');
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                                "assets/images/logout.svg"),
                                            SizedBox(
                                              width: widthApp * 0.01,
                                            ),
                                            Text(
                                              "تسجيل الخروج",
                                              style: TextStyle(
                                                  color: Color(0xffBC2131),
                                                  fontSize: 15,
                                                  fontFamily:
                                                      'din-next-lt-arabic light'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                SizedBox(
                                  height: heightApp * 0.01,
                                ),
                              ]),
                            ),
                          ),
                        )
                      else if (loginStat.loginState == 'Login' &&
                          GetStorage().read('TypeUser') == 'Business')
                        SingleChildScrollView(
                          child: Container(
                            height: loginStat.loginState == 'Login' ? 300 : 360,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Color(0xffEEEEEE))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(children: [
                                SizedBox(
                                  height: heightApp * 0.02,
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.offAllNamed('/NotificationView');
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                  "assets/images/notification.svg"),
                                              SizedBox(
                                                width: widthApp * 0.01,
                                              ),
                                              Text(
                                                "الاشعارات",
                                                style: TextStyle(
                                                    color: Color(0xff504E49),
                                                    fontSize: 15,
                                                    fontFamily:
                                                        'din-next-lt-arabic light'),
                                              ),
                                            ],
                                          ),
                                          SvgPicture.asset(
                                              "assets/images/Iconly-Light-Arrow - Right 2.svg")
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.01,
                                    ),
                                    Divider(
                                      color: Color(0xffEEEEEE),
                                      thickness: 1.0,
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.01,
                                    ),
                                  ],
                                ),

                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            backgroundColor:
                                                const Color(0XFFF8F8F8),
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                topRight: Radius.circular(10.0),
                                              ),
                                            ),
                                            builder: (BuildContext context) {
                                              return GetBuilder<
                                                      PaymentController>(
                                                  init: PaymentController(),
                                                  initState: (_) {},
                                                  builder: (_) {
                                                    return Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.70,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 20,
                                                                right: 20),
                                                        child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height:
                                                                    heightApp *
                                                                        0.02,
                                                              ),
                                                              // Container(
                                                              //   alignment: Alignment.center,
                                                              //   width: 45,
                                                              //   height: 5,
                                                              //   decoration: BoxDecoration(
                                                              //       color: const Color(
                                                              //           0xffD5D5D5),
                                                              //       borderRadius:
                                                              //           BorderRadius.circular(
                                                              //               5)),
                                                              // ),
                                                              SizedBox(
                                                                height:
                                                                    heightApp *
                                                                        0.02,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  const Text(
                                                                    "التبرع السريع",
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0XFFA2B156),
                                                                        fontSize:
                                                                            20,
                                                                        fontFamily:
                                                                            'din-next-lt-arabic Medium'),
                                                                  ),
                                                                  GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: SvgPicture
                                                                          .asset(
                                                                              'assets/images/close_black.svg'))
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    heightApp *
                                                                        0.02,
                                                              ),
                                                              const Divider(
                                                                thickness: 1,
                                                                color: Color(
                                                                    0xffE4E4E4),
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    heightApp *
                                                                        0.02,
                                                              ),
                                                              SizedBox(
                                                                  height: 140,
                                                                  child: GridView
                                                                      .builder(
                                                                          physics:
                                                                              NeverScrollableScrollPhysics(),
                                                                          shrinkWrap:
                                                                              true,
                                                                          itemCount: ProjectsList
                                                                              .length,
                                                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                              crossAxisCount:
                                                                                  2,
                                                                              childAspectRatio:
                                                                                  3.0),
                                                                          itemBuilder:
                                                                              (context, i) {
                                                                            return Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: GestureDetector(
                                                                                onTap: () {
                                                                                  paymentController.onSelectCat2(i);
                                                                                  paymentController.update();
                                                                                },
                                                                                child: Container(
                                                                                  // padding: EdgeInsets.all(9),
                                                                                  height: 70,
                                                                                  width: 111,
                                                                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: paymentController.selectedCatIndex2 != i ? const Color(0xffEEEEEE) : const Color(0XFFCCA750))),
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      ProjectsList[i].text.toString(),
                                                                                      style: TextStyle(color: paymentController.selectedCatIndex2 != i ? Color(0xff878787) : const Color(0XFFCCA750), fontSize: 15, fontFamily: 'din-next-lt-arabic Light'),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          })),
                                                              Text(
                                                                'مبلغ المساهمة',
                                                                style: TextStyle(
                                                                    color: const Color(
                                                                        0XFFCCA750),
                                                                    fontSize:
                                                                        15,
                                                                    fontFamily:
                                                                        'din-next-lt-arabic Light'),
                                                              ),
                                                              SizedBox(
                                                                height: 90,
                                                                child: Row(
                                                                  children: [
                                                                    ListView
                                                                        .separated(
                                                                      separatorBuilder:
                                                                          (context,
                                                                              index) {
                                                                        return SizedBox(
                                                                          width:
                                                                              widthApp * 0.01,
                                                                        );
                                                                      },
                                                                      shrinkWrap:
                                                                          true,
                                                                      // padding: EdgeInsets.all(9),
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      itemCount:
                                                                          PriceList
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              i) {
                                                                        return Row(
                                                                          children: [
                                                                            GestureDetector(
                                                                              onTap: () {
                                                                                paymentController.onSelectCat(i);
                                                                                paymentController.update();
                                                                              },
                                                                              child: Container(
                                                                                // padding: EdgeInsets.all(9),
                                                                                height: 39,
                                                                                width: 61,
                                                                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: paymentController.selectedCatIndex != i ? const Color(0xffEEEEEE) : const Color(0XFFCCA750))),
                                                                                child: Center(
                                                                                  child: Text(
                                                                                    PriceList[i].text.toString(),
                                                                                    style: TextStyle(color: paymentController.selectedCatIndex != i ? Color(0xff878787) : const Color(0XFFCCA750), fontSize: 14, fontFamily: 'din-next-lt-arabic Light'),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ),
                                                                    SizedBox(
                                                                      width: widthApp *
                                                                          0.01,
                                                                    ),
                                                                    SizedBox(
                                                                       width:
                                                                          150,
                                                                      height:
                                                                          39,
                                                                      child: BoxTextFieldPayment(
                                                                          onChanged: (value) {
                                                                            paymentController.update();
                                                                          },
                                                                          controller: paymentController.salaryController,
                                                                          text: 'text'),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),

                                                              Text(
                                                                'سيذهب تبرعك تلقائيًا للمشاريع الأكثر احتياجًا',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff878787),
                                                                    fontSize:
                                                                        15,
                                                                    fontFamily:
                                                                        'din-next-lt-arabic Light'),
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    heightApp *
                                                                        0.02,
                                                              ),
                                                              Center(
                                                                child: SizedBox(
                                                                  width: 200,
                                                                  child: Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Container(
                                                                          height:
                                                                              28,
                                                                          width:
                                                                              54,
                                                                          decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              border: Border.all(color: const Color(0xffEEEEEE))),
                                                                          child: Image.asset('assets/images/visa.png')),
                                                                      Container(
                                                                          height:
                                                                              28,
                                                                          width:
                                                                              54,
                                                                          decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              border: Border.all(color: const Color(0xffEEEEEE))),
                                                                          child: Image.asset('assets/images/mada.png')),
                                                                      Container(
                                                                          height:
                                                                              28,
                                                                          width:
                                                                              54,
                                                                          decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              border: Border.all(
                                                                                color: Colors.white,
                                                                              )),
                                                                          child: Image.asset('assets/images/2560px-Apple_Pay_logo.png'))
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    heightApp *
                                                                        0.03,
                                                              ),
                                                              MainButton(
                                                                text:
                                                                    'تبرع الان',
                                                                press: paymentController.salaryController.text == '' &&
                                                                        paymentController.selectedCatIndex ==
                                                                            -1 &&
                                                                        paymentController.selectedCatIndex2 ==
                                                                            -1
                                                                    ? null
                                                                    : () {
                                                                        if (loginStat.loginState ==
                                                                            'notLogin') {
                                                                          Navigator.pop(
                                                                              context);

                                                                          showDialog(
                                                                              context: context,
                                                                              builder: (BuildContext context) {
                                                                                return Dialog(
                                                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                                                                                  elevation: 0.0,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  child: Container(
                                                                                    margin: const EdgeInsets.only(left: 0.0, right: 0.0),
                                                                                    child: Stack(
                                                                                      children: <Widget>[
                                                                                        Container(
                                                                                          height: 366,
                                                                                          width: 368,
                                                                                          padding: const EdgeInsets.only(
                                                                                            top: 18.0,
                                                                                          ),
                                                                                          margin: const EdgeInsets.only(top: 13.0, left: 8.0),
                                                                                          decoration: BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(16.0), boxShadow: <BoxShadow>[
                                                                                            const BoxShadow(
                                                                                              color: Colors.black26,
                                                                                              blurRadius: 0.0,
                                                                                              offset: Offset(0.0, 0.0),
                                                                                            ),
                                                                                          ]),
                                                                                          child: Column(
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: <Widget>[
                                                                                              SizedBox(
                                                                                                height: heightApp * 0.02,
                                                                                              ),
                                                                                              SvgPicture.asset('assets/images/login.svg'),
                                                                                              SizedBox(
                                                                                                height: heightApp * 0.02,
                                                                                              ),
                                                                                              const Text(
                                                                                                'زائرنا الكريم',
                                                                                                style: TextStyle(color: Color(0XFFCCA750), fontSize: 24, fontFamily: 'din-next-lt-arabic light'),
                                                                                              ),
                                                                                              SizedBox(
                                                                                                height: heightApp * 0.01,
                                                                                              ),
                                                                                              const Text(
                                                                                                'يرجى تسجيل الدخول حتى تتمكن من إتمام التبرع',
                                                                                                style: TextStyle(color: Color(0xff55585D), fontSize: 18, fontFamily: 'din-next-lt-arabic light'),
                                                                                              ),
                                                                                              SizedBox(
                                                                                                height: heightApp * 0.02,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: const EdgeInsets.all(8.0),
                                                                                                child: MainButton(
                                                                                                    color: const Color(0XFFCCA750),
                                                                                                    text: 'تسجيل الدخول',
                                                                                                    press: () {
                                                                                                      Navigator.pop(context);

                                                                                                      showModalBottomSheet(
                                                                                                          context: context,
                                                                                                          builder: (BuildContext context) {
                                                                                                            return GetBuilder<AuthController>(
                                                                                                                init: AuthController(),
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
                                                                                                                                                          requsetSaveFoodController.nameController.text = GetStorage().read('Name').toString();
                                                                                                                                                          requsetSaveFoodController.phoneController.text = GetStorage().read('Phone').toString();
                                                                                                                                                          requsetBenfitController.nameController.text = GetStorage().read('Name').toString();
                                                                                                                                                          requsetBenfitController.phoneController.text = GetStorage().read('Phone').toString();
                                                                                                                                                        } else if (authController.phoneController.text.toString() == '555543537') {
                                                                                                                                                          GetStorage().write('TypeUser', 'Business');
                                                                                                                                                          controller.selectedTab = 0;
                                                                                                                                                          Get.offAndToNamed('/CustomTabBar');
                                                                                                                                                          controller.update();
                                                                                                                                                        }
                                                                                                                                                        requsetSaveFoodController.update();
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
                                                                                                height: heightApp * 0.02,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Positioned(
                                                                                          left: 0.0,
                                                                                          child: GestureDetector(
                                                                                            onTap: () {
                                                                                              controller.selectedTab = 0;
                                                                                              Get.offAndToNamed('/CustomTabBar');
                                                                                              controller.update();
                                                                                            },
                                                                                            child: Align(
                                                                                              alignment: Alignment.topLeft,
                                                                                              child: Container(
                                                                                                decoration: const BoxDecoration(boxShadow: [
                                                                                                  BoxShadow(
                                                                                                    color: Colors.black26,
                                                                                                    blurRadius: 15,
                                                                                                  )
                                                                                                ]),
                                                                                                child: const CircleAvatar(
                                                                                                  radius: 18.0,
                                                                                                  backgroundColor: Colors.white,
                                                                                                  child: Icon(Icons.close, color: Colors.red),
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
                                                                          Get.offAndToNamed(
                                                                              '/PaymentView');
                                                                      },
                                                                color: paymentController.salaryController.text == '' &&
                                                                        paymentController.selectedCatIndex ==
                                                                            -1 &&
                                                                        paymentController.selectedCatIndex2 ==
                                                                            -1
                                                                    ? const Color(
                                                                            0XFFCCA750)
                                                                        .withOpacity(
                                                                            .5)
                                                                    : const Color(
                                                                        0XFFCCA750),
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    heightApp *
                                                                        0.03,
                                                              ),
                                                            ]),
                                                      ),
                                                    );
                                                  });
                                            });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/images/Donate.svg'),
                                              SizedBox(
                                                width: widthApp * 0.01,
                                              ),
                                              Text(
                                                "تبرع الان",
                                                style: TextStyle(
                                                    color: Color(0xff504E49),
                                                    fontSize: 15,
                                                    fontFamily:
                                                        'din-next-lt-arabic light'),
                                              ),
                                            ],
                                          ),
                                          SvgPicture.asset(
                                              "assets/images/Iconly-Light-Arrow - Right 2.svg")
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.01,
                                    ),
                                    Divider(
                                      color: Color(0xffEEEEEE),
                                      thickness: 1.0,
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.01,
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/ContactView');
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                              "assets/images/customer-support.svg"),
                                          SizedBox(
                                            width: widthApp * 0.01,
                                          ),
                                          Text(
                                            "تواصل معنا",
                                            style: TextStyle(
                                                color: Color(0xff504E49),
                                                fontSize: 15,
                                                fontFamily:
                                                    'din-next-lt-arabic light'),
                                          ),
                                        ],
                                      ),
                                      SvgPicture.asset(
                                          "assets/images/Iconly-Light-Arrow - Right 2.svg")
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: heightApp * 0.01,
                                ),
                                Divider(
                                  color: Color(0xffEEEEEE),
                                  thickness: 1.0,
                                ),
                                SizedBox(
                                  height: heightApp * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/images/language.svg"),
                                        SizedBox(
                                          width: widthApp * 0.01,
                                        ),
                                        Text(
                                          "اللغة (العربية)",
                                          style: TextStyle(
                                              color: Color(0xff504E49),
                                              fontSize: 15,
                                              fontFamily:
                                                  'din-next-lt-arabic light'),
                                        ),
                                      ],
                                    ),
                                    SvgPicture.asset(
                                        "assets/images/Iconly-Light-Arrow - Right 2.svg")
                                  ],
                                ),
                                SizedBox(
                                  height: heightApp * 0.01,
                                ),
                                Divider(
                                  color: Color(0xffEEEEEE),
                                  thickness: 1.0,
                                ),
                                SizedBox(
                                  height: heightApp * 0.01,
                                ),

                                // if (loginStat.loginState == 'Login')
                                //   SizedBox(
                                //     height: heightApp * 0.01,
                                //   ),
                                // if (loginStat.loginState == 'Login')
                                //   Divider(
                                //     color: Color(0xffEEEEEE),
                                //     thickness: 1.0,
                                //   ),
                                // if (loginStat.loginState == 'Login')
                                //   SizedBox(
                                //     height: heightApp * 0.01,
                                //   ),
                                if (loginStat.loginState == 'Login')
                                  GestureDetector(
                                    onTap: () {
                                      controller.selectedTab = 0;
                                      Get.offAllNamed('/CustomTabBar');
                                      controller.update();
                                      GetStorage().remove('TypeUser');
                                      loginStat.changeLoginState('notLogin');

                                      GetStorage().remove('Name');
                                      GetStorage().remove('Phone');
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                                "assets/images/logout.svg"),
                                            SizedBox(
                                              width: widthApp * 0.01,
                                            ),
                                            Text(
                                              "تسجيل الخروج",
                                              style: TextStyle(
                                                  color: Color(0xffBC2131),
                                                  fontSize: 15,
                                                  fontFamily:
                                                      'din-next-lt-arabic light'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                SizedBox(
                                  height: heightApp * 0.01,
                                ),
                              ]),
                            ),
                          ),
                        )
                      else if (loginStat.loginState == 'notLogin' ||
                          GetStorage().read('TypeUser') == null)
                        SingleChildScrollView(
                          child: Container(
                            height: 360,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Color(0xffEEEEEE))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(children: [
                                SizedBox(
                                  height: heightApp * 0.02,
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Get.toNamed('/AboutView');
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                  "assets/images/info.svg"),
                                              SizedBox(
                                                width: widthApp * 0.01,
                                              ),
                                              Text(
                                                "عن إكرام",
                                                style: TextStyle(
                                                    color: Color(0xff504E49),
                                                    fontSize: 15,
                                                    fontFamily:
                                                        'din-next-lt-arabic light'),
                                              ),
                                            ],
                                          ),
                                          SvgPicture.asset(
                                              "assets/images/Iconly-Light-Arrow - Right 2.svg")
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.01,
                                    ),
                                    Divider(
                                      color: Color(0xffEEEEEE),
                                      thickness: 1.0,
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.01,
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Get.toNamed('/CommonQuestionView');
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                              "assets/images/faq.svg"),
                                          SizedBox(
                                            width: widthApp * 0.01,
                                          ),
                                          Text(
                                            "الأسئلة الشائعة",
                                            style: TextStyle(
                                                color: Color(0xff504E49),
                                                fontSize: 15,
                                                fontFamily:
                                                    'din-next-lt-arabic light'),
                                          ),
                                        ],
                                      ),
                                      SvgPicture.asset(
                                          "assets/images/Iconly-Light-Arrow - Right 2.svg")
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: heightApp * 0.01,
                                ),
                                Divider(
                                  color: Color(0xffEEEEEE),
                                  thickness: 1.0,
                                ),
                                SizedBox(
                                  height: heightApp * 0.01,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Get.toNamed('/ContactView');
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                              "assets/images/customer-support.svg"),
                                          SizedBox(
                                            width: widthApp * 0.01,
                                          ),
                                          Text(
                                            "تواصل معنا",
                                            style: TextStyle(
                                                color: Color(0xff504E49),
                                                fontSize: 15,
                                                fontFamily:
                                                    'din-next-lt-arabic light'),
                                          ),
                                        ],
                                      ),
                                      SvgPicture.asset(
                                          "assets/images/Iconly-Light-Arrow - Right 2.svg")
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: heightApp * 0.01,
                                ),
                                Divider(
                                  color: Color(0xffEEEEEE),
                                  thickness: 1.0,
                                ),
                                SizedBox(
                                  height: heightApp * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/images/language.svg"),
                                        SizedBox(
                                          width: widthApp * 0.01,
                                        ),
                                        Text(
                                          "اللغة (العربية)",
                                          style: TextStyle(
                                              color: Color(0xff504E49),
                                              fontSize: 15,
                                              fontFamily:
                                                  'din-next-lt-arabic light'),
                                        ),
                                      ],
                                    ),
                                    SvgPicture.asset(
                                        "assets/images/Iconly-Light-Arrow - Right 2.svg")
                                  ],
                                ),
                                SizedBox(
                                  height: heightApp * 0.01,
                                ),
                                Divider(
                                  color: Color(0xffEEEEEE),
                                  thickness: 1.0,
                                ),
                                SizedBox(
                                  height: heightApp * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/images/star.svg"),
                                        SizedBox(
                                          width: widthApp * 0.01,
                                        ),
                                        Text(
                                          "تقييم التطبيق",
                                          style: TextStyle(
                                              color: Color(0xff504E49),
                                              fontSize: 15,
                                              fontFamily:
                                                  'din-next-lt-arabic light'),
                                        ),
                                      ],
                                    ),
                                    SvgPicture.asset(
                                        "assets/images/Iconly-Light-Arrow - Right 2.svg")
                                  ],
                                ),
                                SizedBox(
                                  height: heightApp * 0.01,
                                ),
                                Divider(
                                  color: Color(0xffEEEEEE),
                                  thickness: 1.0,
                                ),
                                SizedBox(
                                  height: heightApp * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/images/share.svg"),
                                        SizedBox(
                                          width: widthApp * 0.01,
                                        ),
                                        Text(
                                          "مشاركة التطبيق",
                                          style: TextStyle(
                                              color: Color(0xff504E49),
                                              fontSize: 15,
                                              fontFamily:
                                                  'din-next-lt-arabic light'),
                                        ),
                                      ],
                                    ),
                                    SvgPicture.asset(
                                        "assets/images/Iconly-Light-Arrow - Right 2.svg")
                                  ],
                                ),
                                SizedBox(
                                  height: heightApp * 0.01,
                                ),
                              ]),
                            ),
                          ),
                        ),
                      SizedBox(
                        height: heightApp * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("assets/images/شعار-رؤية-2030-1.png"),
                          Image.asset("assets/images/BaladyAppLogo.png"),
                          Image.asset(
                              "assets/images/شعار-حفط-النعمة-بالطول.png"),
                          Image.asset("assets/images/QoL_logo_2.png"),
                        ],
                      ),
                      SizedBox(
                        height: heightApp * 0.08,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Timer1 extends StatelessWidget {
  const Timer1({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OtpController controller;

  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 30,
      onEnd: controller.onEnd,
      widgetBuilder: (_, CurrentRemainingTime? time) {
        if (time == null) {
          return Text('0');
        }
        return Text(
          '${time.sec}',
          style: TextStyle(
              color: Color(0xffA2B156),
              fontSize: 14,
              fontFamily: 'din-next-lt-arabic light'),
        );
      },
    );
  }
}

class Price_Model {
  final String? text;

  Price_Model({this.text}) {}
}

class Projects_Model {
  final String? text;

  Projects_Model({this.text}) {}
}
