import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:store_app/core/theme/app_colors.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(child: Text('Testing Main Home View')),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: AppColors.kWhiteColor),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            rippleColor:
                AppColors.kPrimaryColor, // tab button ripple color when pressed
            hoverColor: AppColors.kPrimaryColor, // tab button hover color
            // tab button shadow
            // // tab animation curves
            duration: Duration(milliseconds: 400), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            color: AppColors.kGreyColor, // unselected icon color
            activeColor: AppColors.kWhiteColor, // selected icon and text color
            iconSize: 24, // tab button icon size
            tabBackgroundColor:
                AppColors.kPrimaryColor, // selected tab background color
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ), // navigation bar padding
            tabs: [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.store, text: 'Store'),
              GButton(icon: Icons.favorite, text: 'Favorites'),
              GButton(icon: Icons.person, text: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
