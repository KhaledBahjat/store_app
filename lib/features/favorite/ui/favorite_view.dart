import 'package:flutter/material.dart';
import 'package:store_app/core/widgets/proudct_list.dart';
import 'package:store_app/core/widgets/spacing_widget.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Center(
            child: Text(
              'Your Favorite Products',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          heightSp(height: 20),
          ProudctList(),
        ],
      ),
    );
  }
}
