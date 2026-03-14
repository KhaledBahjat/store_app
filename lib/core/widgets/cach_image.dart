import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/theme/app_colors.dart';

class CachImage extends StatelessWidget {
  const CachImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => SizedBox(
        height: 200.h,
        child: Center(
          child: CircularProgressIndicator(color: AppColors.kPrimaryColor),
        ),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
