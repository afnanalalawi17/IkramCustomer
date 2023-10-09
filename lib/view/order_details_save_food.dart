import 'package:carousel_slider/carousel_slider.dart';
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
import 'package:ekram_customer/shared/widget/box_Text_Field_Search.dart';
import 'package:ekram_customer/shared/widget/constants.dart';
import 'package:ekram_customer/shared/widget/main_button.dart';
import 'package:ekram_customer/view/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:ui' as ui;

class OrderDetailsSaveFoodView extends StatelessWidget {
  final orderDetailsController = Get.put(OrderDetailsSaveFoodController());
    final requsetBenfitController = Get.put(RequsetBenfitController());

  final loginStat = Get.put(LoginStateController());
  final paymentController = Get.put(PaymentController());
  final requsetSaveFoodController = Get.put(RequsetSaveFoodController());
  final controller = Get.put(BottomNavBarController());
  final locationcontroller = Get.put(LocationController());
  final otpController = Get.put(OtpController());
  final authController = Get.put(AuthController());
  final CarouselController _controller = CarouselController();
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
    return 
    GetBuilder<OrderDetailsSaveFoodController>(
          init: OrderDetailsSaveFoodController(),
          initState: (_) {},
          builder: (_) {
            return
    
    Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff07706D),
      appBar: AppBar(centerTitle: true,
        leadingWidth: 60,
        leading: GestureDetector(
          onTap: () {

            if(controller.selectedTab == 1){
                controller.selectedTab =1;
            Get.offAndToNamed('/CustomTabBar');
            controller.update();
            }else{
                 controller.selectedTab =0;
            Get.offAndToNamed('/CustomTabBar');
            controller.update();
            }
          
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 12),
            child: SvgPicture.asset("assets/images/arrow_back.svg"),
          ),
        ),
        actions: [
          if (orderDetailsController.status != 'ملغي' &&
              orderDetailsController.status != 'مكتمل')
            GestureDetector(
              onTap: () {
                Get.toNamed('/ChatView');
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 12),
                child: SvgPicture.asset(
                  "assets/images/chat_order.svg",
                  width: 40,
                ),
              ),
            )
        ],
        title: const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            'تفاصيل الطلب',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'din-next-lt-arabic Light'),
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xff07706D),
      ),
      body: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: const BoxDecoration(
                  color: Color(0XFFF8F8F8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: heightApp * 0.03,
                            ),
                            if (orderDetailsController.status != 'ملغي' &&
                                orderDetailsController.status != 'مكتمل')
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 7,
                                    width: 68,
                                    decoration: BoxDecoration(
                                        color:
                                            orderDetailsController.status1 == 1
                                                ? Color(0XFFCCA750)
                                                : Color(0xffB0B0B0)
                                                    .withOpacity(.3)),
                                  ),
                                  Container(
                                    height: 7,
                                    width: 68,
                                    decoration: BoxDecoration(
                                        color:
                                            orderDetailsController.status2 == 1
                                                ? Color(0XFFCCA750)
                                                : Color(0xffB0B0B0)
                                                    .withOpacity(.3)),
                                  ),
                                  Container(
                                    height: 7,
                                    width: 68,
                                    decoration: BoxDecoration(
                                        color:
                                            orderDetailsController.status3 == 1
                                                ? Color(0XFFCCA750)
                                                : Color(0xffB0B0B0)
                                                    .withOpacity(.3)),
                                  ),
                                  Container(
                                    height: 7,
                                    width: 68,
                                    decoration: BoxDecoration(
                                        color:
                                            orderDetailsController.status4 == 1
                                                ? Color(0XFFCCA750)
                                                : Color(0xffB0B0B0)
                                                    .withOpacity(.3)),
                                  ),
                                  Container(
                                    height: 7,
                                    width: 68,
                                    decoration: BoxDecoration(
                                        color:
                                            orderDetailsController.status5 == 1
                                                ? Color(0XFFCCA750)
                                                : Color(0xffB0B0B0)
                                                    .withOpacity(.3)),
                                  )
                                ],
                              ),
                            SizedBox(
                              height: heightApp * 0.03,
                            ),
                            GestureDetector(
                              onTap: () {
                                orderDetailsController.status =
                                    orderDetailsController.status;

                                if (orderDetailsController.status ==
                                    'تحت الاجراء') {
                                  orderDetailsController.status =
                                      'السائق في الطريق إليك';
                                  orderDetailsController.status2 = 1;
                                } else if (orderDetailsController.status ==
                                    'السائق في الطريق إليك') {
                                  orderDetailsController.status = 'جاري الجمع';
                                  orderDetailsController.status3 = 1;
                                } else if (orderDetailsController.status ==
                                    'جاري الجمع') {
                                  orderDetailsController.status = 'تم الاستلام';

                                  orderDetailsController.status4 = 1;
                                }
                                // else if (orderDetailsController.status ==
                                //     'تم الاستلام') {
                                //   orderDetailsController.status = 'مكتمل';
                                //   orderDetailsController.status5 = 1;
                                // }
                                orderDetailsController.update();
                              },
                              child: Container(
                                height: 55,
                                width: 368,
                                decoration: BoxDecoration(
                                  color: orderDetailsController.status ==
                                          'تحت الاجراء'
                                      ? Color(0xffB0B0B0).withOpacity(.10)
                                      : orderDetailsController.status ==
                                              'السائق في الطريق إليك'
                                          ? Color(0xff56C285).withOpacity(.10)
                                          : orderDetailsController.status ==
                                                  'جاري الجمع'
                                              ? Color(0xffE49334)
                                                  .withOpacity(.10)
                                              : orderDetailsController.status ==
                                                      'تم الاستلام'
                                                  ? Color(0xff41AC9C)
                                                      .withOpacity(.10)
                                                  : orderDetailsController
                                                              .status ==
                                                          'مكتمل'
                                                      ? Color(0xff97B73E)
                                                          .withOpacity(.10)
                                                      : orderDetailsController
                                                                  .status ==
                                                              'ملغي'
                                                          ? Color(0xffC34949)
                                                              .withOpacity(.10)
                                                          : Colors.black,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    orderDetailsController.status.toString(),
                                    style: TextStyle(
                                        color: orderDetailsController.status ==
                                                'تحت الاجراء'
                                            ? Color(0xffB0B0B0)
                                            : orderDetailsController.status ==
                                                    'السائق في الطريق إليك'
                                                ? Color(0xff56C285)
                                                : orderDetailsController
                                                            .status ==
                                                        'جاري الجمع'
                                                    ? Color(0xffE49334)
                                                    : orderDetailsController
                                                                .status ==
                                                            'تم الاستلام'
                                                        ? Color(0xff41AC9C)
                                                        : orderDetailsController
                                                                    .status ==
                                                                'مكتمل'
                                                            ? Color(0xff97B73E)
                                                            : orderDetailsController
                                                                        .status ==
                                                                    'ملغي'
                                                                ? Color(
                                                                    0xffC34949)
                                                                : Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'din-next-lt-arabic light'),
                                  ),
                                ),
                              ),
                            ),
                            if (orderDetailsController.status == 'مكتمل')
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 5, left: 5),
                                child: Column(children: [
                                  SizedBox(
                                    height: heightApp * 0.02,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 4,
                                        decoration: BoxDecoration(
                                            color: Color(0xff97A341),
                                            borderRadius:
                                                BorderRadius.circular(1)),
                                      ),
                                      SizedBox(
                                        width: widthApp * 0.02,
                                      ),
                                      Text(
                                        'المرفقات',
                                        style: TextStyle(
                                            color: Color(0XFFA2B156),
                                            fontSize: 18,
                                            fontFamily:
                                                'din-next-lt-arabic Light'),
                                      )
                                    ],
                                  ),
                                  CarouselSlider(
                                    items: imageSliders,
                                    carouselController: _controller,
                                    options: CarouselOptions(
                                        autoPlay: true,
                                        enlargeCenterPage: true,
                                        aspectRatio: 2.0,
                                        onPageChanged: (index, reason) {
                                          orderDetailsController.current =
                                              index;
                                          orderDetailsController.update();
                                        }),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:
                                        imgList.asMap().entries.map((entry) {
                                      return GestureDetector(
                                        onTap: () => _controller
                                            .animateToPage(entry.key),
                                        child: Container(
                                          width:
                                              orderDetailsController.current ==
                                                      entry.key
                                                  ? 22.0
                                                  : 8.0,
                                          height: 8.0,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 4.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  orderDetailsController
                                                              .current ==
                                                          entry.key
                                                      ? BorderRadius.circular(
                                                          10)
                                                      : BorderRadius.circular(
                                                          5),
                                              //         shape:
                                              //  BoxShape.circle,
                                              color: (Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? Color(0XFFD4D4D4)
                                                      : Color(0XFFA2B156))
                                                  .withOpacity(
                                                      orderDetailsController
                                                                  .current ==
                                                              entry.key
                                                          ? 0.9
                                                          : 0.4)),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  SizedBox(
                                    height: heightApp * 0.02,
                                  ),
                                  Row(children: [
                                    Container(
                                      height: 30,
                                      width: 4,
                                      decoration: BoxDecoration(
                                          color: Color(0xff97A341),
                                          borderRadius:
                                              BorderRadius.circular(1)),
                                    ),
                                    SizedBox(
                                      width: widthApp * 0.02,
                                    ),
                                    Text(
                                      'الاصناف',
                                      style: TextStyle(
                                          color: Color(0XFFA2B156),
                                          fontSize: 18,
                                          fontFamily:
                                              'din-next-lt-arabic Light'),
                                    ),
                                  ]),
                                  SizedBox(
                                    height: heightApp * 0.02,
                                  ),
                                  Container(
                                      height: 99,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: Color(0xffEEEEEE))),
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10, top: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              //             SizedBox(
                                              //   height: heightApp * 0.01,
                                              // ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'حلويات',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0XFF686868),
                                                        fontSize: 15,
                                                        fontFamily:
                                                            'din-next-lt-arabic light'),
                                                  ),
                                                  Text(
                                                    '30 حاوية',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0XFF686868),
                                                        fontSize: 15,
                                                        fontFamily:
                                                            'din-next-lt-arabic light'),
                                                  ),
                                                  Text(
                                                    '(60 مستفيد)',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0XFF686868),
                                                        fontSize: 15,
                                                        fontFamily:
                                                            'din-next-lt-arabic light'),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: heightApp * 0.01,
                                              ),
                                              Divider(
                                                thickness: 1,
                                                color: Color(0xffE4E4E4),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'حلويات',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0XFF686868),
                                                        fontSize: 15,
                                                        fontFamily:
                                                            'din-next-lt-arabic light'),
                                                  ),
                                                  Text(
                                                    '30 حاوية',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0XFF686868),
                                                        fontSize: 15,
                                                        fontFamily:
                                                            'din-next-lt-arabic light'),
                                                  ),
                                                  Text(
                                                    '(60 مستفيد)',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0XFF686868),
                                                        fontSize: 15,
                                                        fontFamily:
                                                            'din-next-lt-arabic light'),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ))),
                                  SizedBox(
                                    height: heightApp * 0.02,
                                  ),
                                  Row(children: [
                                    Container(
                                      height: 30,
                                      width: 4,
                                      decoration: BoxDecoration(
                                          color: Color(0xff97A341),
                                          borderRadius:
                                              BorderRadius.circular(1)),
                                    ),
                                    SizedBox(
                                      width: widthApp * 0.02,
                                    ),
                                    Text(
                                      'بيانات الطلب',
                                      style: TextStyle(
                                          color: Color(0XFFA2B156),
                                          fontSize: 18,
                                          fontFamily:
                                              'din-next-lt-arabic Light'),
                                    ),
                                  ]),
                                  SizedBox(
                                    height: heightApp * 0.02,
                                  ),
                                  Container(
                                    height: 440,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Color(0xffEEEEEE))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, top: 30),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'أفنان أحمد العلاوي',
                                              style: TextStyle(
                                                  color: Color(0XFFB58E40),
                                                  fontSize: 15,
                                                  fontFamily:
                                                      'din-next-lt-arabic light'),
                                            ),
                                            SizedBox(
                                              height: heightApp * 0.01,
                                            ),
                                            Text(
                                              '966 566 220 639+',
                                              style: TextStyle(
                                                  color: Color(0XFF686868),
                                                  fontSize: 15,
                                                  fontFamily:
                                                      'din-next-lt-arabic light'),
                                            ),
                                            SizedBox(
                                              height: heightApp * 0.01,
                                            ),
                                            Divider(
                                              thickness: 1,
                                              color: Color(0xffE4E4E4),
                                            ),
                                            SizedBox(
                                              height: heightApp * 0.02,
                                            ),
                                            Container(
                                              height: 41,
                                              width: 368,
                                              decoration: BoxDecoration(
                                                color: Color(0xffB0B0B0)
                                                    .withOpacity(.3),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'رقم الطلب',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff686868),
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'din-next-lt-arabic light'),
                                                    ),
                                                    Text(
                                                      '#321543',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff686868),
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'din-next-lt-arabic light'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: heightApp * 0.02,
                                            ),
                                            Container(
                                              height: 41,
                                              width: 368,
                                              decoration: BoxDecoration(
                                                color: Color(0xffB0B0B0)
                                                    .withOpacity(.3),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'نوع الطلب',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff686868),
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'din-next-lt-arabic light'),
                                                    ),
                                                    Text(
                                                      'حفظ نعمة',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff686868),
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'din-next-lt-arabic light'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: heightApp * 0.02,
                                            ),
                                            Container(
                                              height: 41,
                                              width: 368,
                                              decoration: BoxDecoration(
                                                color: Color(0xffB0B0B0)
                                                    .withOpacity(.3),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'نوع المناسبة',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff686868),
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'din-next-lt-arabic light'),
                                                    ),
                                                    Text(
                                                      'زواج',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff686868),
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'din-next-lt-arabic light'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: heightApp * 0.02,
                                            ),
                                            Container(
                                              height: 41,
                                              width: 368,
                                              decoration: BoxDecoration(
                                                color: Color(0xffB0B0B0)
                                                    .withOpacity(.3),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'وقت التسليم',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff686868),
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'din-next-lt-arabic light'),
                                                    ),
                                                    Text(
                                                      '21 يوليو 2023 - 10:3ص',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff686868),
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'din-next-lt-arabic light'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: heightApp * 0.02,
                                            ),
                                            Container(
                                              height: 41,
                                              width: 368,
                                              decoration: BoxDecoration(
                                                color: Color(0xffB0B0B0)
                                                    .withOpacity(.3),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'موقع التسليم',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff686868),
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'din-next-lt-arabic light'),
                                                    ),
                                                    Text(
                                                      'مكة المكرمة - العوالي',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff686868),
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'din-next-lt-arabic light'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: heightApp * 0.02,
                                            ),
                                          ]),
                                    ),
                                  ),
                                ]),
                              ),
                            SizedBox(
                              height: heightApp * 0.03,
                            ),
                            if (orderDetailsController.status != 'مكتمل')
                              Container(
                                height: 440,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border:
                                        Border.all(color: Color(0xffEEEEEE))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 30),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'أفنان أحمد العلاوي',
                                          style: TextStyle(
                                              color: Color(0XFFB58E40),
                                              fontSize: 15,
                                              fontFamily:
                                                  'din-next-lt-arabic light'),
                                        ),
                                        SizedBox(
                                          height: heightApp * 0.01,
                                        ),
                                        Text(
                                          '966 566 220 639+',
                                          style: TextStyle(
                                              color: Color(0XFF686868),
                                              fontSize: 15,
                                              fontFamily:
                                                  'din-next-lt-arabic light'),
                                        ),
                                        SizedBox(
                                          height: heightApp * 0.01,
                                        ),
                                        Divider(
                                          thickness: 1,
                                          color: Color(0xffE4E4E4),
                                        ),
                                        SizedBox(
                                          height: heightApp * 0.02,
                                        ),
                                        Container(
                                          height: 41,
                                          width: 368,
                                          decoration: BoxDecoration(
                                            color: Color(0xffB0B0B0)
                                                .withOpacity(.3),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'رقم الطلب',
                                                  style: TextStyle(
                                                      color: Color(0xff686868),
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'din-next-lt-arabic light'),
                                                ),
                                                Text(
                                                  '#321543',
                                                  style: TextStyle(
                                                      color: Color(0xff686868),
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'din-next-lt-arabic light'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: heightApp * 0.02,
                                        ),
                                        Container(
                                          height: 41,
                                          width: 368,
                                          decoration: BoxDecoration(
                                            color: Color(0xffB0B0B0)
                                                .withOpacity(.3),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'نوع الطلب',
                                                  style: TextStyle(
                                                      color: Color(0xff686868),
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'din-next-lt-arabic light'),
                                                ),
                                                Text(
                                                  'حفظ نعمة',
                                                  style: TextStyle(
                                                      color: Color(0xff686868),
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'din-next-lt-arabic light'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: heightApp * 0.02,
                                        ),
                                        Container(
                                          height: 41,
                                          width: 368,
                                          decoration: BoxDecoration(
                                            color: Color(0xffB0B0B0)
                                                .withOpacity(.3),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'نوع المناسبة',
                                                  style: TextStyle(
                                                      color: Color(0xff686868),
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'din-next-lt-arabic light'),
                                                ),
                                                Text(
                                                  'زواج',
                                                  style: TextStyle(
                                                      color: Color(0xff686868),
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'din-next-lt-arabic light'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: heightApp * 0.02,
                                        ),
                                        Container(
                                          height: 41,
                                          width: 368,
                                          decoration: BoxDecoration(
                                            color: Color(0xffB0B0B0)
                                                .withOpacity(.3),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'وقت التسليم',
                                                  style: TextStyle(
                                                      color: Color(0xff686868),
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'din-next-lt-arabic light'),
                                                ),
                                                Text(
                                                  '21 يوليو 2023 - 10:3ص',
                                                  style: TextStyle(
                                                      color: Color(0xff686868),
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'din-next-lt-arabic light'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: heightApp * 0.02,
                                        ),
                                        Container(
                                          height: 41,
                                          width: 368,
                                          decoration: BoxDecoration(
                                            color: Color(0xffB0B0B0)
                                                .withOpacity(.3),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'موقع التسليم',
                                                  style: TextStyle(
                                                      color: Color(0xff686868),
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'din-next-lt-arabic light'),
                                                ),
                                                Text(
                                                  'مكة المكرمة - العوالي',
                                                  style: TextStyle(
                                                      color: Color(0xff686868),
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'din-next-lt-arabic light'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: heightApp * 0.02,
                                        ),
                                      ]),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    if (orderDetailsController.status == 'تحت الاجراء')
                      Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: MainButton(
                                color: const Color(0XFFCCA750),
                                text: 'إلغاء الطلب',
                                press: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          // title: Text("Success"),
                                          content: Container(
                                            height: 307,
                                            width: 368,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: heightApp * 0.04,
                                                ),
                                                SvgPicture.asset(
                                                    'assets/images/alart.svg'),
                                                SizedBox(
                                                  height: heightApp * 0.02,
                                                ),
                                                Text(
                                                  "هل أنت متأكد من أنك تريد إلغاء الطلب ؟",
                                                  style: TextStyle(
                                                      color: Color(0xff55585D),
                                                      fontSize: 16,
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
                                                              orderDetailsController
                                                                      .status =
                                                                  'ملغي';
                                                              orderDetailsController
                                                                  .status6 = 1;
                                                              Navigator.pop(
                                                                  context);
                                                              orderDetailsController
                                                                  .update();
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
                                                                  'إلغاء الطلب',
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
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Container(
                                                              width: 154,
                                                              height: 60,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
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
                                                                  'تراجع',
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
                          ))
                    else if (orderDetailsController.status ==
                        'السائق في الطريق إليك')
                      Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: MainButton(
                                color: const Color(0XFFCCA750),
                                text: 'تتبع السائق',
                                press: () {
                                  Get.toNamed('/TrackLocationView');
                                }),
                          ))
                    else if (orderDetailsController.status == 'تم الاستلام')
                      Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: MainButton(
                                color: const Color(0XFFCCA750),
                                text: 'التقييم',
                                press: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return GetBuilder<
                                                OrderDetailsSaveFoodController>(
                                            init:
                                                OrderDetailsSaveFoodController(),
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
                                                    borderRadius: BorderRadius
                                                        .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    20.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    20.0)),
                                                    child: Container(
                                                      height: 333,
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
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            30,
                                                                        width:
                                                                            4,
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Color(0xff97A341),
                                                                            borderRadius: BorderRadius.circular(1)),
                                                                      ),
                                                                      SizedBox(
                                                                        width: widthApp *
                                                                            0.02,
                                                                      ),
                                                                      Text(
                                                                        'تقييم الخدمة',
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0XFFA2B156),
                                                                            fontSize:
                                                                                18,
                                                                            fontFamily:
                                                                                'din-next-lt-arabic Light'),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    child: RatingBar
                                                                        .builder(
                                                                      wrapAlignment:
                                                                          WrapAlignment
                                                                              .end,
                                                                      unratedColor:
                                                                          Color(
                                                                              0xffE4E4E4),
                                                                      itemSize:
                                                                          25,
                                                                      initialRating:
                                                                          0,
                                                                      minRating:
                                                                          1,
                                                                      direction:
                                                                          Axis.horizontal,
                                                                      allowHalfRating:
                                                                          true,
                                                                      itemCount:
                                                                          5,
                                                                      itemPadding:
                                                                          EdgeInsets.symmetric(
                                                                              horizontal: 2.0),
                                                                      itemBuilder:
                                                                          (context, _) =>
                                                                              Icon(
                                                                        Icons
                                                                            .star_rate_rounded,
                                                                        color: Colors
                                                                            .amber,
                                                                      ),
                                                                      onRatingUpdate:
                                                                          (rating) {
                                                                        print(
                                                                            rating);
                                                                      },
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    heightApp *
                                                                        0.03,
                                                              ),
                                                              TextField(
                                                                  onChanged:
                                                                      (value) {
                                                                    orderDetailsController
                                                                        .rateController
                                                                        .text = value;
                                                                    orderDetailsController
                                                                        .update();
                                                                  },
                                                                  controller:
                                                                      orderDetailsController
                                                                          .rateController,
                                                                  cursorColor:
                                                                      Color(
                                                                          0XFFCCA750),
                                                                  minLines:
                                                                      3, // Set this
                                                                  maxLines:
                                                                      6, // and this
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .multiline,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color: Color(
                                                                              0xffF3F3F3),
                                                                          width:
                                                                              2),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color: Color(
                                                                              0xffF3F3F3),
                                                                          width:
                                                                              2),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color: Color(
                                                                              0xffF3F3F3),
                                                                          width:
                                                                              2),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              color: Colors.red),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              color: Colors.red),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor:
                                                                        Color(
                                                                            0xffF3F3F3),
                                                                    hintText:
                                                                        'قيّم الخدمة, العاملين',
                                                                    hintStyle: TextStyle(
                                                                        color: Colors
                                                                            .grey,
                                                                        fontSize:
                                                                            15,
                                                                        fontFamily:
                                                                            'din-next-lt-arabic light'),
                                                                    contentPadding:
                                                                        EdgeInsets.all(
                                                                            20),
                                                                  )),
                                                              SizedBox(
                                                                height:
                                                                    heightApp *
                                                                        0.01,
                                                              ),
                                                              MainButton(
                                                                text: 'إرسال',
                                                                press: orderDetailsController
                                                                            .rateController
                                                                            .text
                                                                            .trim()
                                                                            .toString() ==
                                                                        ''
                                                                    ? null
                                                                    : () {
                                                                        orderDetailsController.status =
                                                                            'مكتمل';
                                                                        orderDetailsController
                                                                            .status5 = 1;
                                                                        Navigator.pop(
                                                                            context);
                                                                        orderDetailsController
                                                                            .update();
                                                                      },
                                                                color: orderDetailsController
                                                                            .rateController
                                                                            .text
                                                                            .trim()
                                                                            .toString() ==
                                                                        ''
                                                                    ? const Color(
                                                                            0XFFCCA750)
                                                                        .withOpacity(
                                                                            .5)
                                                                    : const Color(
                                                                        0XFFCCA750),
                                                              )
                                                            ]),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                      });
                                }),
                          ))
                    else if (orderDetailsController.status == 'مكتمل')
                      Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: MainButton(
                                  color: const Color(0XFFCCA750),
                                  text: 'تبرع الان',
                                  press: () {
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
                                  })))
                  ],
                )));
         
    }  );
  }
}

final List<String> imgList = [
  'assets/images/img1.svg',
  'assets/images/img2.svg',
  'assets/images/img3.svg',
  'assets/images/img1.svg',
  'assets/images/img2.svg',
  'assets/images/img3.svg',
];
final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    SvgPicture.asset(
                      item.toString(),
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        // child: Text(
                        //   'No. ${imgList.indexOf(item)} image',
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 20.0,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class Price_Model {
  final String? text;

  Price_Model({this.text}) {}
}
