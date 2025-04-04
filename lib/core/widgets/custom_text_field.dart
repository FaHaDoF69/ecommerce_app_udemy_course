import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final double? width;
  final bool? isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? defaultValue;
  const CustomTextField(
      {super.key,
      this.hintText,
      this.suffixIcon,
      this.width,
      this.isPassword,
      this.controller,
      this.validator,
      this.defaultValue});

  @override
  Widget build(BuildContext context) {
    // Set default value if controller and defaultValue are provided
    if (controller != null &&
        defaultValue != null &&
        controller!.text.isEmpty) {
      controller!.text = defaultValue!;
    }

    return SizedBox(
        width: width ?? 331.w,
        child: TextFormField(
            controller: controller,
            validator: validator,
            autofocus: false,
            obscureText: isPassword ?? false,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              hintText: hintText ?? "",
              hintStyle: TextStyle(
                  fontSize: 15.sp,
                  color: const Color(0xff8391A1),
                  fontWeight: FontWeight.w500),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: Color(0xffE8ECF4), width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide:
                      BorderSide(color: AppColors.primaryColor, width: 1)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: Colors.red, width: 1)),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),
              filled: true,
              fillColor: const Color(0xffF7F8F9),
              suffixIcon: suffixIcon,
            )));
  }
}
