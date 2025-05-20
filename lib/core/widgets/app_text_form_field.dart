import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';


class AppTextFormField extends StatelessWidget {
  final EdgeInsets? contentPadding;
  final OutlineInputBorder? focusedBorder;
  final OutlineInputBorder? enabledBorder;
  final String hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final TextInputType? textInputType;
  final TextStyle? textStyle;
  final Color? fillColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  AppTextFormField({
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    required this.hintText,
    this.hintStyle,
    this.textStyle,
    this.isObscureText,
    this.textInputType,
    this.suffixIcon,
    this.fillColor,
    required this.controller,
    required this.validator,
  });


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:  controller,
      keyboardType: textInputType ?? TextInputType.name,
      decoration: InputDecoration(
          isDense: true, // this made default padding to the formfield
          contentPadding: contentPadding ?? EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 18.h,
          ),
          focusedBorder: focusedBorder ?? OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.3,
                  color: ColorsManager.customTeal
              ),
              borderRadius: BorderRadius.circular(8.0)
          ),
          enabledBorder: enabledBorder ?? OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.3,
                  color: ColorsManager.customGrey
              ),
              borderRadius: BorderRadius.circular(8.0)
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.3,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.3,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          hintStyle: hintStyle ?? TextStyle(fontSize: 14,color: ColorsManager.customGrey),
          hintText: hintText,
          suffixIcon: suffixIcon,
          fillColor: fillColor ?? ColorsManager.customWhite,
          filled: true
      ),
      obscureText: isObscureText ?? false,
      style: textStyle ?? TextStyle(fontSize: 14,color: Colors.black) ,
      validator: (value){
        return validator(value);
      },

    );
  }
}

