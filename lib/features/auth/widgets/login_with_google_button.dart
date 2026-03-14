import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/app_routs.dart';
import 'package:store_app/core/theme/app_colors.dart';

class LoginWithGoogleButton extends StatelessWidget {
  const LoginWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40.h,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      textColor: Colors.white,
      color: AppColors.kPrimaryColor.withAlpha(200),
      onPressed: () => GoRouter.of(context).pushNamed(AppRouts.mainHomeScreen),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/google.png', height: 20.h),
          SizedBox(width: 10.w),
          Text('Continue with Google'),
        ],
      ),
    );
  }
}

class SignInAndSignUpButton extends StatelessWidget {
  const SignInAndSignUpButton({super.key, this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.kPrimaryColor,
        minimumSize: Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.kWhiteColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
