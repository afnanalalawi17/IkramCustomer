import 'package:ekram_customer/controller/bottomNavBar_controllers.dart';
import 'package:ekram_customer/shared/widget/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChatView extends StatelessWidget {
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
          
              Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 12),
            child: SvgPicture.asset("assets/images/arrow_back.svg"),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 12),
            child: SvgPicture.asset(
              "assets/images/call.svg",
              width: 40,
            ),
          )
        ],
        title: const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            'الدردشة',
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
        // padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: heightApp * 0.04,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    top: 10, bottom: 10, right: 10, left: 20),
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(.15),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                    )),
                                child: Text("السلام عليكم ورحمة الله وبركاته "),
                              ),
                              Text(
                                "23:00 PM",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          );
                        }),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    top: 10, bottom: 10, right: 10, left: 20),
                                decoration: BoxDecoration(
                                    color: Color(0xffCCA750),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    )),
                                child:
                                    Text("وعليكم السلام ورحمة الله وبركاته "),
                              ),
                              Text(
                                "23:00 PM",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          );
                        }),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              height: 120,
              decoration: BoxDecoration(
                  color: const Color(0xff07706D),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  )),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Center(
                          child:
                              SvgPicture.asset('assets/images/microphone.svg')),
                               SizedBox(
                        width: widthApp * 0.02,
                      ),   Center(
                          child:
                              SvgPicture.asset('assets/images/cam.svg')),
                      SizedBox(
                        width: widthApp * 0.03,
                      ),
                      Expanded(
                        child: TextField(
                            decoration: InputDecoration(
                                hintText: 'رسالتك',
                                contentPadding: const EdgeInsets.all(10.0),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffE8E6EA), width: 1),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffE8E6EA), width: 1),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                suffixIcon: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Color(0xff828282),
                                  size: 24.0,
                                  textDirection: TextDirection.ltr,
                                ),
                                hintStyle: TextStyle(
                                    color: Color(
                                      0xff828282,
                                    ),
                                    fontSize: 14)),
                            textAlign: TextAlign.start,
                            onChanged: (string) {}),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
