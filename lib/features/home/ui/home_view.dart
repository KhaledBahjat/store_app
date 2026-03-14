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
          CategoriseList(),
          heightSp(height: 15),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16.r),
                        bottomRight: Radius.circular(16.r),
                        bottomLeft: Radius.circular(16.r),
                      ),
                      child: Image.network(
                        'https://images.pexels.com/photos/279906/pexels-photo-279906.jpeg',
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      child: Container(
                        alignment: Alignment.center,
                        width: 65.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: AppColors.kPrimaryColor.withOpacity(0.7),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16.r),
                            bottomRight: Radius.circular(16.r),
                          ),
                        ),
                        child: Text(
                          '50% Off',
                          style: TextStyle(
                            color: AppColors.kWhiteColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
