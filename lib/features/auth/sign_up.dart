import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/app_routs.dart';
import 'package:store_app/core/theme/app_colors.dart';
import 'package:store_app/core/widgets/spacing_widget.dart';
import 'package:store_app/features/auth/widgets/custom_text_button.dart';
import 'package:store_app/features/auth/widgets/custom_text_feild.dart';
import 'package:store_app/features/auth/widgets/login_with_google_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;
  bool _hideConfirmPassword = true;

  void _createAccount() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Account created successfully.')),
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
                Text(
                  'Create Your Account',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kBlackColor,
                  ),
                ),
                heightSp(height: 20),
                Card(
                  color: AppColors.kWhiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      children: [
                        const CustomTextFormFeild(labelText: 'Full Name'),
                        heightSp(height: 16),
                        const CustomTextFormFeild(labelText: 'Email'),
                        heightSp(height: 16),
                        CustomTextFormFeild(
                          labelText: 'Password',
                          isPassword: _hidePassword,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _hidePassword = !_hidePassword;
                              });
                            },
                            icon: Icon(
                              _hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        heightSp(height: 16),
                        CustomTextFormFeild(
                          labelText: 'Confirm Password',
                          isPassword: _hideConfirmPassword,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _hideConfirmPassword = !_hideConfirmPassword;
                              });
                            },
                            icon: Icon(
                              _hideConfirmPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        heightSp(height: 20),
                        SignInAndSignUpButton(
                          text: 'Sign Up',
                          onPressed: _createAccount,
                        ),
                        heightSp(height: 16),
                        const LoginWithGoogleButton(),
                        heightSp(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an account?'),
                            CustomTextButton(
                              text: 'Sign In',
                              onPressed: () {
                                if (context.canPop()) {
                                  context.pop();
                                } else {
                                  context.go(AppRouts.loginScreen);
                                }
                              },
                            ),
                          ],
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
