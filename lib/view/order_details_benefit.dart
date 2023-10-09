import 'package:carousel_slider/carousel_slider.dart';
import 'package:ekram_customer/controller/bottomNavBar_controllers.dart';
import 'package:ekram_customer/controller/orderDetailsBenfit_controllers.dart';
import 'package:ekram_customer/controller/orderDetailsSaveFood_controllers.dart';
import 'package:ekram_customer/shared/widget/box_Text_Field_Payment.dart';
import 'package:ekram_customer/shared/widget/box_Text_Field_Search.dart';
import 'package:ekram_customer/shared/widget/constants.dart';
import 'package:ekram_customer/shared/widget/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class OrderDetailsBenfitView extends StatelessWidget {
  final orderDetailsController = Get.put(OrderDetailsBenfitController());
 final controller = Get.put(BottomNavBarController());
  @override
  Widget build(BuildContext context) { var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return GetBuilder<OrderDetailsBenfitController>(
          init: OrderDetailsBenfitController(),
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
            GestureDetector( onTap: () {
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
                             if (orderDetailsController.status != 'ملغي' &&
                                orderDetailsController.status != 'مكتمل')
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
                                    width: 88,
                                    decoration: BoxDecoration(
                                        color:
                                            orderDetailsController.status1 == 1
                                                ? Color(0XFFCCA750)
                                                : Color(0xffB0B0B0)
                                                    .withOpacity(.3)),
                                  ),
                                  Container(
                                    height: 7,
                                    width: 88,
                                    decoration: BoxDecoration(
                                        color:
                                            orderDetailsController.status2 == 1
                                                ? Color(0XFFCCA750)
                                                : Color(0xffB0B0B0)
                                                    .withOpacity(.3)),
                                  ),
                                  Container(
                                    height: 7,
                                    width: 88,
                                    decoration: BoxDecoration(
                                        color:
                                            orderDetailsController.status4 == 1
                                                ? Color(0XFFCCA750)
                                                : Color(0xffB0B0B0)
                                                    .withOpacity(.3)),
                                  ),
                                  Container(
                                    height: 7,
                                    width: 88,
                                    decoration: BoxDecoration(
                                        color:
                                            orderDetailsController.status5 == 1
                                                ? Color(0XFFCCA750)
                                                : Color(0xffB0B0B0)
                                                    .withOpacity(.3)),
                                  ),
                                
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
                                 
                                  orderDetailsController.status = 'تم التسليم';

                                  orderDetailsController.status4 = 1;
                                }
                                // else if (orderDetailsController.status ==
                                //     'تم التسليم') {
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
                                          :  orderDetailsController.status ==
                                                     'تم التسليم'
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
                                                            'تم التسليم'
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
                           SizedBox(
                                          height: heightApp * 0.02,
                                        ),
                              Container(
                                height: 560,
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
                                                  'استفادة',
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
                                                  'نوع الاستفادة',
                                                  style: TextStyle(
                                                      color: Color(0xff686868),
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'din-next-lt-arabic light'),
                                                ),
                                                Text(
                                                  'وجبه - فواكه - خضروات',
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
                                                  'عدد المستفيدين',
                                                  style: TextStyle(
                                                      color: Color(0xff686868),
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'din-next-lt-arabic light'),
                                                ),
                                                Text(
                                                  '5',
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
                                press: () {     Get.toNamed('/TrackLocationView');}),
                          ))
                    else if (orderDetailsController.status == 'تم التسليم')
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
                                                OrderDetailsBenfitController>(
                                            init: OrderDetailsBenfitController(),
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
                                                                          onChanged: (value) {
                                                                            orderDetailsController.rateController.text =value;
                                                                            orderDetailsController.update();
                                                                          },
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
                    
                  ],
                )));
       
     }   );
  }
}


