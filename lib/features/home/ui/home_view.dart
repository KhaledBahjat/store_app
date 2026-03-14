import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/theme/app_colors.dart';
import 'package:store_app/core/widgets/custom_search_feild.dart';
import 'package:store_app/core/widgets/spacing_widget.dart';
import 'package:store_app/features/home/ui/widgets/categoris_list.dart';

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
            child: CategoriseList(),
          ),
        ],
      ),
    );
  }
}

