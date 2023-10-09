import 'dart:io';

import 'package:ekram_customer/controller/bottomNavBar_controllers.dart';
import 'package:ekram_customer/controller/payment_controllers.dart';
import 'package:ekram_customer/shared/widget/box_Text_Field_Payment_Detials.dart';
import 'package:ekram_customer/shared/widget/constants.dart';
import 'package:ekram_customer/shared/widget/main_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:share_plus/share_plus.dart';

class PaymentView extends StatelessWidget {
  final paymentController = Get.put(PaymentController());
  final controller = Get.put(BottomNavBarController());
  List<Bank_Model> BankList = [
    Bank_Model(
        Image: 'assets/images/Al_Rajhi_Bank_Logo.png',
        NameAccount: 'جمعية إكرام لحفظ الطعام بمكة العام',
        NumberAccount: '141608013322110',
        IBANNumber: 'SA218000014160801332210'),
    Bank_Model(
        Image: 'assets/images/Alinma_Bank_logo.png',
        NameAccount: 'جمعية إكرام لحفظ الطعام بمكة العام',
        NumberAccount: '141608013322110',
        IBANNumber: 'SA618000014160801332210'),
    Bank_Model(
        Image: 'assets/images/ncblogo-removebg-preview.png',
        NameAccount: 'جمعية إكرام لحفظ الطعام بمكة العام',
        NumberAccount: '141608013322110',
        IBANNumber: 'SA818000014160801332210')
  ];
  @override
  Widget build(BuildContext context) { var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF8F8F8),
        body: GetBuilder<PaymentController>(
            init: PaymentController(),
            initState: (_) {},
            builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Container(
                          height: 190,
                          decoration: BoxDecoration(color: Color(0xff07706D)),
                          child: Stack(children: <Widget>[
                            Align(
                                alignment: Alignment.topLeft,
                                child: Image.asset("assets/images/Path.png")),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(22.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                                                                                                                                                    Navigator.pop(context);

                                      },
                                      child: SvgPicture.asset(
                                          "assets/images/arrow_back.svg"),
                                    ),
                                    Text(
                                      "الدفع",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontFamily:
                                              'din-next-lt-arabic Light'),
                                    ),
                                    Text(
                                      "        ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontFamily:
                                              'din-next-lt-arabic Light'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ])),
                      FractionalTranslation(
                        translation: Offset(0.0, 0.5),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color(0XFFCCA750),
                                borderRadius: BorderRadius.circular(10)),
                            width: 368,
                            height: 100,
                            child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child:
                                        Image.asset("assets/images/IMG.png")),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 22, left: 22, right: 22),
                                    child: Column(
                                      children: [
                                        Text(
                                          'المبلغ الإجمالي',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily:
                                                  'din-next-lt-arabic Medium'),
                                        ),
                                        SizedBox(
                                          height: heightApp * 0.01,
                                        ),
                                        Text(
                                          '500.00 ر.س',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily:
                                                  'din-next-lt-arabic Medium'),
                                        ),
                                      ],
                                    )),
                              ],
                            )),
                      )
                    ],
                  ),
                  SizedBox(height: heightApp * 0.06),
                  if (GetStorage().read('TypeUser').toString() == 'Customer')
                    Expanded(
                        child: SingleChildScrollView(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
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
                                      'اختر طريقة الدفع',
                                      style: TextStyle(
                                          color: Color(0XFFA2B156),
                                          fontSize: 18,
                                          fontFamily:
                                              'din-next-lt-arabic Light'),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: heightApp * 0.02,
                                ),
                                Container(
                                    height: paymentController.selectedOption !=
                                            'البطاقة الائتمانية'
                                        ? 150
                                        : 360,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(3),
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
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  border: Border.all(
                                                      color: paymentController
                                                                  .selectedOption ==
                                                              'Apple Pay'
                                                          ? Color(0XFFCCA750)
                                                          : Colors
                                                              .transparent)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Radio<String>(
                                                          activeColor:
                                                              Color(0XFFCCA750),
                                                          value: 'Apple Pay',
                                                          groupValue:
                                                              paymentController
                                                                  .selectedOption,
                                                          onChanged:
                                                              (String? value) {
                                                            paymentController
                                                                    .selectedOption =
                                                                value!;
                                                            print(
                                                                "Selected Option: ${paymentController.selectedOption}");
                                                            paymentController
                                                                .update();
                                                          },
                                                        ),
                                                        Text(
                                                          'Apple Pay',
                                                          style: TextStyle(
                                                              color: paymentController
                                                                          .selectedOption ==
                                                                      'Apple Pay'
                                                                  ? Color(
                                                                      0XFFCCA750)
                                                                  : Color(
                                                                      0XFF686868),
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  'din-next-lt-arabic light'),
                                                        ),
                                                      ],
                                                    ),
                                                    Image.asset(
                                                        'assets/images/ApplePay_Black.png')
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: heightApp * 0.01,
                                            ),
                                            Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                    border: Border.all(
                                                        color: paymentController
                                                                    .selectedOption ==
                                                                'البطاقة الائتمانية'
                                                            ? Color(0XFFCCA750)
                                                            : Colors
                                                                .transparent)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Radio<String>(
                                                            activeColor: Color(
                                                                0XFFCCA750),
                                                            value:
                                                                'البطاقة الائتمانية',
                                                            groupValue:
                                                                paymentController
                                                                    .selectedOption,
                                                            onChanged: (String?
                                                                value) {
                                                              paymentController
                                                                      .selectedOption =
                                                                  value!;
                                                              print(
                                                                  "Selected Option: ${paymentController.selectedOption}");
                                                              paymentController
                                                                  .update();
                                                            },
                                                          ),
                                                          Text(
                                                            'البطاقة الائتمانية',
                                                            style: TextStyle(
                                                                color: paymentController
                                                                            .selectedOption ==
                                                                        'البطاقة الائتمانية'
                                                                    ? Color(
                                                                        0XFFCCA750)
                                                                    : Color(
                                                                        0XFF686868),
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'din-next-lt-arabic light'),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Image.asset(
                                                              'assets/images/visa.png'),
                                                          SizedBox(
                                                            width:
                                                                widthApp * 0.02,
                                                          ),
                                                          Image.asset(
                                                              'assets/images/mada.png')
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                            if (paymentController
                                                    .selectedOption ==
                                                'البطاقة الائتمانية')
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(22.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'اختر بطاقة الدفع',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0XFF686868),
                                                          fontSize: 15,
                                                          fontFamily:
                                                              'din-next-lt-arabic light'),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Radio<int>(
                                                              activeColor: Color(
                                                                  0XFFCCA750),
                                                              value: 1,
                                                              groupValue:
                                                                  paymentController
                                                                      .selectedOption2,
                                                              onChanged:
                                                                  (int? value) {
                                                                paymentController
                                                                        .selectedOption2 =
                                                                    value!;
                                                                print(
                                                                    "Selected Option: ${paymentController.selectedOption2}");
                                                                paymentController
                                                                    .update();
                                                              },
                                                            ),
                                                            Image.asset(
                                                                'assets/images/mada.png'),
                                                            SizedBox(
                                                              width: widthApp *
                                                                  0.01,
                                                            ),
                                                            Text(
                                                              '5565 ****',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      'din-next-lt-arabic light'),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          'حذف',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0XFF686868),
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  'din-next-lt-arabic light'),
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(
                                                      thickness: 1,
                                                      color: Color(0xffE4E4E4),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Radio<int>(
                                                              activeColor: Color(
                                                                  0XFFCCA750),
                                                              value: 2,
                                                              groupValue:
                                                                  paymentController
                                                                      .selectedOption2,
                                                              onChanged:
                                                                  (int? value) {
                                                                paymentController
                                                                        .selectedOption2 =
                                                                    value!;
                                                                print(
                                                                    "Selected Option: ${paymentController.selectedOption2}");
                                                                paymentController
                                                                    .update();
                                                              },
                                                            ),
                                                            Image.asset(
                                                                'assets/images/visa.png'),
                                                            SizedBox(
                                                              width: widthApp *
                                                                  0.01,
                                                            ),
                                                            Text(
                                                              '1592 ****',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      'din-next-lt-arabic light'),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          'حذف',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0XFF686868),
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  'din-next-lt-arabic light'),
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(
                                                      thickness: 1,
                                                      color: Color(0xffE4E4E4),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        showModalBottomSheet(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return GetBuilder<
                                                                      PaymentController>(
                                                                  init:
                                                                      PaymentController(),
                                                                  initState:
                                                                      (_) {},
                                                                  builder: (_) {
                                                                    return Padding(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .only(
                                                                        bottom: MediaQuery.of(context)
                                                                            .viewInsets
                                                                            .bottom,
                                                                      ),
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius: BorderRadius.only(
                                                                              topLeft: Radius.circular(20.0),
                                                                              topRight: Radius.circular(20.0)),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                500,
                                                                            color:
                                                                                Color(0XFFF8F8F8),
                                                                            child:
                                                                                Padding(
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
                                                                                          'إضافة بطاقة جديدة',
                                                                                          style: TextStyle(color: Color(0XFFA2B156), fontSize: 18, fontFamily: 'din-next-lt-arabic Light'),
                                                                                        ),
                                                                                      ],
                                                                                    ),
 GestureDetector(
                                                                                                  onTap: () {
                                                                                                    Navigator.pop(context);
                                                                                                  },
                                                                                                  child: SvgPicture.asset('assets/images/close_black.svg'))                                                                                  ],
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
                                                                                    height: 220,
                                                                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), border: Border.all(color: Color(0xffEEEEEE))),
                                                                                    child: Column(
                                                                                      children: [
                                                                                        BoxTextFieldPaymentDetials(
                                                                                          hintText: 'رقم البطاقة',
                                                                                        ),
                                                                                        Divider(
                                                                                          thickness: 1,
                                                                                          color: Color(0xffE4E4E4),
                                                                                        ),
                                                                                        BoxTextFieldPaymentDetials(
                                                                                          hintText: 'MM/YY',
                                                                                        ),
                                                                                        Divider(
                                                                                          thickness: 1,
                                                                                          color: Color(0xffE4E4E4),
                                                                                        ),
                                                                                        BoxTextFieldPaymentDetials(
                                                                                          hintText: 'رمز التحقق CVV',
                                                                                        ),
                                                                                      ],
                                                                                    )),
                                                                                SizedBox(
                                                                                  height: heightApp * 0.02,
                                                                                ),
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'احفظ البطاقة لعمليات التبرع اللاحقة',
                                                                                      style: TextStyle(color: Color(0xff55585D), fontSize: 18, fontFamily: 'din-next-lt-arabic light'),
                                                                                    ),
                                                                                    CupertinoSwitch(
                                                                                      activeColor: Color(0XFFCCA750),
                                                                                      value: paymentController.switchValue,
                                                                                      onChanged: (value) {
                                                                                        paymentController.switchValue = value;
                                                                                        paymentController.update();
                                                                                      },
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                SizedBox(
                                                                                  height: heightApp * 0.02,
                                                                                ),
                                                                                MainButton(
                                                                                  text: 'حفظ',
                                                                                  press: () {
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  color: Color(0XFFCCA750),
                                                                                )
                                                                              ]),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  });
                                                            });
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.add,
                                                            color: Color(
                                                                0xffA2B156),
                                                            size: 15.9,
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                widthApp * 0.01,
                                                          ),
                                                          Text(
                                                            'أضف بطاقة جديدة',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xffA2B156),
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'din-next-lt-arabic light'),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ))),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))
                  else if (GetStorage().read('TypeUser').toString() ==
                      'Business')
                    Expanded(
                        child: SingleChildScrollView(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
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
                                      'اختر طريقة الدفع',
                                      style: TextStyle(
                                          color: Color(0XFFA2B156),
                                          fontSize: 18,
                                          fontFamily:
                                              'din-next-lt-arabic Light'),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: heightApp * 0.02,
                                ),
                                ClipPath(
                                    clipper: ShapeBorderClipper(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                    child: Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border(
                                          right: BorderSide(
                                              width: 5.0,
                                              color: Color(0XFFCCA750)),
                                        ),
                                      ),
                                      child: ExpansionTile(
                                        onExpansionChanged: (bool expanded) {
                                          paymentController.isExpanded =
                                              expanded;
                                          paymentController.update();
                                        },
                                        trailing: paymentController.isExpanded
                                            ? SvgPicture.asset(
                                                'assets/images/arrow_down.svg')
                                            : SvgPicture.asset(
                                                'assets/images/arrow_top.svg'),
                                        iconColor: Color(0XFFCCA750),
                                        collapsedIconColor: Color(0xff504E49),
                                        textColor: Color(0XFFCCA750),
                                        collapsedTextColor: Color(0xff504E49),
                                        title: Text(
                                          'التبرع السريع',
                                          style: TextStyle(
                                              // color: Color(0xff504E49),
                                              fontSize: 15.0,
                                              fontFamily:
                                                  'din-next-lt-arabic Light'),
                                        ),
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Divider(
                                              thickness: 1,
                                              color: Color(0xffE4E4E4),
                                            ),
                                          ),
                                          Container(
                                              height: paymentController
                                                          .selectedOption !=
                                                      'البطاقة الائتمانية'
                                                  ? 150
                                                  : 360,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10,
                                                          right: 10,
                                                          top: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      //             SizedBox(
                                                      //   height: heightApp * 0.01,
                                                      // ),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3),
                                                            border: Border.all(
                                                                color: paymentController
                                                                            .selectedOption ==
                                                                        'Apple Pay'
                                                                    ? Color(
                                                                        0XFFCCA750)
                                                                    : Colors
                                                                        .transparent)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Radio<String>(
                                                                    activeColor:
                                                                        Color(
                                                                            0XFFCCA750),
                                                                    value:
                                                                        'Apple Pay',
                                                                    groupValue:
                                                                        paymentController
                                                                            .selectedOption,
                                                                    onChanged:
                                                                        (String?
                                                                            value) {
                                                                      paymentController
                                                                              .selectedOption =
                                                                          value!;
                                                                      print(
                                                                          "Selected Option: ${paymentController.selectedOption}");
                                                                      paymentController
                                                                          .update();
                                                                    },
                                                                  ),
                                                                  Text(
                                                                    'Apple Pay',
                                                                    style: TextStyle(
                                                                        color: paymentController.selectedOption ==
                                                                                'Apple Pay'
                                                                            ? Color(
                                                                                0XFFCCA750)
                                                                            : Color(
                                                                                0XFF686868),
                                                                        fontSize:
                                                                            15,
                                                                        fontFamily:
                                                                            'din-next-lt-arabic light'),
                                                                  ),
                                                                ],
                                                              ),
                                                              Image.asset(
                                                                  'assets/images/ApplePay_Black.png')
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            heightApp * 0.01,
                                                      ),
                                                      Container(
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          3),
                                                              border: Border.all(
                                                                  color: paymentController
                                                                              .selectedOption ==
                                                                          'البطاقة الائتمانية'
                                                                      ? Color(
                                                                          0XFFCCA750)
                                                                      : Colors
                                                                          .transparent)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Radio<
                                                                        String>(
                                                                      activeColor:
                                                                          Color(
                                                                              0XFFCCA750),
                                                                      value:
                                                                          'البطاقة الائتمانية',
                                                                      groupValue:
                                                                          paymentController
                                                                              .selectedOption,
                                                                      onChanged:
                                                                          (String?
                                                                              value) {
                                                                        paymentController.selectedOption =
                                                                            value!;
                                                                        print(
                                                                            "Selected Option: ${paymentController.selectedOption}");
                                                                        paymentController
                                                                            .update();
                                                                      },
                                                                    ),
                                                                    Text(
                                                                      'البطاقة الائتمانية',
                                                                      style: TextStyle(
                                                                          color: paymentController.selectedOption == 'البطاقة الائتمانية'
                                                                              ? Color(
                                                                                  0XFFCCA750)
                                                                              : Color(
                                                                                  0XFF686868),
                                                                          fontSize:
                                                                              15,
                                                                          fontFamily:
                                                                              'din-next-lt-arabic light'),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Image.asset(
                                                                        'assets/images/visa.png'),
                                                                    SizedBox(
                                                                      width: widthApp *
                                                                          0.02,
                                                                    ),
                                                                    Image.asset(
                                                                        'assets/images/mada.png')
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          )),
                                                      if (paymentController
                                                              .selectedOption ==
                                                          'البطاقة الائتمانية')
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(22.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'اختر بطاقة الدفع',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0XFF686868),
                                                                    fontSize:
                                                                        15,
                                                                    fontFamily:
                                                                        'din-next-lt-arabic light'),
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Radio<
                                                                          int>(
                                                                        activeColor:
                                                                            Color(0XFFCCA750),
                                                                        value:
                                                                            1,
                                                                        groupValue:
                                                                            paymentController.selectedOption2,
                                                                        onChanged:
                                                                            (int?
                                                                                value) {
                                                                          paymentController.selectedOption2 =
                                                                              value!;
                                                                          print(
                                                                              "Selected Option: ${paymentController.selectedOption2}");
                                                                          paymentController
                                                                              .update();
                                                                        },
                                                                      ),
                                                                      Image.asset(
                                                                          'assets/images/mada.png'),
                                                                      SizedBox(
                                                                        width: widthApp *
                                                                            0.01,
                                                                      ),
                                                                      Text(
                                                                        '5565 ****',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                15,
                                                                            fontFamily:
                                                                                'din-next-lt-arabic light'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Text(
                                                                    'حذف',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0XFF686868),
                                                                        fontSize:
                                                                            15,
                                                                        fontFamily:
                                                                            'din-next-lt-arabic light'),
                                                                  ),
                                                                ],
                                                              ),
                                                              Divider(
                                                                thickness: 1,
                                                                color: Color(
                                                                    0xffE4E4E4),
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Radio<
                                                                          int>(
                                                                        activeColor:
                                                                            Color(0XFFCCA750),
                                                                        value:
                                                                            2,
                                                                        groupValue:
                                                                            paymentController.selectedOption2,
                                                                        onChanged:
                                                                            (int?
                                                                                value) {
                                                                          paymentController.selectedOption2 =
                                                                              value!;
                                                                          print(
                                                                              "Selected Option: ${paymentController.selectedOption2}");
                                                                          paymentController
                                                                              .update();
                                                                        },
                                                                      ),
                                                                      Image.asset(
                                                                          'assets/images/visa.png'),
                                                                      SizedBox(
                                                                        width: widthApp *
                                                                            0.01,
                                                                      ),
                                                                      Text(
                                                                        '1592 ****',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                15,
                                                                            fontFamily:
                                                                                'din-next-lt-arabic light'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Text(
                                                                    'حذف',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0XFF686868),
                                                                        fontSize:
                                                                            15,
                                                                        fontFamily:
                                                                            'din-next-lt-arabic light'),
                                                                  ),
                                                                ],
                                                              ),
                                                              Divider(
                                                                thickness: 1,
                                                                color: Color(
                                                                    0xffE4E4E4),
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  showModalBottomSheet(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return GetBuilder<
                                                                                PaymentController>(
                                                                            init:
                                                                                PaymentController(),
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
                                                                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                                                                                    child: Container(
                                                                                      height: 500,
                                                                                      color: Color(0XFFF8F8F8),
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
                                                                                                    'إضافة بطاقة جديدة',
                                                                                                    style: TextStyle(color: Color(0XFFA2B156), fontSize: 18, fontFamily: 'din-next-lt-arabic Light'),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
 GestureDetector(
                                                                                                  onTap: () {
                                                                                                    Navigator.pop(context);
                                                                                                  },
                                                                                                  child: SvgPicture.asset('assets/images/close_black.svg'))                                                                                            ],
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
                                                                                              height: 220,
                                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), border: Border.all(color: Color(0xffEEEEEE))),
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  BoxTextFieldPaymentDetials(
                                                                                                    hintText: 'رقم البطاقة',
                                                                                                  ),
                                                                                                  Divider(
                                                                                                    thickness: 1,
                                                                                                    color: Color(0xffE4E4E4),
                                                                                                  ),
                                                                                                  BoxTextFieldPaymentDetials(
                                                                                                    hintText: 'MM/YY',
                                                                                                  ),
                                                                                                  Divider(
                                                                                                    thickness: 1,
                                                                                                    color: Color(0xffE4E4E4),
                                                                                                  ),
                                                                                                  BoxTextFieldPaymentDetials(
                                                                                                    hintText: 'رمز التحقق CVV',
                                                                                                  ),
                                                                                                ],
                                                                                              )),
                                                                                          SizedBox(
                                                                                            height: heightApp * 0.02,
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                'احفظ البطاقة لعمليات التبرع اللاحقة',
                                                                                                style: TextStyle(color: Color(0xff55585D), fontSize: 18, fontFamily: 'din-next-lt-arabic light'),
                                                                                              ),
                                                                                              CupertinoSwitch(
                                                                                                activeColor: Color(0XFFCCA750),
                                                                                                value: paymentController.switchValue,
                                                                                                onChanged: (value) {
                                                                                                  paymentController.switchValue = value;
                                                                                                  paymentController.update();
                                                                                                },
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          SizedBox(
                                                                                            height: heightApp * 0.02,
                                                                                          ),
                                                                                          MainButton(
                                                                                            text: 'حفظ',
                                                                                            press: () {
                                                                                              Navigator.pop(context);
                                                                                            },
                                                                                            color: Color(0XFFCCA750),
                                                                                          )
                                                                                        ]),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            });
                                                                      });
                                                                },
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons.add,
                                                                      color: Color(
                                                                          0xffA2B156),
                                                                      size:
                                                                          15.9,
                                                                    ),
                                                                    SizedBox(
                                                                      width: widthApp *
                                                                          0.01,
                                                                    ),
                                                                    Text(
                                                                      'أضف بطاقة جديدة',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffA2B156),
                                                                          fontSize:
                                                                              15,
                                                                          fontFamily:
                                                                              'din-next-lt-arabic light'),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                    ],
                                                  ))),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: heightApp * 0.02,
                                ),
                                ClipPath(
                                    clipper: ShapeBorderClipper(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                    child: Container(
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border(
                                            right: BorderSide(
                                                width: 5.0,
                                                color: Color(0XFFCCA750)),
                                          ),
                                        ),
                                        child: ListView.builder(
                                          padding: EdgeInsets.all(0),
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: 1,
                                          itemBuilder: (context, i) {
                                            return ExpansionTile(
                                              // key: _expansionTileKey,
                                              onExpansionChanged:
                                                  (bool expanded) {
                                                paymentController.isExpanded =
                                                    expanded;
                                                paymentController.update();
                                              },
                                              trailing: paymentController
                                                      .isExpanded
                                                  ? SvgPicture.asset(
                                                      'assets/images/arrow_down.svg')
                                                  : SvgPicture.asset(
                                                      'assets/images/arrow_top.svg'),
                                              iconColor: Color(0XFFCCA750),
                                              collapsedIconColor:
                                                  Color(0xff504E49),
                                              textColor: Color(0XFFCCA750),
                                              collapsedTextColor:
                                                  Color(0xff504E49),
                                              title: Text(
                                                'التحويل البنكي',
                                                style: TextStyle(
                                                    // color: Color(0xff504E49),
                                                    fontSize: 15.0,
                                                    fontFamily:
                                                        'din-next-lt-arabic Light'),
                                              ),
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Divider(
                                                    thickness: 1,
                                                    color: Color(0xffE4E4E4),
                                                  ),
                                                ),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Color(0XFFB0B0B0)
                                                                    .withOpacity(
                                                                        .1)),
                                                            color:
                                                                Color(0XFFB0B0B0)
                                                                    .withOpacity(
                                                                        .1),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    10)),
                                                        child: Padding(
                                                            padding:
                                                                const EdgeInsets.only(
                                                                    left: 8,
                                                                    right: 8),
                                                            child:
                                                                ListView.separated(
                                                              physics:
                                                                  NeverScrollableScrollPhysics(),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(0),
                                                              shrinkWrap: true,
                                                              itemCount:
                                                                  BankList
                                                                      .length,
                                                              itemBuilder:
                                                                  (_, index) {
                                                                return GestureDetector(
                                                                  onTap: () {
                                                                    paymentController
                                                                        .onSelectCat3(
                                                                            index);

                                                                    showModalBottomSheet(
                                                                        context:
                                                                            context,
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            const Color(
                                                                                0XFFF8F8F8),
                                                                        shape:
                                                                            const RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(10.0),
                                                                            topRight:
                                                                                Radius.circular(10.0),
                                                                          ),
                                                                        ),
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return GetBuilder<PaymentController>(
                                                                              init: PaymentController(),
                                                                              initState: (_) {},
                                                                              builder: (_) {
                                                                                return Container(
                                                                                    height: MediaQuery.of(context).size.height * 0.40,
                                                                                    child: Padding(
                                                                                        padding: const EdgeInsets.only(left: 20, right: 20),
                                                                                        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                                          SizedBox(
                                                                                            height: heightApp * 0.02,
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Image.asset(
                                                                                                BankList[index].Image.toString(),
                                                                                                height: 60,
                                                                                                width: 70,
                                                                                              ),
                                                                                              GestureDetector(
                                                                                                  onTap: () {
                                                                                                    Navigator.pop(context);
                                                                                                  },
                                                                                                  child: SvgPicture.asset('assets/images/close_black.svg'))
                                                                                            ],
                                                                                          ),
                                                                                          const Divider(
                                                                                            thickness: 1,
                                                                                            color: Color(0xffE4E4E4),
                                                                                          ),
                                                                                          SizedBox(
                                                                                            height: heightApp * 0.02,
                                                                                          ),
                                                                                          ClipPath(
                                                                                              clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                                                                                              child: Container(
                                                                                                  height: 54,
                                                                                                  alignment: Alignment.center,
                                                                                                  width: double.infinity,
                                                                                                  padding: EdgeInsets.all(6),
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Colors.white,
                                                                                                    border: Border(
                                                                                                      right: BorderSide(width: 5.0, color: Color(0XFFCCA750)),
                                                                                                      left: BorderSide(width: 1, color: Color(0xff707070).withOpacity(.2)),
                                                                                                      top: BorderSide(width: 1, color: Color(0xff707070).withOpacity(.2)),
                                                                                                      bottom: BorderSide(width: 1, color: Color(0xff707070).withOpacity(.2)),
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        'صاحب الحساب',
                                                                                                        style: TextStyle(fontSize: 15.0, color: Color(0XFFCCA750), fontFamily: 'din-next-lt-arabic Light'),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        BankList[index].NameAccount.toString(),
                                                                                                        style: TextStyle(fontSize: 15.0, color: Color(0xff504E49), fontFamily: 'din-next-lt-arabic Light'),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ))),
                                                                                          SizedBox(
                                                                                            height: heightApp * 0.02,
                                                                                          ),
                                                                                          ClipPath(
                                                                                              clipper: ShapeBorderClipper(
                                                                                                  shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(5),
                                                                                              )),
                                                                                              child: Container(
                                                                                                height: 54,
                                                                                                alignment: Alignment.center,
                                                                                                width: double.infinity,
                                                                                                padding: EdgeInsets.all(6),
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Colors.white,
                                                                                                  border: Border(
                                                                                                    right: BorderSide(width: 5.0, color: Color(0XFFCCA750)),
                                                                                                    left: BorderSide(width: 1, color: Color(0xff707070).withOpacity(.2)),
                                                                                                    top: BorderSide(width: 1, color: Color(0xff707070).withOpacity(.2)),
                                                                                                    bottom: BorderSide(width: 1, color: Color(0xff707070).withOpacity(.2)),
                                                                                                  ),
                                                                                                ),
                                                                                                child: Row(
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'رقم الحساب',
                                                                                                      style: TextStyle(fontSize: 15.0, color: Color(0XFFCCA750), fontFamily: 'din-next-lt-arabic Light'),
                                                                                                    ),
                                                                                                    Row(
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          BankList[index].NumberAccount.toString(),
                                                                                                          style: TextStyle(fontSize: 15.0, color: Color(0xff504E49), fontFamily: 'din-next-lt-arabic Light'),
                                                                                                        ),
                                                                                                        SizedBox(
                                                                                                          width: widthApp * 0.02,
                                                                                                        ),
                                                                                                        GestureDetector(
                                                                                                          onTap: () {
                                                                                                            Share.share(BankList[index].NumberAccount.toString());
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            width: 24,
                                                                                                            height: 24,
                                                                                                            decoration: BoxDecoration(color: Color(0XFFCCA750), borderRadius: BorderRadius.circular(5)),
                                                                                                            child: Center(child: SvgPicture.asset('assets/images/copy.svg')),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              )),
                                                                                          SizedBox(
                                                                                            height: heightApp * 0.02,
                                                                                          ),
                                                                                          ClipPath(
                                                                                              clipper: ShapeBorderClipper(
                                                                                                  shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(5),
                                                                                              )),
                                                                                              child: Container(
                                                                                                height: 54,
                                                                                                alignment: Alignment.center,
                                                                                                width: double.infinity,
                                                                                                padding: EdgeInsets.all(6),
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Colors.white,
                                                                                                  border: Border(
                                                                                                    right: BorderSide(width: 5.0, color: Color(0XFFCCA750)),
                                                                                                    left: BorderSide(width: 1, color: Color(0xff707070).withOpacity(.2)),
                                                                                                    top: BorderSide(width: 1, color: Color(0xff707070).withOpacity(.2)),
                                                                                                    bottom: BorderSide(width: 1, color: Color(0xff707070).withOpacity(.2)),
                                                                                                  ),
                                                                                                ),
                                                                                                child: Row(
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'رقم الآيبان',
                                                                                                      style: TextStyle(fontSize: 15.0, color: Color(0XFFCCA750), fontFamily: 'din-next-lt-arabic Light'),
                                                                                                    ),
                                                                                                    Row(
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          BankList[index].IBANNumber.toString(),
                                                                                                          style: TextStyle(fontSize: 15.0, color: Color(0xff504E49), fontFamily: 'din-next-lt-arabic Light'),
                                                                                                        ),
                                                                                                        SizedBox(
                                                                                                          width: widthApp * 0.02,
                                                                                                        ),
                                                                                                        GestureDetector(
                                                                                                          onTap: () {
                                                                                                            Share.share(BankList[index].IBANNumber.toString());
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            width: 24,
                                                                                                            height: 24,
                                                                                                            decoration: BoxDecoration(color: Color(0XFFCCA750), borderRadius: BorderRadius.circular(5)),
                                                                                                            child: Center(child: SvgPicture.asset('assets/images/copy.svg')),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ))
                                                                                        ])));
                                                                              });
                                                                        });
                                                                  },
                                                                  child:
                                                                      SizedBox(
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          BankList[index]
                                                                              .Image
                                                                              .toString(),
                                                                          height:
                                                                              60,
                                                                          width:
                                                                              70,
                                                                        ),
                                                                        SvgPicture.asset(
                                                                            "assets/images/Iconly-Light-Arrow - Right 2.svg")
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              separatorBuilder:
                                                                  (_, i) =>
                                                                      Divider(
                                                                color: Color(
                                                                    0xffEEEEEE),
                                                                thickness: 1.0,
                                                              ),
                                                            )))),
                                                SizedBox(
                                                  height: heightApp * 0.01,
                                                ),
                                                paymentController.image.path ==
                                                        ''
                                                    ? GestureDetector(
                                                        onTap: () {
                                                          paymentController
                                                              .getImage();
                                                        },
                                                        child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                                height: 60,
                                                                width: double
                                                                    .infinity,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Color(0XFFB0B0B0).withOpacity(
                                                                            .1)),
                                                                    color: Color(
                                                                            0XFFB0B0B0)
                                                                        .withOpacity(
                                                                            .1),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'الرجاء إرفاق صورة الإيصال',
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0XFFB0B0B0),
                                                                            fontSize:
                                                                                15.0,
                                                                            fontFamily:
                                                                                'din-next-lt-arabic Light'),
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .file_upload_outlined,
                                                                        color: Color(
                                                                            0XFFB0B0B0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ))),
                                                      )
                                                    : Column(
                                                      children: [
                                                        Card(
                                                            margin: EdgeInsets.zero,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        10),
                                                                side: BorderSide(
                                                                    color: Color(
                                                                            0XFFB0B0B0)
                                                                        .withOpacity(
                                                                            .1),
                                                                    width: 2)),
                                                            child: Container(
                                                              // margin: const EdgeInsets.all(8),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                child: Container(
                                                                  height: 300,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0XFFB0B0B0),
                                                                    image:
                                                                        DecorationImage(
                                                                      image: FileImage(
                                                                          paymentController
                                                                              .image),
                                                                      fit: BoxFit
                                                                          .fill,
                                                                    ),
                                                                  ),
                                                                  child: InkWell(
                                                                    onTap: () {
                                                                      paymentController
                                                                              .image =
                                                                          File('');
                                                                      paymentController
                                                                          .update();
                                                                    },
                                                                    child: Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topLeft,
                                                                      child:
                                                                          Container(
                                                                        width: 24,
                                                                        height: 24,
                                                                        margin:
                                                                            const EdgeInsets.all(
                                                                                12),
                                                                        // padding:
                                                                        //     const EdgeInsets
                                                                        //         .all(2),
                                                                        decoration: BoxDecoration(
                                                                            color: Color(
                                                                                0XFFCCA750),
                                                                            borderRadius:
                                                                                BorderRadius.circular(5)),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              const Icon(
                                                                            Icons
                                                                                .remove,
                                                                            color: Colors
                                                                                .white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                    
SizedBox(height: heightApp*0.02,),
                                                       MainButton(
                                  color: const Color(0XFFCCA750),
                                  text: 'إرسال',
                                  press: () {
   showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        Future.delayed(Duration(seconds: 2),
                                            () {
                                          controller.selectedTab = 0;
                                          Get.offAllNamed('/CustomTabBar');
                                          controller.update();
                                        });
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16.0)),
                                          elevation: 0.0,
                                          backgroundColor: Colors.transparent,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 0.0, right: 0.0),
                                            child: Stack(
                                              children: <Widget>[
                                                Container(
                                                  height: 305,
                                                  width: 368,
                                                  padding: EdgeInsets.only(
                                                    top: 18.0,
                                                  ),
                                                  margin: EdgeInsets.only(
                                                      top: 13.0, left: 8.0),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      shape: BoxShape.rectangle,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                      boxShadow: <BoxShadow>[
                                                        BoxShadow(
                                                          color: Colors.black26,
                                                          blurRadius: 0.0,
                                                          offset:
                                                              Offset(0.0, 0.0),
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
                                                        height:
                                                            heightApp * 0.04,
                                                      ),
                                                      SvgPicture.asset(
                                                          'assets/images/thanks.svg'),
                                                      SizedBox(
                                                        height:
                                                            heightApp * 0.02,
                                                      ),
                                                      Text(
                                                        "سيتم التحقق من البيانات ",
                                                        style: TextStyle(
                                                           color: Color(
                                                                0xff55585D),
                                                            fontSize: 24,
                                                            fontFamily:
                                                                'din-next-lt-arabic light'),
                                                      ),
                                                    
                                                      SizedBox(
                                                        height:
                                                            heightApp * 0.04,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 0.0,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller.selectedTab =
                                                          0;
                                                      Get.offAllNamed(
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
                                                                blurRadius: 15,
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

                                  })  ],
                                                    ),
                                              ],
                                            );
                                          },
                                        ))),
                                SizedBox(
                                  height: heightApp * 0.02,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
                  Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 40, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                    'assets/images/paymentSucess.svg'),
                                Text(
                                  'جميع خيارات الدفع آمنة 100 %',
                                  style: TextStyle(
                                      color: Color(0XFFA2B156),
                                      fontSize: 14,
                                      fontFamily: 'din-next-lt-arabic Light'),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'بإتمام عملية التبرع أنت توافق على',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'din-next-lt-arabic light'),
                                ),
                                SizedBox(
                                  width: widthApp * 0.01,
                                ),
                                Text(
                                  'سياسات التبرع',
                                  style: TextStyle(
                                      color: Color(0XFFA2B156),
                                      fontSize: 14,
                                      fontFamily: 'din-next-lt-arabic Light'),
                                )
                              ],
                            ),
                            SizedBox(
                              height: heightApp * 0.02,
                            ),
                            if (paymentController.selectedOption == 'Apple Pay')
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        Future.delayed(Duration(seconds: 2),
                                            () {
                                          controller.selectedTab = 0;
                                          Get.offAndToNamed('/CustomTabBar');
                                          controller.update();
                                        });
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16.0)),
                                          elevation: 0.0,
                                          backgroundColor: Colors.transparent,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 0.0, right: 0.0),
                                            child: Stack(
                                              children: <Widget>[
                                                Container(
                                                  height: 305,
                                                  width: 368,
                                                  padding: EdgeInsets.only(
                                                    top: 18.0,
                                                  ),
                                                  margin: EdgeInsets.only(
                                                      top: 13.0, left: 8.0),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      shape: BoxShape.rectangle,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                      boxShadow: <BoxShadow>[
                                                        BoxShadow(
                                                          color: Colors.black26,
                                                          blurRadius: 0.0,
                                                          offset:
                                                              Offset(0.0, 0.0),
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
                                                        height:
                                                            heightApp * 0.04,
                                                      ),
                                                      SvgPicture.asset(
                                                          'assets/images/thanks.svg'),
                                                      SizedBox(
                                                        height:
                                                            heightApp * 0.02,
                                                      ),
                                                      Text(
                                                        "شكرًا لدعمك !",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0XFFCCA750),
                                                            fontSize: 24,
                                                            fontFamily:
                                                                'din-next-lt-arabic light'),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            heightApp * 0.01,
                                                      ),
                                                      Text(
                                                        "تمت عملية التبرع بنجاح",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff55585D),
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'din-next-lt-arabic light'),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            heightApp * 0.04,
                                                      ),
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
                                                                blurRadius: 15,
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
                                child: Container(
                                  width: double.infinity,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.black),
                                  child: Center(
                                      child: Image.asset(
                                    'assets/images/apple-pay-white.png',
                                    height: 30,
                                  )),
                                ),
                              ),
                            if (paymentController.selectedOption != 'Apple Pay')
                              MainButton(
                                  color: const Color(0XFFCCA750),
                                  text: 'إتمام عملية التبرع',
                                  press: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          Future.delayed(Duration(seconds: 2),
                                              () {
                                            controller.selectedTab = 0;
                                            Get.offAndToNamed('/CustomTabBar');
                                            controller.update();
                                          });
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
                                                    height: 305,
                                                    width: 368,
                                                    padding: EdgeInsets.only(
                                                      top: 18.0,
                                                    ),
                                                    margin: EdgeInsets.only(
                                                        top: 13.0, left: 8.0),
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
                                                        SizedBox(
                                                          height:
                                                              heightApp * 0.04,
                                                        ),
                                                        SvgPicture.asset(
                                                            'assets/images/thanks.svg'),
                                                        SizedBox(
                                                          height:
                                                              heightApp * 0.02,
                                                        ),
                                                        Text(
                                                          "شكرًا لدعمك !",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0XFFCCA750),
                                                              fontSize: 24,
                                                              fontFamily:
                                                                  'din-next-lt-arabic light'),
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              heightApp * 0.01,
                                                        ),
                                                        Text(
                                                          "تمت عملية التبرع بنجاح",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff55585D),
                                                              fontSize: 18,
                                                              fontFamily:
                                                                  'din-next-lt-arabic light'),
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              heightApp * 0.04,
                                                        ),
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
                                  }),
                          ],
                        ),
                      )),
                ],
              );
            }));
  }
}

class Bank_Model {
  final String? Image;
  final String? NameAccount;
  final String? NumberAccount;
  final String? IBANNumber;
  Bank_Model({
    this.Image,
    this.NameAccount,
    this.NumberAccount,
    this.IBANNumber,
  }) {}
}
