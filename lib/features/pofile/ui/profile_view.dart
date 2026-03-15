import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/app_routs.dart';
import 'package:store_app/core/theme/app_colors.dart';
import 'package:store_app/core/widgets/custom_row_button.dart';
import 'package:store_app/core/widgets/spacing_widget.dart';
import 'package:store_app/features/auth/logic/cubit/auth_cubit.dart';
import 'package:store_app/features/pofile/widgets/edit_name_widget.dart';
import 'package:store_app/features/pofile/widgets/my_orders_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String _profileName = 'John Doe';

  void _openEditNameDialog() {
    showDialog<void>(
      context: context,
      builder: (context) {
        return EditNameWidget(
          initialName: _profileName,
          onSave: (newName) {
            setState(() {
              _profileName = newName;
            });
          },
        );
      },
    );
  }

  void _openMyOrdersSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.kScaffoldColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.72,
          child: const MyOrdersWidget(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubitCubit, AuthCubitState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Signed out successfully')),
          );
          context.pushReplacementNamed(AppRouts.loginScreen);
        } else if (state is SignOutFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
        if (state is SignOutFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return state is SignOutLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.kPrimaryColor,
                ),
              )
            : Center(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * .60,
                  child: Card(
                    color: AppColors.kWhiteColor,
                    margin: EdgeInsets.all(24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: AppColors.kPrimaryColor,
                            foregroundColor: AppColors.kWhiteColor,
                            child: Icon(Icons.person, size: 50),
                          ),
                          heightSp(height: 16),
                          Text(
                            _profileName,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          heightSp(height: 8),
                          Text(
                            'john.doe@example.com',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          heightSp(height: 16),
                          CustomRowButton(
                            icon: Icons.person,
                            text: 'Edit Name',
                            onTap: _openEditNameDialog,
                          ),
                          heightSp(height: 8),
                          CustomRowButton(
                            icon: Icons.shopping_cart,
                            text: 'My Orders',
                            onTap: _openMyOrdersSheet,
                          ),
                          heightSp(height: 8),
                          CustomRowButton(
                            icon: Icons.logout,
                            text: 'Logout',
                            onTap: () async {
                              await context.read<AuthCubitCubit>().signOut();
                            },
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
