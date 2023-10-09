import 'package:ekram_customer/controller/auth_controllers.dart';
import 'package:ekram_customer/controller/bottomNavBar_controllers.dart';
import 'package:ekram_customer/controller/location_controllers.dart';
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
import 'package:ekram_customer/view/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:ui' as ui;

import 'package:pin_code_fields/pin_code_fields.dart';

class HomeView extends StatelessWidget {
  final loginStat = Get.put(LoginStateController());
  final orderDetailsController = Get.put(OrderDetailsSaveFoodController());
 final requsetBenfitController = Get.put(RequsetBenfitController());

  final paymentController = Get.put(PaymentController());
  final requsetSaveFoodController = Get.put(RequsetSaveFoodController());
  final controller = Get.put(BottomNavBarController());
  final locationcontroller = Get.put(LocationController());
  final otpController = Get.put(OtpController());
  final authController = Get.put(AuthController());
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
  @override
  Widget build(BuildContext context) { var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xffF8F8F8),
        body: Column(children: [
           Container(
                  height: 180,
                  decoration: BoxDecoration(color: Color(0xff07706D)),
                  child: Stack(alignment: Alignment.center,
                    children: <Widget>[
                   
                    Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset("assets/images/Path.png")),
                    Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (loginStat.loginState == 'notLogin')
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'مرحبا بك ...',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily:
                                              'din-next-lt-arabic Medium'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Text(
                                        "في تطبيق إكرام",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontFamily:
                                                'din-next-lt-arabic Bold'),
                                      ),
                                    ),
                                  ],
                                )
                              else if (GetStorage().read('TypeUser') ==
                                  'Customer'&& loginStat.loginState == 'Login')
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'مرحبا بك ...',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily:
                                              'din-next-lt-arabic Medium'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right:9),
                                      child: Text(
                                        "أفنان أحمد العلاوي",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontFamily:
                                                'din-next-lt-arabic Bold'),
                                      ),
                                    )
                                  ],
                                )
                              else if (GetStorage().read('TypeUser') ==
                                  'Business'&& loginStat.loginState == 'Login')
                                Row(
                                  children: [Image.asset("assets/images/medal.png"),
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
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
                                        Text(
                                          "فنادق ومنتجعات هيلتون",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontFamily:
                                                  'din-next-lt-arabic Bold'),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                             
                            ],
                          ),
                          Image.asset("assets/images/ekram-logo.png")
                        ],
                      ),
                    ),
                  ])),
              if (GetStorage().read('TypeUser') ==
                                  'Business'&& loginStat.loginState == 'Login')
         
          
            FractionalTranslation(
              translation: const Offset(0.0, -0.2),
              child: Container(
                
                decoration: BoxDecoration(
                    color: const Color(0XFFCCA750),
                    borderRadius: BorderRadius.circular(10)),
                width: 368,
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "شاركنا رحلة إكرام",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'din-next-lt-arabic Medium'),
                      ),
                       SizedBox(
                        height: heightApp*0.02,
                      ),
                      const Text(
                        "جمع الفائض وسرعة توزيعه بأفضل معايير السلامة الغذائية",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'din-next-lt-arabic Bold'),
                      ),
                       SizedBox(
                        height: heightApp*0.02,
                      ),
                      MainButton1(
                        text: 'طلب حفظ نعمة',
                        color: Color(0xffB58E40),
                        press: () {
                          Get.toNamed('/RequestSaveFoodBusinessView');
                          // log('GHfffffffffffFGH');
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
        
              else if (GetStorage().read('TypeUser') ==
                                  'Customer' || loginStat.loginState == 'notLogin')
                FractionalTranslation(
                  translation: Offset(0.0, -0.3),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0XFFCCA750),
                        borderRadius: BorderRadius.circular(10)),
                    width: 368,
                    height: 96,
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Image.asset("assets/images/IMG_3788.png")),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "شاركنا رحلة إكرام",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'din-next-lt-arabic Medium'),
                              ),
                              SizedBox(
                                 height: heightApp*0.01,
                              ),
                              Text(
                                "جمع الفائض وسرعة توزيعه بأفضل معايير السلامة الغذائية",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'din-next-lt-arabic Bold'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ), 
          //   ],
          // ),
      
          Expanded(
            child: SingleChildScrollView(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                child: Container(
                  width: double.infinity,
                  // padding: EdgeInsets.symmetric(vertical:0),
                  decoration: BoxDecoration(
                    color: Color(0XFFF8F8F8),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right:20, top: 0, bottom: 20),
                    child: Column(
                      children: [
                        if (GetStorage().read('TypeUser') ==
                                  'Customer' || loginStat.loginState == 'notLogin')
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.offAllNamed('/RequestSaveFoodView');
                                },
                                child: Container(
                                    height: 108,
                                    width: 116,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Color(0XFFCCA750),
                                            width: 2)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Container(
                                        height: 108,
                                        width: 106,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.4),
                                              // spreadRadius: 1,
                                              blurRadius: 1,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "طلب حفظ نعمة",
                                              style: TextStyle(
                                                  color: Color(0XFFCCA750),
                                                  fontSize: 12,
                                                  fontFamily:
                                                      'din-next-lt-arabic Medium'),
                                            ),
                                            SizedBox(
                                                height: heightApp*0.01,
                                            ),
                                            SvgPicture.asset(
                                                'assets/images/RequsetSaveFood.svg')
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.offAllNamed('/RequestBenefitView');
                                },
                                child: Container(
                                    height: 108,
                                    width: 116,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Color(0XFFCCA750),
                                            width: 2)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Container(
                                        height: 108,
                                        width: 106,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.4),
                                              // spreadRadius: 1,
                                              blurRadius: 1,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "طلب استفادة",
                                              style: TextStyle(
                                                  color: Color(0XFFCCA750),
                                                  fontSize: 12,
                                                  fontFamily:
                                                      'din-next-lt-arabic Medium'),
                                            ),
                                            SizedBox(
                                               height: heightApp*0.01,
                                            ),
                                            SvgPicture.asset(
                                              'assets/images/RequestBenefit.svg',
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                              GestureDetector(
                                onTap: () {
                       
                                               showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: const Color(0XFFF8F8F8),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0),
                                        ),
                                      ),
                                      builder: (BuildContext context) {
                                        return GetBuilder<PaymentController>(
                                            init: PaymentController(),
                                            initState: (_) {},
                                            builder: (_) {
                                              return Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.50,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20, right: 20),
                                                  child: Column(children: [
                                                    SizedBox(
                                                      height: heightApp * 0.02,
                                                    ),
                                                    Container(
                                                      width: 45,
                                                      height: 5,
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xffD5D5D5),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                    ),
                                                    SizedBox(
                                                      height: heightApp * 0.02,
                                                    ),
                                                    const Text(
                                                      "التبرع السريع",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0XFFA2B156),
                                                          fontSize: 20,
                                                          fontFamily:
                                                              'din-next-lt-arabic Medium'),
                                                    ),
                                                    SizedBox(
                                                      height: heightApp * 0.02,
                                                    ),
                                                    const Divider(
                                                      thickness: 1,
                                                      color: Color(0xffE4E4E4),
                                                    ),
                                                    SizedBox(
                                                      height: heightApp * 0.02,
                                                    ),
                                                    SizedBox(
                                                      height: 90,
                                                      child: ListView.separated(
                                                        separatorBuilder:
                                                            (context, index) {
                                                          return const SizedBox(
                                                            width: 4,
                                                          );
                                                        },
                                                        shrinkWrap: true,
                                                        // padding: EdgeInsets.all(9),
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount:
                                                            PriceList.length,
                                                        itemBuilder:
                                                            (context, i) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                paymentController
                                                                    .onSelectCat(
                                                                        i);
                                                                paymentController
                                                                    .update();
                                                              },
                                                              child: Container(
                                                                // padding: EdgeInsets.all(9),
                                                                height: 70,
                                                                width: 111,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    border: Border.all(
                                                                        color: paymentController.selectedCatIndex !=
                                                                                i
                                                                            ? const Color(0xffEEEEEE)
                                                                            : const Color(0XFFCCA750))),
                                                                child: Center(
                                                                  child: Text(
                                                                    PriceList[i]
                                                                        .text
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: paymentController.selectedCatIndex !=
                                                                                i
                                                                            ? Colors
                                                                                .black
                                                                            : const Color(
                                                                                0XFFCCA750),
                                                                        fontSize:
                                                                            15,
                                                                        fontFamily:
                                                                            'din-next-lt-arabic Light'),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: heightApp * 0.01,
                                                    ),
                                                    BoxTextFieldPayment(
                                                        onChanged: (value) {
                                                          paymentController
                                                              .update();
                                                        },
                                                        controller:
                                                            paymentController
                                                                .salaryController,
                                                        text: 'text'),
                                                    SizedBox(
                                                      height: heightApp * 0.02,
                                                    ),
                                                    SizedBox(
                                                      width: 200,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                              height: 28,
                                                              width: 54,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  border: Border.all(
                                                                      color: const Color(
                                                                          0xffEEEEEE))),
                                                              child: Image.asset(
                                                                  'assets/images/visa.png')),
                                                          Container(
                                                              height: 28,
                                                              width: 54,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  border: Border.all(
                                                                      color: const Color(
                                                                          0xffEEEEEE))),
                                                              child: Image.asset(
                                                                  'assets/images/mada.png')),
                                                          Container(
                                                              height: 28,
                                                              width: 54,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .white,
                                                                      )),
                                                              child: Image.asset(
                                                                  'assets/images/2560px-Apple_Pay_logo.png'))
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: heightApp * 0.03,
                                                    ),
                                                    MainButton(
                                                      text: 'تبرع الان',
                                                      press: paymentController
                                                                      .salaryController
                                                                      .text ==
                                                                  '' &&
                                                              paymentController
                                                                      .selectedCatIndex ==
                                                                  -1
                                                          ? null
                                                          : () {
                                                              if (loginStat
                                                                      .loginState ==
                                                                  'notLogin') {                                                                                      Navigator.pop(context);

                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
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
                                                                          margin: const EdgeInsets.only(
                                                                              left: 0.0,
                                                                              right: 0.0),
                                                                          child:
                                                                              Stack(
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
                                                                                                                                              }
                                                                                                                                              requsetSaveFoodController.update();
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
                                                      color: paymentController
                                                                      .salaryController
                                                                      .text ==
                                                                  '' &&
                                                              paymentController
                                                                      .selectedCatIndex ==
                                                                  -1
                                                          ? const Color(
                                                                  0XFFCCA750)
                                                              .withOpacity(.5)
                                                          : const Color(
                                                              0XFFCCA750),
                                                    ),
                                                    SizedBox(
                                                      height: heightApp * 0.03,
                                                    ),
                                                  ]),
                                                ),
                                              );
                                            });
                                      });                                                       
                                },
                                child: Container(
                                    height: 108,
                                    width: 116,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Color(0XFFCCA750),
                                            width: 2)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Container(
                                        height: 108,
                                        width: 106,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.4),
                                              // spreadRadius: 1,
                                              blurRadius: 1,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "تبرع الان",
                                              style: TextStyle(
                                                  color: Color(0XFFCCA750),
                                                  fontSize: 12,
                                                  fontFamily:
                                                      'din-next-lt-arabic Medium'),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SvgPicture.asset(
                                                'assets/images/Donation.svg')
                                          ],
                                        ),
                                      ),
                                    )),
                              )
                            ],
                          ),
                          if (GetStorage().read('TypeUser') ==
                                  'Customer' || loginStat.loginState == 'notLogin')
          SizedBox(
            height: heightApp * 0.02,
          ),
                        Container(
                          height: 444,
                          width: 368,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(children: <Widget>[
                                  Expanded(
                                      child: Divider(
                                    thickness: 1,
                                    color: Color(0xffE4E4E4),
                                  )),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 7, right: 7),
                                    child: Text(
                                      "إكرام في أرقام",
                                      style: TextStyle(
                                          color: Color(0XFFA2B156),
                                          fontSize: 16,
                                          fontFamily:
                                              'din-next-lt-arabic Medium'),
                                    ),
                                  ),
                                  Expanded(
                                      child: Divider(
                                    color: Color(0xffE4E4E4),
                                    thickness: 1,
                                  )),
                                ]),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10, bottom: 20),
                                // height: 410,
                                width: 328,
                                decoration: BoxDecoration(
                                    color: Color(0XFFF8F8F8),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: Color(0xffF0F0F0),
                                        child: SvgPicture.asset(
                                            'assets/images/CompletedTrips.svg')),
                                    Text(
                                      "الرحلات المكتملة",
                                      style: TextStyle(
                                          color: Color(0XFFCCA750),
                                          fontSize: 14,
                                          fontFamily:
                                              'din-next-lt-arabic Medium'),
                                    ),
                                    if(loginStat.loginState == 'notLogin')
                                   Text(
                                      "0,0",
                                      style: TextStyle(
                                          color: Color(0XFFA2B156),
                                          fontSize: 20,
                                          fontFamily:
                                              'din-next-lt-arabic Medium'),
                                    ) else Text(
                                      "21,418",
                                      style: TextStyle(
                                          color: Color(0XFFA2B156),
                                          fontSize: 20,
                                          fontFamily:
                                              'din-next-lt-arabic Medium'),
                                    ) ,
                                    
                                    SizedBox(
                                      height: heightApp*0.01,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Divider(
                                        color: Color(0xffE4E4E4),
                                        thickness: 1,
                                      ),
                                    ),
                                    SizedBox(
                                    height: heightApp*0.01,
                                    ),
                                    CircleAvatar(
                                        backgroundColor: Color(0xffF0F0F0),
                                        child: SvgPicture.asset(
                                            'assets/images/NumberBenefit.svg')),
                                    Text(
                                      "عدد المستفيدين",
                                      style: TextStyle(
                                          color: Color(0XFFCCA750),
                                          fontSize: 14,
                                          fontFamily:
                                              'din-next-lt-arabic Medium'),
                                    ),
                                        if(loginStat.loginState == 'notLogin')
                                   Text(
                                      "0,0",
                                      style: TextStyle(
                                          color: Color(0XFFA2B156),
                                          fontSize: 20,
                                          fontFamily:
                                              'din-next-lt-arabic Medium'),
                                    ) else Text(
                                      "676,64",
                                      style: TextStyle(
                                          color: Color(0XFFA2B156),
                                          fontSize: 20,
                                          fontFamily:
                                              'din-next-lt-arabic Medium'),
                                    ) ,
                                    SizedBox(
                                    height: heightApp*0.01,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Divider(
                                        color: Color(0xffE4E4E4),
                                        thickness: 1,
                                      ),
                                    ),
                                    SizedBox(
                                     height: heightApp*0.01,
                                    ),
                                    CircleAvatar(
                                        backgroundColor: Color(0xffF0F0F0),
                                        child: SvgPicture.asset(
                                            'assets/images/TotalDonation.svg')),
                                    Text(
                                      "إجمالي التبرعات",
                                      style: TextStyle(
                                          color: Color(0XFFCCA750),
                                          fontSize: 14,
                                          fontFamily:
                                              'din-next-lt-arabic Medium'),
                                    ),
                                       if(loginStat.loginState == 'notLogin')
                                   Text(
                                      "0,0",
                                      style: TextStyle(
                                          color: Color(0XFFA2B156),
                                          fontSize: 20,
                                          fontFamily:
                                              'din-next-lt-arabic Medium'),
                                    ) else Text(
                                      "548,418",
                                      style: TextStyle(
                                          color: Color(0XFFA2B156),
                                          fontSize: 20,
                                          fontFamily:
                                              'din-next-lt-arabic Medium'),
                                    ) ,
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (GetStorage().read('TypeUser') ==
                                  'Business')
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                      child: Divider(
                                    thickness: 1,
                                    color: Color(0xffE4E4E4),
                                  )),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 7, right: 7),
                                    child: Text(
                                      "اكرمها لتدوم",
                                      style: TextStyle(
                                          color: Color(0XFFCBCBCB),
                                          fontSize: 24,
                                          fontFamily:
                                              'din-next-lt-arabic Medium'),
                                    ),
                                  ),
                                  Expanded(
                                      child: Divider(
                                    color: Color(0xffE4E4E4),
                                    thickness: 1,
                                  )),
                                ]),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
         
          SizedBox(
            height: heightApp * 0.09,
          )
        ]));
  }
}

class Price_Model {
  final String? text;

  Price_Model({this.text}) {}
}
