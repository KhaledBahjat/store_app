import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/method/show_message_methode.dart';
import 'package:store_app/core/routing/app_routs.dart';
import 'package:store_app/core/theme/app_colors.dart';
import 'package:store_app/core/widgets/spacing_widget.dart';
import 'package:store_app/features/auth/logic/cubit/auth_cubit.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubitCubit, AuthCubitState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showMessage(
              context,
              'Account created successfully please verify your email before signing in',
            );
            context.go(AppRouts.loginScreen);
          });
        }
      },
      builder: (context, state) {
        AuthCubitCubit authCubit = context.read<AuthCubitCubit>();
        if (state is SignUpFailure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showMessage(context, state.errorMessage);
          });
        }
        return Scaffold(
          backgroundColor: AppColors.kScaffoldColor,
          body: state is SignUpLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.kPrimaryColor,
                  ),
                )
              : SafeArea(
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
                                  CustomTextFormFeild(
                                    labelText: 'Full Name',
                                    controller: _nameController,
                                  ),
                                  heightSp(height: 16),
                                  CustomTextFormFeild(
                                    labelText: 'Email',
                                    controller: _emailController,
                                  ),
                                  heightSp(height: 16),
                                  CustomTextFormFeild(
                                    controller: _passwordController,
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

                                  heightSp(height: 20),
                                  SignInAndSignUpButton(
                                    text: 'Sign Up',
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        authCubit.signUp(
                                          name: _nameController.text,
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                        );
                                      }
                                    },
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
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
