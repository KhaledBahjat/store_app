import 'package:flutter/material.dart';
import 'package:store_app/core/widgets/proudct_card_widget.dart';

class ProudctList extends StatelessWidget {
  const ProudctList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => ProudctCard(),
    );
  }
}
