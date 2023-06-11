import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/constant/appColors.dart';
import 'package:task1/model/cart.dart';
import 'package:task1/provider/carts.dart';

import 'CardItem.dart';

class VerticalList extends StatelessWidget {
  const VerticalList({super.key, required this.carts});
  final List<Cart> carts;

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 280,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: carts.length,
        itemBuilder: (context, i) => ChangeNotifierProvider.value(value: carts[i], child: const CardItem(),),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 10,
        ),
      ),
    );
  }
}
