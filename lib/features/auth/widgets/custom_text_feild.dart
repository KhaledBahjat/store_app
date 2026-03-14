import 'package:flutter/material.dart';
import 'package:store_app/core/theme/app_colors.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({
    super.key,
    required this.labelText,
    this.suffixIcon,
    this.isPassword = false,
  });
  final String labelText;
  final Widget? suffixIcon;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      obscureText: isPassword,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kBordersideColor),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kBordersideColor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kBordersideColor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
