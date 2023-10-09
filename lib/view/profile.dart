import 'package:ekram_customer/controller/bottomNavBar_controllers.dart';
import 'package:ekram_customer/database/Login_Stat_Controller.dart';
import 'package:ekram_customer/shared/widget/box_Text_Field_Basic.dart';
import 'package:ekram_customer/shared/widget/constants.dart';
import 'package:ekram_customer/shared/widget/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileView extends StatelessWidget {
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
            "حسابي",
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
              if (GetStorage().read('TypeUser') == 'Customer')
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      height: 312,
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
                              asset: 'assets/images/phone-call.svg',
                              text: 'رقم الجوال'),
                          BoxTextFieldBasic(
                              asset: 'assets/images/hotmail.svg',
                              text: 'البريد الإلكتروني'),
                        ]),
                      ),
                    ),
                  ),
                )
              else if (GetStorage().read('TypeUser').toString() == 'Business')
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      height: 400,
                      width: 368,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: const Color(0xffEEEEEE))),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset('assets/images/about.svg'),
                                  Text(
                                    'اسم المنشأة',
                                    style: TextStyle(
                                        color: Color(0XFFB58E40),
                                        fontSize: 15,
                                        fontFamily: 'din-next-lt-arabic light'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: heightApp * 0.01,
                              ),
                              Text(
                                'فنادق ومنتجعات هيلتون',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'din-next-lt-arabic light'),
                              ),
                              Divider(
                                thickness: 1,
                                color: Color(0xffE4E4E4),
                              ),
                              SizedBox(
                                height: heightApp * 0.02,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/location.svg'),
                                        Text(
                                          'عنوان المنشأة',
                                          style: TextStyle(
                                              color: Color(0XFFB58E40),
                                              fontSize: 15,
                                              fontFamily:
                                                  'din-next-lt-arabic light'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.01,
                                    ),
                                    Text(
                                      'مكة - جبل عمر - شارع إبراهيم الخليل',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily:
                                              'din-next-lt-arabic light'),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: Color(0xffE4E4E4),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: heightApp * 0.02,
                              ),
                               GestureDetector(
                                onTap: () {},
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset("assets/images/hotmail.svg"),
                                        Text(
                                          'البريد الإلكتروني',
                                          style: TextStyle(
                                              color: Color(0XFFB58E40),
                                              fontSize: 15,
                                              fontFamily:
                                                  'din-next-lt-arabic light'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.01,
                                    ),
                                    Text(
                                      'hotel@hilton.com',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily:
                                              'din-next-lt-arabic light'),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: Color(0xffE4E4E4),
                                    ),
                                  ],
                                ),
                              ),SizedBox(
                                height: heightApp * 0.02,
                              ),
                             
                               GestureDetector(
                                onTap: () {},
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset("assets/images/phone-call.svg"),
                                        Text(
                                         'رقم الجوال',
                                          style: TextStyle(
                                              color: Color(0XFFB58E40),
                                              fontSize: 15,
                                              fontFamily:
                                                  'din-next-lt-arabic light'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: heightApp * 0.01,
                                    ),
                                    Text(
                                      '+966-11-2346666',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily:
                                              'din-next-lt-arabic light'),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: Color(0xffE4E4E4),
                                    ),
                                  ],
                                ),
                              ),SizedBox(
                                height: heightApp * 0.02,
                              ),
                            ]),
                      ),
                    ),
                  ),
                )
            ],
          )),
          
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: 
      
    GetStorage().read('TypeUser') == 'Customer'
  ?   SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              MainButton(
                color: const Color(0XFFCCA750),
                text: 'تحديث',
                press: () {},
              ),
              SizedBox(
                height: heightApp * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          // title: Text("Success"),
                          content: Container(
                            height: 307,
                            width: 368,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: heightApp * 0.04,
                                ),
                                SvgPicture.asset('assets/images/alart.svg'),
                                SizedBox(
                                  height: heightApp * 0.02,
                                ),
                                Text(
                                  "هل أنت متأكد من أنك تريد حذف حسابك ؟",
                                  style: TextStyle(
                                      color: Color(0xff55585D),
                                      fontSize: 16,
                                      fontFamily: 'din-next-lt-arabic light'),
                                ),
                                SizedBox(
                                  height: heightApp * 0.04,
                                ),
                                Flexible(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                                 controller.selectedTab =
                                                            0;
                                                        Get.offAndToNamed(
                                                            '/CustomTabBar');
                                                            
                                                             loginStat.changeLoginState('notLogin');
                                                                    GetStorage().remove('TypeUser');
                                                        controller.update();
                                                     
                                            },
                                            child: Container(
                                              width: 154,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: Color(0XFFCCA750),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'حذف',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontFamily:
                                                          'din-next-lt-arabic light'),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: widthApp * 0.04,
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              width: 154,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: const Color(
                                                          0XFFCCA750),
                                                      width: 2)),
                                              child: const Center(
                                                child: Text(
                                                  'تراجع',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      border:
                          Border.all(color: const Color(0XFFBC2131), width: 2)),
                  child: const Center(
                    child: Text(
                      'حذف الحساب',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFFBC2131),
                          fontFamily: 'din-next-lt-arabic light'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ):Container()
    );
  }
}
