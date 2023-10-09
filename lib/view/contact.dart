import 'dart:io';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:ekram_customer/controller/bottomNavBar_controllers.dart';
import 'package:ekram_customer/controller/contact_controller.dart';
import 'package:ekram_customer/database/Login_Stat_Controller.dart';
import 'package:ekram_customer/shared/widget/constants.dart';
import 'package:ekram_customer/shared/widget/maps_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactView extends StatelessWidget {
  final controller = Get.put(BottomNavBarController());
  final loginStat = Get.put(LoginStateController());
  final contactController = Get.put(ContactController());
  var number = '+966566220639'; //set the number here
  double latitude = 21.482530283172125;
  double longitude = 39.946803069316644;
  String title = 'جمعية إكرام لحفظ الطعام بمكة';
  int zoom = 18;

  @override
  Widget build(BuildContext context) {
    var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff07706D),
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 60,
        leading: GestureDetector(
          onTap: () {
            loginStat.loginState == 'Login';
            controller.selectedTab = 2;
            Get.toNamed('/CustomTabBar');
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
            "تواصل معنا",
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
              SizedBox(
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
                          showAdaptiveActionSheet(
                            context: context,

                            androidBorderRadius: 30,
                            actions: <BottomSheetAction>[
                              BottomSheetAction(
                                  title: Text(number),
                                  onPressed: (context) async {
                                    await FlutterPhoneDirectCaller.callNumber(
                                        number);
                                  }),
                            ],
                            cancelAction: CancelAction(
                                title: const Text(
                                    'إلغاء')), // onPressed parameter is optional by default will dismiss the ActionSheet
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                    "assets/images/phone-call.svg"),
                                SizedBox(
                                  width: widthApp * 0.01,
                                ),
                                Text(
                                  "الرقم الموحد",
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
                        onTap: () async {
                          var whatsapp = "+966566220639";
                          var whatsappURl_android = "whatsapp://send?phone=" +
                              whatsapp +
                              "&text=hello";
                          var whatappURL_ios =
                              "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
                          try {
                            if (Platform.isIOS) {
                              await launchUrl(Uri.parse(whatappURL_ios));
                            } else {
                              await launchUrl(Uri.parse(whatsappURl_android));
                            }
                          } on Exception {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Color(0XFFCCA750),
                                content: Text(
                                  "الواتساب غير مثبت",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'din-next-lt-arabic Medium'),
                                )));
                          }
                          // if (Platform.isIOS) {
                          //   // for iOS phone only
                          //   if (await canLaunch(whatappURL_ios)) {
                          //     await launch(whatappURL_ios,
                          //         forceSafariVC: false);
                          //   } else if(Platform.isAndroid){
                          //      await launchUrl(Uri.parse(whatsappURl_android));

                          //   }else{

                          //     ScaffoldMessenger.of(context)
                          //         .showSnackBar(SnackBar(
                          //             backgroundColor: Color(0XFFCCA750),
                          //             content: Text(
                          //               "الواتساب غير مثبت",
                          //               style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontSize: 14,
                          //                   fontFamily:
                          //                       'din-next-lt-arabic Medium'),
                          //             )));
                          //   }
                          // } else {
                          //   // android , web
                          //   if (await canLaunch(whatsappURl_android)) {
                          //     await launch(whatsappURl_android);
                          //   } else {
                          //    ScaffoldMessenger.of(context)
                          //         .showSnackBar(SnackBar(
                          //             backgroundColor: Color(0XFFCCA750),
                          //             content: Text(
                          //               "الواتساب غير مثبت",
                          //               style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontSize: 14,
                          //                   fontFamily:
                          //                       'din-next-lt-arabic Medium'),
                          // )));
                          // }
                          // }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assets/images/chat.svg"),
                                SizedBox(
                                  width: widthApp * 0.01,
                                ),
                                Text(
                                  "واتساب",
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
                        onTap: () async {
                          String title = '';
                          String message = '';
                          Uri email = Uri(
                            scheme: 'mailto',
                            path: 'afalalawi@hotmail.com',
                            query: 'subject=$title&body=$message',
                          );
                          // String subject = Uri.encodeComponent("Hello Flutter");
                          // String body =
                          //     Uri.encodeComponent("Hi! I'm Flutter Developer");
                          // print(subject); //output: Hello%20Flutter
                          // Uri mail = Uri.parse(
                          //     "mailto:$email?subject=$subject&body=$body");

                          try {
                            await launchUrl(email);
                          } catch (e) {
                            print(e.toString());
                          }
                          // if (await launchUrl(email)) {
                          //   //email app opened
                          //   launchUrl(email);
                          // } else {
                          //   //email app is not opened
                          //   throw Exception('could not launch $email');
                          // }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assets/images/hotmail.svg"),
                                SizedBox(
                                  width: widthApp * 0.01,
                                ),
                                Text(
                                  "البريد الإلكتروني",
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
                        onTap: () async {
                      
                            await MapsSheet.show(
                              context: context,
                              onMapTap: (map) {
                                map.showMarker(
                                  coords: Coords(latitude, longitude),
                                  title: title,
                                  zoom: zoom,
                                );
                              },
                            );
                  
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assets/images/location.svg"),
                                SizedBox(
                                  width: widthApp * 0.01,
                                ),
                                Text(
                                  "عنوان الجمعية",
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
