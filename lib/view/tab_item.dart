import 'package:flutter/material.dart';

class TabItem {
  TabItem({
    this.stateMachine = "",
    this.artboard = "",
    // this.status,
  });

  UniqueKey? id = UniqueKey();
  String stateMachine;
  String artboard;
  // late SMIBool? status;

  static List<TabItem> tabItemsList = [
    TabItem(
        stateMachine: "assets/images/home_bottom_nav_bar_ac.svg",
        artboard: "BELL"),
    // TabItem(stateMachine: "assets/images/profile_bottom_nav_bar_un.svg", artboard: "CHAT"),
    TabItem(
        stateMachine: "assets/images/calendar_bottom_nav_bar.svg",
        artboard: "USER"),
   TabItem(
        stateMachine: "assets/images/user_bottom_new.svg",
        artboard: "TIMER"),
    // TabItem(stateMachine: "assets/images/home_bottom_nav_bar_un.svg", artboard: "TIMER"),

    // TabItem(stateMachine: "assets/images/calendar_bottom_nav_bar_un.svg", artboard: "USER"),
  ];
}
