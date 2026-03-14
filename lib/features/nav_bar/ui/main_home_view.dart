import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:store_app/core/theme/app_colors.dart';
import 'package:store_app/features/favorite/ui/favorite_view.dart';
import 'package:store_app/features/home/ui/home_view.dart';
import 'package:store_app/features/nav_bar/logic/cubit/nav_bar_cubit.dart';
import 'package:store_app/features/pofile/ui/profile_view.dart';
import 'package:store_app/features/store/ui/store_view.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});
  final List<Widget> views = const [
    HomeView(),
    StoreView(),
    FavoriteView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          NavBarCubit navBarCubit = context.read<NavBarCubit>();
          return Scaffold(
            body: SafeArea(child: views[navBarCubit.currentIndex]),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(color: AppColors.kWhiteColor),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: GNav(
                  onTabChange: (value) => navBarCubit.changeIndex(value),
                  rippleColor: AppColors.kPrimaryColor,
                  hoverColor: AppColors.kPrimaryColor,
                  duration: Duration(milliseconds: 400),
                  gap: 8,
                  color: AppColors.kGreyColor,
                  activeColor: AppColors.kWhiteColor,
                  iconSize: 24,
                  tabBackgroundColor: AppColors.kPrimaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
        },
      ),
    );
  }
}
