import 'package:ekram_customer/controller/bottomNavBar_controllers.dart';
import 'package:ekram_customer/view/home.dart';
import 'package:ekram_customer/view/notification.dart';
import 'package:ekram_customer/view/order.dart';
import 'package:ekram_customer/view/setting.dart';
import 'package:ekram_customer/view/tab_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomTabBar extends StatelessWidget {
  final controller = Get.put(BottomNavBarController());

  

  @override
  Widget build(BuildContext context) { var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return GetBuilder<BottomNavBarController>(
            init: BottomNavBarController(),
            initState: (_) {},
            builder: (_) {
              return
      
    
    
    Scaffold(
    extendBody: true, 
        backgroundColor: Color(0xffFFFFFF),
                body: IndexedStack(
                  index: controller.selectedTab,
                   children: [
                  HomeView(),
                  OrderView(),
                  SettingView()
                ]),
      bottomNavigationBar:  Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
           boxShadow: [
              
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 10,
                )
              ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(controller.icons.length, (index) {
            TabItem icon =controller.icons[index];

            return Expanded(
              key: icon.id,
              child: CupertinoButton(
                padding: const EdgeInsets.all(12),
                child: AnimatedOpacity(
                  opacity: controller.selectedTab == index ? 1 : 0.5,
                  duration: const Duration(milliseconds: 200),
                  child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: -18,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: 4,
                            width: controller.selectedTab == index ? 20 : 0,
                            decoration: BoxDecoration(
                              color:  Color(0XFFCCA750),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: SvgPicture.asset(
                            
                            // app_assets.iconsRiv,
                          icon.stateMachine.toString(),
                            // artboard: icon.artboard,
                            // onInit: (artboard) {
                            //   _onRiveIconInit(artboard, index);
                            // },
                          ),
                        )
                      ]),
                ),
                onPressed: () {
                 controller. onTabPress(index);
                },
              ),
            );
          }),
        ),
      ),
    );
   } ); }
}
    
//     GetBuilder<BottomNavBarController>(
//       builder: (controller) {
//         return 
// 
// WillPopScope(
//             onWillPop: () async => false,
//             child: Scaffold(
//                 backgroundColor: Color(0xffE5E5E5),
//                 body: IndexedStack(
//                   index: controller.tabIndex,
//                    children: [
//                   NotificationView(),
//                   NotificationView(),
//                   NotificationView()
//                 ]),
//                 bottomNavigationBar: Container(
//                   height: 80,
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                     ),
//                   ),
//                   child: BottomNavigationBar(
//                     onTap: controller.changeTabIndex,
//                     currentIndex: controller.tabIndex,
//                     unselectedItemColor: Colors.grey,
//                     backgroundColor: Colors.white,
//                     type: BottomNavigationBarType.fixed,
//                     selectedItemColor: Theme.of(context).primaryColor,
//                     iconSize: 18,
//                     elevation: 20,
//                     showSelectedLabels: true,
//                     showUnselectedLabels: true,
//                     items: [
//                       BottomNavigationBarItem(
//                         label: 'Activities',
//                         icon: Container(
//                           margin: const EdgeInsets.only(bottom: 5),
//                           child: SvgPicture.asset(
//                               'assets/images/home_bottom_nav_bar_ac.svg',
//                               color: controller.tabIndex == 0
//                                   ? Theme.of(context).primaryColor
//                                   : Colors.black38),
//                         ),
//                       ),
//                       BottomNavigationBarItem(
//                         label: 'Invoices',
//                         icon: Container(
//                           margin: const EdgeInsets.only(bottom: 5),
//                           child: SvgPicture.asset(
//                               'assets/images/home_bottom_nav_bar_ac.svg',
//                               color: controller.tabIndex == 1
//                                   ? Theme.of(context).primaryColor
//                                   : Colors.black38),
//                         ),
//                       ),
//                       BottomNavigationBarItem(
//                         label: 'More'.tr,
//                         icon: Container(
//                           margin: const EdgeInsets.only(bottom: 5),
//                           child: SvgPicture.asset(
//                               'assets/images/home_bottom_nav_bar_ac.svg',
//                               color: controller.tabIndex == 2
//                                   ? Theme.of(context).primaryColor
//                                   : Colors.black38),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )));
//       },
//     );
//   }
// }

    
    
    
//     Scaffold(
//       bottomNavigationBar:  Container(
//         height: 80,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: List.generate(_icons.length, (index) {
//             TabItem icon = _icons[index];

//             return Expanded(
//               key: icon.id,
//               child: CupertinoButton(
//                 padding: const EdgeInsets.all(12),
//                 child: AnimatedOpacity(
//                   opacity: _selectedTab == index ? 1 : 0.5,
//                   duration: const Duration(milliseconds: 200),
//                   child: Stack(
//                       clipBehavior: Clip.none,
//                       alignment: Alignment.center,
//                       children: [
//                         Positioned(
//                           top: -18,
//                           child: AnimatedContainer(
//                             duration: const Duration(milliseconds: 200),
//                             height: 4,
//                             width: _selectedTab == index ? 20 : 0,
//                             decoration: BoxDecoration(
//                               color:  Color(0XFFCCA750),
//                               borderRadius: BorderRadius.circular(2),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 36,
//                           width: 36,
//                           child: SvgPicture.asset(
                            
//                             // app_assets.iconsRiv,
//                           icon.stateMachine.toString(),
//                             // artboard: icon.artboard,
//                             // onInit: (artboard) {
//                             //   _onRiveIconInit(artboard, index);
//                             // },
//                           ),
//                         )
//                       ]),
//                 ),
//                 onPressed: () {
//                   // onTabPress(index);
//                 },
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }