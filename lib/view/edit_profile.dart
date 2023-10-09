import 'package:ekram_customer/controller/bottomNavBar_controllers.dart';
import 'package:ekram_customer/database/Login_Stat_Controller.dart';
import 'package:ekram_customer/shared/widget/box_Text_Field_Basic.dart';
import 'package:ekram_customer/shared/widget/constants.dart';
import 'package:ekram_customer/shared/widget/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditProfileView extends StatelessWidget {
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
            "البيانات الشخصية",
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
                height: heightApp * 0.04,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    height: 230,
                    width: 368,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: const Color(0xffEEEEEE))),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                      child: Column(children: [
                        BoxTextFieldBasic(
                            asset: 'assets/images/user.svg', text: 'الاسم'),
                        BoxTextFieldBasic(
                            hintText: 'ادخل بريدك الإلكتروني',
                            textOptional: '(اختياري)',
                            asset: 'assets/images/hotmail.svg',
                            text: 'البريد الإلكتروني'),
                      ]),
                    ),
                  ),
                ),
              ),
            ],
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: MainButton(
            color: const Color(0XFFCCA750),
            text: 'متابعة',
            press: () { loginStat.changeLoginState('Login');
              if(controller.selectedTab == 2){
                   Get.offAndToNamed('/CustomTabBar');
              }
             else{
                 Navigator.pop(context);
              Navigator.pop(context);
             }
           
            },
          ),
        ),
      ),
    );
  }
}
