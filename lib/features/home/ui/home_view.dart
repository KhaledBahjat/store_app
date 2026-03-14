import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/theme/app_colors.dart';
import 'package:store_app/core/widgets/custom_search_feild.dart';
import 'package:store_app/core/widgets/spacing_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          CustomSearchFeild(),
          heightSp(height: 20),
          Image.asset('assets/images/buy.jpg', height: 200, fit: BoxFit.cover),
          heightSp(height: 15),
          Text(
            'Popular Categories',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          heightSp(height: 15),
          SizedBox(
            child: SizedBox(
              height: 120.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.kPrimaryColor,
                        foregroundColor: AppColors.kWhiteColor,
                        radius: 30,
                        child: Icon(categories[index].icon, size: 40),
                      ),
                      heightSp(height: 5),
                      Text(categories[index].name),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<CategoryItem> categories = [
  CategoryItem(name: 'Sports', icon: Icons.sports),
  CategoryItem(name: 'Electronics', icon: Icons.electrical_services),
  CategoryItem(name: 'Colection', icon: Icons.collections),
  CategoryItem(name: 'Books', icon: Icons.book),
  CategoryItem(name: 'Games', icon: Icons.gamepad),
  CategoryItem(name: 'Devlober', icon: Icons.developer_board),
];

class CategoryItem {
  final String name;
  final IconData icon;

  CategoryItem({required this.name, required this.icon});
}
