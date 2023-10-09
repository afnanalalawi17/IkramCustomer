import 'package:ekram_customer/controller/bottomNavBar_controllers.dart';
import 'package:ekram_customer/database/Login_Stat_Controller.dart';
import 'package:ekram_customer/shared/widget/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NotificationView extends StatelessWidget {
  List<Notification> notificationList = [
    Notification(
        order: '#3421674',
        time: 'منذ دقيقة',
        status: Color(0xffCCA750),
        statusOrder: 'أصبحت حالة الطلب (تم التسليم)'),
    Notification(
        order: '#3421674',
        time: 'منذ 2 د',
        status: Color(0xffB0B0B0),
        statusOrder: 'السائق وصل'),
         Notification(
        order: '#3421674',
        time: 'منذ 15 د',
        status: Color(0xffB0B0B0),
        statusOrder: 'السائق في الطريق إليك'), Notification(
        order: '#3421674',
        time: 'منذ 20 د',
        status: Color(0xffB0B0B0),
        statusOrder: 'أصبحت حالة الطلب (تحت الإجراء)'),
  ];
    final controller = Get.put(BottomNavBarController());
  final loginStat = Get.put(LoginStateController());

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
              loginStat.loginState == 'Login';
              controller.selectedTab = 2;
                          Get.toNamed('/CustomTabBar');
                          controller.update();

            },
            child: Padding(
              padding: const EdgeInsets.only(right:20,bottom: 12),
              child: SvgPicture.asset("assets/images/arrow_back.svg"),
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              "الاشعارات",
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: <Widget>[
                    Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Color(0xffE4E4E4),
                    )),
                    Padding(
                      padding: const EdgeInsets.only(left: 7, right: 7),
                      child: Text(
                        "16 JUL 2023",
                        style: TextStyle(
                            color: Color(0xffE4E4E4),
                            fontSize: 16,
                            fontFamily: 'din-next-lt-arabic Medium'),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      color: Color(0xffE4E4E4),
                      thickness: 1,
                    )),
                  ]),
                ),
                Expanded(
                  child: SingleChildScrollView(
                      child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: heightApp * 0.02,
                      );
                    },
                    shrinkWrap: true,
                    itemCount: notificationList.length,
                    itemBuilder: (context, i) {
                      return ClipPath(
                        clipper: ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Container(
                          height: 93,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              right: BorderSide(
                                  width: 10.0,
                                  color: notificationList[i].status),
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
                                      Text(
                                        "الطلب",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily:
                                                'din-next-lt-arabic Light'),
                                      ),
                                      SizedBox(
                                        width: widthApp * 0.01,
                                      ),
                                      Text(
                                        notificationList[i].order.toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily:
                                                'din-next-lt-arabic Light'),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    notificationList[i].time.toString(),
                                    style: TextStyle(
                                        color: Color(0XFFACABAB),
                                        fontSize: 10,
                                        fontFamily: 'din-next-lt-arabic Light'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: heightApp * 0.01,
                              ),
                              Text(
                                notificationList[i].statusOrder.toString(),
                                style: TextStyle(
                                    color: Color(0XFFACABAB),
                                    fontSize: 14,
                                    fontFamily: 'din-next-lt-arabic Light'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
                ),
              ],
            )));
  }
}

class Notification {
  final String? order;
  final String? time;
  final Color status;
  final String? statusOrder;
  Notification(
      {this.order, this.time, required this.status, this.statusOrder}) {}
}
