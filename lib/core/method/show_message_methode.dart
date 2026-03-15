
  import 'package:flutter/material.dart';
import 'package:store_app/core/theme/app_colors.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMessage(BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: AppColors.kPrimaryColor,
          ),
        );
  }