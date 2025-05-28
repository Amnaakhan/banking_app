import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../app/config/app_colors.dart';

class InputTextField extends StatelessWidget {

  final TextEditingController myController;
  final FocusNode focusNode;
  final FormFieldSetter onFieldSubmittedValue;
  final FormFieldValidator onValidator;
  final Widget? suffixIcon;
  final Image? prefixIcon;
  final VoidCallback? onSuffixIconPress;
  final Function(String)? onChanged;
  final TextInputType keyBoardType;
  final String hint;
  final Widget? error;
  final bool obscureText;
  final bool enable, autoFocus;

  const InputTextField({
    super.key,
    required this.myController,
    required this.focusNode,
    required this.onFieldSubmittedValue,
    required this.keyBoardType,
    required this.obscureText,

    this.suffixIcon,
    this.onSuffixIconPress,
    this.onChanged,
    required this.hint,
    this.error,
    this.enable = true,
    required this.onValidator,
    this.autoFocus = false, this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: double.infinity,
      child: TextFormField(
        controller: myController,
        focusNode: focusNode,
        obscureText: obscureText,
        onFieldSubmitted: onFieldSubmittedValue,
        validator: onValidator,
        keyboardType: keyBoardType,
        enabled: enable,
        onChanged: onChanged,
        cursorColor: Colors.black,
        style: TextStyle(),
        decoration: InputDecoration(
            error: error,
            errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 11, fontWeight: FontWeight.w300, height: 0),
            hintText: hint,
            contentPadding: const EdgeInsets.all(20),
            hintStyle: TextStyle(color: Colors.black,fontSize: 10.sp,fontFamily:'Montserrat' ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffD9D9D9)),

              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffD9D9D9)),

              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffD9D9D9)),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color:Color(0xffD9D9D9)),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),

            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon != null
                ? GestureDetector(onTap: onSuffixIconPress,child: suffixIcon)
                : null

        ),
      ),
    );
  }
}