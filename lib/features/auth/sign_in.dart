import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/app_routs.dart';
import 'package:store_app/core/theme/app_colors.dart';
import 'package:store_app/core/widgets/spacing_widget.dart';
import 'package:store_app/features/auth/widgets/custom_text_button.dart';
import 'package:store_app/features/auth/widgets/custom_text_feild.dart';
import 'package:store_app/features/auth/widgets/login_with_google_button.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kScaffoldColor,
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'Welcome To Our Market',
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            heightSp(height: 20),
            Card(
              color: AppColors.kWhiteColor,
              margin: EdgeInsets.all(24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    CustomTextFormFeild(labelText: 'Email'),
                    heightSp(height: 16),
                    CustomTextFormFeild(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.visibility_off),
                      ),
                      isPassword: true,
                    ),
                    heightSp(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomTextButton(
                          text: 'Forgot Password?',
                          onPressed: () {
                            context.push(AppRouts.forgetPasswordScreen);
                          },
                        ),
                      ],
                    ),

                    heightSp(height: 20),
                    SignInAndSignUpButton(text: 'Sign In', onPressed: () {}),
                    heightSp(height: 16),
                    // TODO: add sign in with google
                    LoginWithGoogleButton(),
                    heightSp(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account?'),
                        CustomTextButton(
                          text: 'Sign Up',
                          onPressed: () {
                            context.push(AppRouts.registerScreen);
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
    );
  }
}
