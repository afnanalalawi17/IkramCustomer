import 'package:ekram_customer/shared/widget/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoxTextFieldPayment extends StatelessWidget {
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

  const BoxTextFieldPayment({
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
        TextFormField(
            cursorColor: Color(0XFFCCA750),
              style:  TextStyle(
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
           suffixText: "'ر.س'",
        suffixStyle: TextStyle(
                            color: Color(0xffD2D2D2),
                            fontSize: 15,
                            fontFamily: 'din-next-lt-arabic light'),
                labelText: itext,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0XFFDBDADA), width: 1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0XFFDBDADA), width: 1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0XFFDBDADA), width: 1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'مبلغ آخر',
                errorText: errorText,
                hintStyle: TextStyle(
                            color: Color(0xffD2D2D2),
                            fontSize: 15,
                            fontFamily: 'din-next-lt-arabic light'),
                contentPadding: EdgeInsets.all(20),
             
              ),
              validator: validator)
        ;
      
  }
}
