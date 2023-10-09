import 'package:ekram_customer/view/about.dart';
import 'package:ekram_customer/view/about_me.dart';
import 'package:ekram_customer/view/background.dart';
import 'package:ekram_customer/view/bottom_nav_bar.dart';
import 'package:ekram_customer/view/chat.dart';
import 'package:ekram_customer/view/common_questions.dart';
import 'package:ekram_customer/view/contact.dart';
import 'package:ekram_customer/view/edit_profile.dart';
import 'package:ekram_customer/view/getLocation.dart';
import 'package:ekram_customer/view/home.dart';
import 'package:ekram_customer/view/notification.dart';
import 'package:ekram_customer/view/order.dart';
import 'package:ekram_customer/view/order_details_benefit.dart';
import 'package:ekram_customer/view/order_details_save_food.dart';
import 'package:ekram_customer/view/order_details_save_food_business.dart';
import 'package:ekram_customer/view/payment.dart';
import 'package:ekram_customer/view/privacy_policy.dart';
import 'package:ekram_customer/view/profile.dart';
import 'package:ekram_customer/view/refund_policy.dart';
import 'package:ekram_customer/view/request_benefit.dart';
import 'package:ekram_customer/view/request_save_food.dart';
import 'package:ekram_customer/view/request_save_food_business.dart';
import 'package:ekram_customer/view/setting.dart';
import 'package:ekram_customer/view/terms_conditions.dart';
import 'package:ekram_customer/view/trackLocation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      theme: ThemeData(
          primaryColor: Color(0XFFCCA750),
          canvasColor: Colors.white,
          dividerColor: Colors.transparent),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        //  Locale('en'),

        Locale('ar')
      ],
      home: BackgroundView(),
      locale: const Locale('ar'),
      fallbackLocale: const Locale('ar'),
      getPages: [
        GetPage(name: '/AboutMeView', page: () => AboutMeView()),
        GetPage(name: '/AboutView', page: () => AboutView()),
        GetPage(name: '/CommonQuestionView', page: () => CommonQuestionView()),
        GetPage(name: '/ContactView', page: () => ContactView()),
        GetPage(name: '/EditProfileView', page: () => EditProfileView()),
        GetPage(name: '/NotificationView', page: () => NotificationView()),
        GetPage(name: '/HomeView', page: () => HomeView()),
        GetPage(
            name: '/OrderDetailsBenfitView',
            page: () => OrderDetailsBenfitView()),
        GetPage(
            name: '/OrderDetailsSaveFoodView',
            page: () => OrderDetailsSaveFoodView()),
        GetPage(name: '/OrderView', page: () => OrderView()),
        GetPage(name: '/SettingView', page: () => SettingView()),
        GetPage(name: '/PaymentView', page: () => PaymentView()),
        GetPage(name: '/PrivacyPolicyView', page: () => PrivacyPolicyView()),
        GetPage(name: '/ProfileView', page: () => ProfileView()),
        GetPage(name: '/RefundPolicyView', page: () => RefundPolicyView()),
        GetPage(
            name: '/RequestSaveFoodView', page: () => RequestSaveFoodView()),
        GetPage(name: '/RequestBenefitView', page: () => RequestBenefitView()),
        GetPage(
            name: '/TermsAndConditionsView',
            page: () => TermsAndConditionsView()),
        GetPage(name: '/CustomTabBar', page: () => CustomTabBar()),
        GetPage(
            name: '/RequestSaveFoodBusinessView',
            page: () => RequestSaveFoodBusinessView()),
        GetPage(
            name: '/OrderDetailsSaveFoodBuseinessView',
            page: () => OrderDetailsSaveFoodBuseinessView()),
                           GetPage(name: '/GetLocationView', page: () => GetLocationView()),
  GetPage(name: '/TrackLocationView', page: () => TrackLocationView()),
   GetPage(name: '/ChatView', page: () => ChatView()),
      ],
    ),
  );
}
