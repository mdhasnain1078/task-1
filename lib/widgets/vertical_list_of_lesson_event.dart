import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/model/cart.dart';
import 'CartItem_of_lesson_event.dart';

class VerticalListOfEventsexperiences extends StatelessWidget {
  const VerticalListOfEventsexperiences({super.key, required this.carts});
  final List<Cart> carts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: carts == [] ? const Center(child: Text("Items not found", style: TextStyle(color: Colors.black),),) :
       ListView.separated(
        physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: carts.length,
        itemBuilder: (context, i) => ChangeNotifierProvider.value(value: carts[i], child: const CartItemOfEventexperience(),),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 10,
        ),
      ),
    );
  }
}