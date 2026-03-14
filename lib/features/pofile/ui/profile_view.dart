import 'package:flutter/material.dart';
import 'package:store_app/core/theme/app_colors.dart';
import 'package:store_app/core/widgets/custom_row_button.dart';
import 'package:store_app/core/widgets/spacing_widget.dart';
import 'package:store_app/features/pofile/widgets/edit_name_widget.dart';
import 'package:store_app/features/pofile/widgets/my_orders_widget.dart';

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
    return Center(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * .55,
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
