import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/theme/app_colors.dart';
import 'package:store_app/core/widgets/spacing_widget.dart';
import 'package:store_app/features/auth/logic/cubit/auth_cubit.dart';
import 'package:store_app/features/auth/widgets/custom_text_button.dart';
import 'package:store_app/features/auth/widgets/custom_text_feild.dart';

class ForgetPasswordWidget extends StatefulWidget {
  const ForgetPasswordWidget({super.key});

  @override
  State<ForgetPasswordWidget> createState() => _ForgetPasswordWidgetState();
}

class _ForgetPasswordWidgetState extends State<ForgetPasswordWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  void _sendResetLink() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }
    final authCubit = context.read<AuthCubitCubit>();
    await authCubit.sendPasswordResetEmail(email: _emailController.text.trim());
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password reset link sent to your email.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubitCubit, AuthCubitState>(
      listener: (context, state) {
        if (state is PasswordResetEmailSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Password reset link sent to your email.'),
            ),
          );
        } else if (state is PasswordResetEmailFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.kScaffoldColor,
          body: state is PasswordResetEmailLoading
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
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
                                  CustomTextFormFeild(
                                    labelText: 'Email',
                                    controller: _emailController,
                                  ),
                                  heightSp(height: 20),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: _sendResetLink,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppColors.kPrimaryColor,
                                        foregroundColor: AppColors.kWhiteColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8.r,
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 14.h,
                                        ),
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
      },
    );
  }
}
