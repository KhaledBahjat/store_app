import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/theme/app_colors.dart';
import 'package:store_app/core/widgets/cach_image.dart';

class ProudctDetailsView extends StatefulWidget {
  const ProudctDetailsView({super.key});

  @override
  State<ProudctDetailsView> createState() => _ProudctDetailsViewState();
}

class _ProudctDetailsViewState extends State<ProudctDetailsView> {
  int _quantity = 1;
  final double _price = 99.99;

  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decreaseQuantity() {
    if (_quantity == 1) {
      return;
    }
    setState(() {
      _quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final total = _price * _quantity;

    return Scaffold(
      backgroundColor: AppColors.kScaffoldColor,
      appBar: AppBar(title: const Text('Product Details'), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: AppColors.kWhiteColor,
              child: Padding(
                padding: EdgeInsets.all(14.r),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: SizedBox(
                    width: double.infinity,
                    height: 260.h,
                    child: const CachImage(
                      imageUrl:
                          'https://images.pexels.com/photos/279906/pexels-photo-279906.jpeg',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sport Running Shoes',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.kBlackColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: Colors.amber,
                        size: 22.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '4.8',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '(1,240 reviews)',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.kGreyColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    children: [
                      Text(
                        '\$${_price.toStringAsFixed(2)} LE',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '\$199.99 LE',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.kGreyColor,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.kPrimaryColor.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(999.r),
                        ),
                        child: Text(
                          '50% OFF',
                          style: TextStyle(
                            color: AppColors.kPrimaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.kWhiteColor,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColors.kBordersideColor),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Quantity',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        _QtyButton(
                          icon: Icons.remove,
                          onPressed: _decreaseQuantity,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '$_quantity',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        _QtyButton(
                          icon: Icons.add,
                          onPressed: _increaseQuantity,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Lightweight and comfortable running shoes designed for daily training. The breathable mesh upper keeps your feet cool while the cushioned sole offers support for long distance walks and runs.',
                    style: TextStyle(
                      fontSize: 15.sp,
                      height: 1.5,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColors.kWhiteColor,
        padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 18.h),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      color: AppColors.kGreyColor,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '\$${total.toStringAsFixed(2)} LE',
                    style: TextStyle(
                      color: AppColors.kBlackColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 20.sp,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kPrimaryColor,
                  foregroundColor: AppColors.kWhiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                ),
                child: Text(
                  'Add To Cart',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  const _QtyButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 34.w,
      height: 34.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: AppColors.kPrimaryColor,
          foregroundColor: AppColors.kWhiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.r),
          ),
        ),
        child: Icon(icon, size: 18.sp),
      ),
    );
  }
}
