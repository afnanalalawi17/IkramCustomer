import 'package:ekram_customer/shared/style/Text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class MainButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final Function()? press;
  const MainButton({
    Key? key,
    required this.text,
    required this.press,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: color),
        child: Center(
          child: Text(
            text!.tr,
            style: kWhite_text,
          ),
        ),
      ),
    );
  }
}
class MainButton1 extends StatelessWidget {
  final String? text;
  final Color? color;
  final Function() press;
  const MainButton1({
    Key? key,
    required this.text,
    required this.press,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: color),
        child: Center(
          child: Text(
            text!.tr,
            style: kWhite_text,
          ),
        ),
      ),
    );
  }
}