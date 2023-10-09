import 'package:ekram_customer/shared/widget/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoxTextFieldBasic extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obsecure;
  final bool readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final String text;
  final String? itext;
  final bool autofocus;
  final bool enabled;
  final String? errorText;
  final String? hintText;
  final Color? hintColor;
  final Color? fillColor;
  final IconData? icon;
  final Function(String)? onSaved;
  final IconData? prefix;
  final TextAlign textAlign;
  final String? asset;
  final String textOptional;
  const BoxTextFieldBasic({
    Key? key,
    this.controller,
    this.validator,
    this.obsecure = false,
    this.readOnly = false,
    this.onTap,
    this.onEditingCompleted,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.autofocus = false,
    this.enabled = true,
    this.errorText,
    this.hintText,
    this.hintColor,
    this.fillColor,
    this.onSaved,
    required this.text,
    this.prefix,
    this.icon,
    this.itext,
    this.textAlign = TextAlign.start,
    required this.asset, 
    this.textOptional = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(

                children: [
                    SvgPicture.asset(asset!),
              SizedBox(
                width: widthApp * 0.01,
              ),
              Text(
                text,
                style: TextStyle(
                    color: Color(0XFFB58E40),
                    fontSize: 15,
                    fontFamily: 'din-next-lt-arabic light'),
              ), 
                ],
              ),

            Text(
                textOptional!,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'din-next-lt-arabic light'),
              ), 
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8,right: 8),
          child: TextFormField(
              cursorColor: Color(0XFFCCA750),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'din-next-lt-arabic light'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textAlign: TextAlign.right,
              onChanged: onChanged,
              onEditingComplete: onEditingCompleted,
              autofocus: autofocus,
              onTap: onTap,
              enabled: enabled,
              readOnly: readOnly,
              obscureText: obsecure,
              keyboardType: keyboardType,
              controller: controller,
              decoration: InputDecoration(
                  hintText: hintText,
                    hintStyle: TextStyle(
                          color: Color(0xffD2D2D2),
                          fontSize: 15,
                          fontFamily: 'din-next-lt-arabic light'),
                  contentPadding:
                      EdgeInsets.all(10), //  <- you can it to 0.0 for no space
                  isDense: true,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFEEEEEE))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red.shade400))
                  //border: InputBorder.none
                  ),
              validator: validator),
        ),
        SizedBox(
          height: heightApp * 0.03,
        )
      ],
    );
  }
}
