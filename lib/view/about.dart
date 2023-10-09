import 'package:ekram_customer/controller/bottomNavBar_controllers.dart';
import 'package:ekram_customer/shared/widget/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AboutView extends StatelessWidget {
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
             controller.selectedTab = 2;
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
            "عن إكرام",
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
          children: [ SizedBox(
                    height: heightApp * 0.02,
                  ),
            Expanded(
                      child: SingleChildScrollView(
                          child: Container(
              height: 240,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xffEEEEEE))),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(children: [
                  SizedBox(
                    height: heightApp * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                       Get.toNamed('/AboutMeView');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/images/about.svg"),
                            SizedBox(
                              width: widthApp * 0.01,
                            ),
                            Text(
                              "من نحن",
                              style: TextStyle(
                                  color: Color(0xff504E49),
                                  fontSize: 15,
                                  fontFamily: 'din-next-lt-arabic light'),
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
                       
                       Get.toNamed('/TermsAndConditionsView');
                
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/images/privacy.svg"),
                            SizedBox(
                              width: widthApp * 0.01,
                            ),
                            Text(
                             "الشروط والأحكام",
                              style: TextStyle(
                                  color: Color(0xff504E49),
                                  fontSize: 15,
                                  fontFamily: 'din-next-lt-arabic light'),
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
                       Get.toNamed('/PrivacyPolicyView');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/images/lock.svg"),
                            SizedBox(
                              width: widthApp * 0.01,
                            ),
                            Text(
                              
                              "سياسة الخصوصية",
                              style: TextStyle(
                                  color: Color(0xff504E49),
                                  fontSize: 15,
                                  fontFamily: 'din-next-lt-arabic light'),
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
                      Get.toNamed('/RefundPolicyView');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/images/pay.svg"),
                            SizedBox(
                              width: widthApp * 0.01,
                            ),
                            Text(
                              "سياسة استرداد الأموال",
                              style: TextStyle(
                                  color: Color(0xff504E49),
                                  fontSize: 15,
                                  fontFamily: 'din-next-lt-arabic light'),
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
                 
                  SizedBox(
                    height: heightApp * 0.01,
                  ),
                ]),
              ),
            ),
      )),
          ],
        )),
    );
  }
}
