import 'package:ekram_customer/controller/customer_controllers.dart';
import 'package:ekram_customer/shared/widget/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AboutMeView extends StatelessWidget {
 
  final customerController = Get.put(CustomerController());

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
               Get.toNamed('/AboutView');
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 12),
            child: SvgPicture.asset("assets/images/arrow_back.svg"),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            "من نحن",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'din-next-lt-arabic Light'),
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xff07706D),
      ),
      body: GetBuilder<CustomerController>(
          init: CustomerController(),
          initState: (_) {},
          builder: (_) {
            return Container(
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(children: [
                          ClipPath(
                              clipper: ShapeBorderClipper(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              child: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                    right: BorderSide(
                                        width: 5.0, color: Color(0XFFCCA750)),
                                  ),
                                ),
                                child: ExpansionTile(
                                  onExpansionChanged: (bool expanded) {
                                    customerController.isExpanded = expanded;
                                    customerController.update();
                                  },
                                  trailing: customerController.isExpanded
                                      ? SvgPicture.asset(
                                          'assets/images/arrow_down.svg')
                                      : SvgPicture.asset(
                                          'assets/images/arrow_top.svg'),
                                  iconColor: Color(0XFFCCA750),
                                  collapsedIconColor: Color(0xff504E49),
                                  textColor: Color(0XFFCCA750),
                                  collapsedTextColor: Color(0xff504E49),
                                  title: Text(
                                    'مؤسسة حفظ النعمة',
                                    style: TextStyle(
                                        // color: Color(0xff504E49),
                                        fontSize: 15.0,
                                        fontFamily: 'din-next-lt-arabic Light'),
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Divider(
                                        thickness: 1,
                                        color: Color(0xffE4E4E4),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Color(0XFFB0B0B0)
                                                .withOpacity(.2),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'مؤسسة حفظ النعمة',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontFamily:
                                                    'din-next-lt-arabic Light'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                              
                              SizedBox(height: heightApp*0.02,),
                               ClipPath(
                              clipper: ShapeBorderClipper(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              child: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                    right: BorderSide(
                                        width: 5.0, color: Color(0XFFCCA750)),
                                  ),
                                ),
                                child: ExpansionTile(
                                  onExpansionChanged: (bool expanded) {
                                    customerController.isExpanded1 = expanded;
                                    customerController.update();
                                  },
                                  trailing: customerController.isExpanded1
                                      ? SvgPicture.asset(
                                          'assets/images/arrow_down.svg')
                                      : SvgPicture.asset(
                                          'assets/images/arrow_top.svg'),
                                  iconColor: Color(0XFFCCA750),
                                  collapsedIconColor: Color(0xff504E49),
                                  textColor: Color(0XFFCCA750),
                                  collapsedTextColor: Color(0xff504E49),
                                  title: Text(
                                    'جمعية إكرام لحفظ الطعام',
                                    style: TextStyle(
                                        // color: Color(0xff504E49),
                                        fontSize: 15.0,
                                        fontFamily: 'din-next-lt-arabic Light'),
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Divider(
                                        thickness: 1,
                                        color: Color(0xffE4E4E4),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Color(0XFFB0B0B0)
                                                .withOpacity(.2),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'جمعية إكرام لحفظ الطعام',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontFamily:
                                                    'din-next-lt-arabic Light'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                        ]),
                      ),
                    )),
                  ],
                ));
          }),
    );
  }
}
