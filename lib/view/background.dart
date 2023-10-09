import 'package:ekram_customer/database/Login_Stat_Controller.dart';
import 'package:ekram_customer/shared/widget/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BackgroundView extends StatefulWidget {
  const BackgroundView({super.key});

  @override
  State<BackgroundView> createState() => _BackgroundViewState();
}

class _BackgroundViewState extends State<BackgroundView>
    with TickerProviderStateMixin {
  late AnimationController opacityController;
  late AnimationController transitionController;
  late AnimationController containerController;
  final loginStat = Get.put(LoginStateController());

  late Animation<double> opacityAnimation;
  late Animation<Offset> transitionAnimation;
  late Animation<double> containerAnimation;
  @override
  void initState() {
    opacityController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    transitionController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    containerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: opacityController,
      curve: Curves.easeInOut,
    ));

    transitionAnimation = Tween<Offset>(
      begin: const Offset(2.2, 0.0),
      end: const Offset(3.0, 0.0),
    ).animate(CurvedAnimation(
      parent: transitionController,
      curve: Curves.easeInOut,
    ));
    containerAnimation =
        Tween<double>(begin: 0.0, end: 160.0).animate(CurvedAnimation(
      parent: containerController,
      curve: Curves.easeInOut,
    ));
    opacityController.forward();
    transitionController.forward();
    containerController.forward();

    containerController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 20));
        Get.offAndToNamed('/CustomTabBar');
        setState(() {
          GetStorage().remove('TypeUser');
          // loginStat.changeLoginState('Login');
// Customer
// Business
          GetStorage().remove('Name');
          GetStorage().remove('Phone');
          // GetStorage().write('TypeUser', 'Customer');
          // print(GetStorage().read('TypeUser').toString());
          loginStat.changeLoginState('notLogin');
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) { 
    var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover)),
        child: MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 60),
                  child: Row(
                    children: [
                      SlideTransition(
                        position: transitionAnimation,
                        child: Image.asset('assets/images/ekram-white.png'),
                      ),
                      AnimatedBuilder(
                        animation: opacityAnimation,
                        builder: (context, child) => Opacity(
                            opacity: opacityAnimation.value,
                            child: Image.asset('assets/images/ekram.png')),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: heightApp * 0.01,
                ),
                Stack(
                  children: [
                    Container(
                      height: 5,
                      width: 160,
                      color: Colors.white24,
                    ),
                    AnimatedBuilder(
                      animation: containerAnimation,
                      builder: (context, child) => Container(
                          height: 5,
                          width: containerAnimation.value,
                          color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
