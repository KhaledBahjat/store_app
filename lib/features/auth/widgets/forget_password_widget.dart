import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/theme/app_colors.dart';
import 'package:store_app/core/widgets/spacing_widget.dart';
import 'package:store_app/features/auth/widgets/custom_text_button.dart';
import 'package:store_app/features/auth/widgets/custom_text_feild.dart';

class ForgetPasswordWidget extends StatefulWidget {
  const ForgetPasswordWidget({super.key});

  @override
  State<ForgetPasswordWidget> createState() => _ForgetPasswordWidgetState();
}

class _ForgetPasswordWidgetState extends State<ForgetPasswordWidget> {
  final _formKey = GlobalKey<FormState>();

  void _sendResetLink() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password reset link sent to your email.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kScaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextButton(
                  text: 'Back to Login',
                  onPressed: () => Navigator.of(context).pop(),
                ),
                heightSp(height: 12),
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kBlackColor,
                  ),
                ),
                heightSp(height: 8),
                Text(
                  'Enter your email address and we will send you a reset link.',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.kGreyColor,
                  ),
                ),
                heightSp(height: 28),
                Card(
                  color: AppColors.kWhiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      children: [
                        const CustomTextFormFeild(labelText: 'Email'),
                        heightSp(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _sendResetLink,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.kPrimaryColor,
                              foregroundColor: AppColors.kWhiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                            ),
                            child: Text(
                              'Send Reset Link',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
