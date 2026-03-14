import 'package:flutter/material.dart';
import 'package:store_app/core/widgets/custom_search_feild.dart';
import 'package:store_app/core/widgets/proudct_list.dart';
import 'package:store_app/core/widgets/spacing_widget.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Center(
            child: Text(
              'Welcome To Our Store',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          heightSp(height: 20),
          CustomSearchFeild(),
          heightSp(height: 10),
          ProudctList(),
        ],
      ),
    );
  }
}
