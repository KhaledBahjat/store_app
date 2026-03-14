import 'package:flutter/material.dart';
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
          Image.asset('assets/images/buy.jpg'),
        ],
      ),
    );
  }
}
