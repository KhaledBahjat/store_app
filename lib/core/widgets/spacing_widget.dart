import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class widthSp extends StatelessWidget {
  const widthSp({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width.w);
  }
}

class heightSp extends StatelessWidget {
  const heightSp({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height.h);
  }
}
