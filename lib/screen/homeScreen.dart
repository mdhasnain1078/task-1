import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:task1/constant/appColors.dart';
import 'package:task1/model/cart.dart';
import 'package:task1/provider/carts.dart';
import 'package:task1/widgets/reusableButton.dart';
import 'package:task1/widgets/vertical_list.dart';

import '../widgets/header.dart';
import '../widgets/heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Carts>(context);
    final hieght = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.normal),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Header(),
              const SizedBox(
                height: 24,
              ),
              const ListHeading(title: "Programs for you",),
              VerticalList(carts: cart.programList,),
              const SizedBox(
                height: 32,
              ),
              const ListHeading(title: "Events and experiences",),
              VerticalList(carts: cart.eventList),
              const SizedBox(
                height: 32,
              ),
              const ListHeading(title: "Lessons for you",),
              VerticalList(carts: cart.lessonList),
            ],
          ),
        ),
      ),
    );
  }
}

