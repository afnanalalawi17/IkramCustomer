import 'package:ekram_customer/controller/orderDetailsBenfit_controllers.dart';
import 'package:ekram_customer/controller/orderDetailsSaveFoodBusiness_controllers.dart';
import 'package:ekram_customer/controller/orderDetailsSaveFood_controllers.dart';
import 'package:ekram_customer/database/Login_Stat_Controller.dart';
import 'package:ekram_customer/shared/widget/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OrderView extends StatelessWidget {
  final orderDetailsSaveFoodController =
      Get.put(OrderDetailsSaveFoodController());
  final orderDetailsBenfitController = Get.put(OrderDetailsBenfitController());
  final loginStat = Get.put(LoginStateController());
  final orderDetailsBusinessController = Get.put(OrderDetailsSaveFoodBusinessController());

  List<OrderSaveFoodModel> orderSaveFoodList = [
    OrderSaveFoodModel(
        order: '#3421674',
        DateAndTime: '21 يوليو 2023 - 10:3ص',
        status: const Color(0xffA2B156),
        statusOrder: 'مكتمل'),
    OrderSaveFoodModel(
        order: '#3421674',
        DateAndTime: '21 يوليو 2023 - 10:3ص',
        status: const Color(0xffB0B0B0),
        statusOrder: 'تحت الاجراء'),
    OrderSaveFoodModel(
        order: '#3421674',
        DateAndTime: '21 يوليو 2023 - 10:3ص',
        status: const Color(0xffC34949),
        statusOrder: 'ملغي'),
  ];
  List<OrderRequestBenfitModel> orderRequestBenfitList = [
    OrderRequestBenfitModel(
        order: '#3421674',
        DateAndTime: '21 يوليو 2023 - 10:3ص',
        status: const Color(0xffB0B0B0),
        statusOrder: 'تحت الاجراء'),
    OrderRequestBenfitModel(
        order: '#3421674',
        DateAndTime: '21 يوليو 2023 - 10:3ص',
        status: const Color(0xffA2B156),
        statusOrder: 'مكتمل'),
    OrderRequestBenfitModel(
        order: '#3421674',
        DateAndTime: '21 يوليو 2023 - 10:3ص',
        status: const Color(0xffA2B156),
        statusOrder: 'مكتمل'),
    OrderRequestBenfitModel(
        order: '#3421674',
        DateAndTime: '21 يوليو 2023 - 10:3ص',
        status: const Color(0xffC34949),
        statusOrder: 'ملغي'),
  ];
  @override
  Widget build(BuildContext context) { var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(

        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xff07706D),
        appBar: AppBar(centerTitle: true,
          automaticallyImplyLeading: false,
          leadingWidth: 60,
          title: const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              "طلباتي",
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
          child: loginStat.loginState == 'notLogin'
              ? Center(
                  child: Text(
                  'لايوجد طلبات ',
                  style: TextStyle(
                      color: Color(0XFFCCA750),
                      fontSize: 16,
                      fontFamily: 'din-next-lt-arabic Medium'),
                ))
              : Column(children: [
                  SizedBox(
                    height: heightApp * 0.03,
                  ),

                  if (GetStorage().read('TypeUser') == 'Customer')
                    const TabBar(
                      indicator: UnderlineTabIndicator(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5)),
                        borderSide:
                            BorderSide(color: Color(0XFFCCA750), width: 4),
                        insets: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      labelColor: Color(0XFFCCA750),
                      labelStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: 'din-next-lt-arabic Medium'),
                      unselectedLabelStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: 'din-next-lt-arabic Medium'),
                      unselectedLabelColor: Color(0xffB9B9B9),
                      tabs: [
                        Tab(text: 'طلب حفظ نعمة'),
                        Tab(text: 'طلب استفادة'),
                      ],
                    )
                  else if (GetStorage().read('TypeUser') == 'Business')
                    const TabBar(
                      indicator: UnderlineTabIndicator(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5)),
                        borderSide:
                            BorderSide(color: Color(0XFFCCA750), width: 4),
                        insets: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      labelColor: Color(0XFFCCA750),
                      labelStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: 'din-next-lt-arabic Medium'),
                      unselectedLabelStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: 'din-next-lt-arabic Medium'),
                      unselectedLabelColor: Color(0xffB9B9B9),
                      tabs: [
                        Tab(text: 'طلباتي الحالية'),
                        Tab(text: 'طلباتي السابقة'),
                      ],
                    ),
                  SizedBox(
                    height: heightApp * 0.03,
                  ),
                  // Expanded(
                  //   child: SingleChildScrollView(
                  //       child:
 if (GetStorage().read('TypeUser') == 'Customer')
                  Expanded(
                      child: TabBarView(
                    children: [
                      
                      ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: heightApp * 0.02,
                          );
                        },
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: orderSaveFoodList.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              orderDetailsSaveFoodController.status =
                                  orderSaveFoodList[i].statusOrder.toString();
                              Get.toNamed('/OrderDetailsSaveFoodView');
                              orderDetailsSaveFoodController.update();
                            },
                            child: ClipPath(
                              clipper: ShapeBorderClipper(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Container(
                                height: 144,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                    right: BorderSide(
                                        width: 10.0,
                                        color: orderSaveFoodList[i].status),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              "رقم الطلب",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily:
                                                      'din-next-lt-arabic Light'),
                                            ),
                                            SizedBox(
                                              width: widthApp * 0.01,
                                            ),
                                            Text(
                                              orderSaveFoodList[i]
                                                  .order
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily:
                                                      'din-next-lt-arabic Light'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          orderSaveFoodList[i]
                                              .DateAndTime
                                              .toString(),
                                          style: const TextStyle(
                                              color: Color(0XFFACABAB),
                                              fontSize: 14,
                                              fontFamily:
                                                  'din-next-lt-arabic Light'),
                                        ),
                                        GestureDetector(
                                            onTap: () {},
                                            child: SvgPicture.asset(
                                                'assets/images/arrow_order.svg'))
                                      ],
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.01,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 29,
                                      width: 86,
                                      decoration: BoxDecoration(
                                          color: orderSaveFoodList[i]
                                              .status
                                              .withOpacity(.10),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          orderSaveFoodList[i]
                                              .statusOrder
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color:
                                                  orderSaveFoodList[i].status,
                                              fontSize: 14,
                                              fontFamily:
                                                  'din-next-lt-arabic Light'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        // )),
                      ),
                      ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: heightApp * 0.02,
                          );
                        },
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: orderRequestBenfitList.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              orderDetailsBenfitController.status =
                                  orderRequestBenfitList[i]
                                      .statusOrder
                                      .toString();
                              Get.toNamed('/OrderDetailsBenfitView');
                              orderDetailsBenfitController.update();
                            },
                            child: ClipPath(
                              clipper: ShapeBorderClipper(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Container(
                                height: 144,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                    right: BorderSide(
                                        width: 10.0,
                                        color:
                                            orderRequestBenfitList[i].status),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              "رقم الطلب",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily:
                                                      'din-next-lt-arabic Light'),
                                            ),
                                            SizedBox(
                                              width: widthApp * 0.01,
                                            ),
                                            Text(
                                              orderRequestBenfitList[i]
                                                  .order
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily:
                                                      'din-next-lt-arabic Light'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          orderRequestBenfitList[i]
                                              .DateAndTime
                                              .toString(),
                                          style: const TextStyle(
                                              color: Color(0XFFACABAB),
                                              fontSize: 14,
                                              fontFamily:
                                                  'din-next-lt-arabic Light'),
                                        ),
                                        GestureDetector(
                                            onTap: () {},
                                            child: SvgPicture.asset(
                                                'assets/images/arrow_order.svg'))
                                      ],
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.01,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 29,
                                      width: 86,
                                      decoration: BoxDecoration(
                                          color: orderRequestBenfitList[i]
                                              .status
                                              .withOpacity(.10),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          orderRequestBenfitList[i]
                                              .statusOrder
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: orderRequestBenfitList[i]
                                                  .status,
                                              fontSize: 14,
                                              fontFamily:
                                                  'din-next-lt-arabic Light'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        // )),
                      ),
                      
                    ],
                  ))
                  else if (GetStorage().read('TypeUser') == 'Business')
                   Expanded(
                      child: TabBarView(
                    children: [
                      
                      ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: heightApp * 0.02,
                          );
                        },
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: orderSaveFoodList.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              orderDetailsBusinessController.status =
                                  orderSaveFoodList[i].statusOrder.toString();
                              Get.toNamed('/OrderDetailsSaveFoodBuseinessView');
                              orderDetailsBusinessController.update();
                            },
                            child: ClipPath(
                              clipper: ShapeBorderClipper(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Container(
                                height: 144,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                    right: BorderSide(
                                        width: 10.0,
                                        color: orderSaveFoodList[i].status),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              "رقم الطلب",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily:
                                                      'din-next-lt-arabic Light'),
                                            ),
                                            SizedBox(
                                              width: widthApp * 0.01,
                                            ),
                                            Text(
                                              orderSaveFoodList[i]
                                                  .order
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily:
                                                      'din-next-lt-arabic Light'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          orderSaveFoodList[i]
                                              .DateAndTime
                                              .toString(),
                                          style: const TextStyle(
                                              color: Color(0XFFACABAB),
                                              fontSize: 14,
                                              fontFamily:
                                                  'din-next-lt-arabic Light'),
                                        ),
                                        GestureDetector(
                                            onTap: () {},
                                            child: SvgPicture.asset(
                                                'assets/images/arrow_order.svg'))
                                      ],
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.01,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 29,
                                      width: 86,
                                      decoration: BoxDecoration(
                                          color: orderSaveFoodList[i]
                                              .status
                                              .withOpacity(.10),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          orderSaveFoodList[i]
                                              .statusOrder
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color:
                                                  orderSaveFoodList[i].status,
                                              fontSize: 14,
                                              fontFamily:
                                                  'din-next-lt-arabic Light'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        // )),
                      ),
                      ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: heightApp * 0.02,
                          );
                        },
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: orderRequestBenfitList.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              orderDetailsBusinessController.status =
                                  orderRequestBenfitList[i]
                                      .statusOrder
                                      .toString();
                              Get.toNamed('/OrderDetailsSaveFoodBuseinessView');
                              orderDetailsBusinessController.update();
                            },
                            child: ClipPath(
                              clipper: ShapeBorderClipper(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Container(
                                height: 144,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                    right: BorderSide(
                                        width: 10.0,
                                        color:
                                            orderRequestBenfitList[i].status),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              "رقم الطلب",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily:
                                                      'din-next-lt-arabic Light'),
                                            ),
                                            SizedBox(
                                              width: widthApp * 0.01,
                                            ),
                                            Text(
                                              orderRequestBenfitList[i]
                                                  .order
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily:
                                                      'din-next-lt-arabic Light'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          orderRequestBenfitList[i]
                                              .DateAndTime
                                              .toString(),
                                          style: const TextStyle(
                                              color: Color(0XFFACABAB),
                                              fontSize: 14,
                                              fontFamily:
                                                  'din-next-lt-arabic Light'),
                                        ),
                                        GestureDetector(
                                            onTap: () {},
                                            child: SvgPicture.asset(
                                                'assets/images/arrow_order.svg'))
                                      ],
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.01,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 29,
                                      width: 86,
                                      decoration: BoxDecoration(
                                          color: orderRequestBenfitList[i]
                                              .status
                                              .withOpacity(.10),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          orderRequestBenfitList[i]
                                              .statusOrder
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: orderRequestBenfitList[i]
                                                  .status,
                                              fontSize: 14,
                                              fontFamily:
                                                  'din-next-lt-arabic Light'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        // )),
                      ),
                      
                    ],
                  ))  ]),
        ),
      ),
    );
  }
}

class OrderSaveFoodModel {
  final String? order;
  final String? DateAndTime;
  final Color status;
  final String? statusOrder;
  OrderSaveFoodModel(
      {this.order, this.DateAndTime, required this.status, this.statusOrder}) {}
}

class OrderRequestBenfitModel {
  final String? order;
  final String? DateAndTime;
  final Color status;
  final String? statusOrder;
  OrderRequestBenfitModel(
      {this.order, this.DateAndTime, required this.status, this.statusOrder}) {}
}
