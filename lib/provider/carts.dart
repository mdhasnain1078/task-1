import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task1/model/cart.dart';

class Carts with ChangeNotifier {
  final List<Cart> _carts = [
    Cart(
        imagePath: "assets/image/image1.png",
        title: "LIFESTYLE",
        description: "A complete guide for your new born baby",
        lessons: "16",
        category: Category.program,
        dateTime: DateFormat("d MMM, EEEE").format(DateTime.now())
        ),
    Cart(
        imagePath: "assets/image/image1.png",
        title: "LIFESTYLE",
        description: "A complete guide for your new born baby",
        lessons: "12",
        category: Category.program,
        dateTime: DateFormat("d MMM, EEEE").format(DateTime.now())),
    Cart(
        imagePath: "assets/image/image1.png",
        title: "LIFESTYLE",
        description: "A complete guide for your new born baby",
        lessons: "13",
        category: Category.program,
        dateTime: DateFormat("d MMM, EEEE").format(DateTime.now())),
    Cart(
        imagePath: "assets/image/image2.png",
        title: "BABYCARE",
        description: "Understanding of human behaviour",
        lessons: "16",
        category: Category.event,
        dateTime: DateFormat("d MMM, EEEE").format(DateTime.now())),
    Cart(
        imagePath: "assets/image/image2.png",
        title: "BABYCARE",
        description: "Understanding of human behaviour",
        lessons: "16",
        category: Category.event,
        dateTime: DateFormat("d MMM, EEEE").format(DateTime.now())),
    Cart(
        imagePath: "assets/image/image2.png",
        title: "BABYCARE",
        description: "Understanding of human behaviour",
        lessons: "16",
        category: Category.event,
        dateTime: DateFormat("d MMM, EEEE").format(DateTime.now())),
    Cart(
        imagePath: "assets/image/image2.png",
        title: "BABYCARE",
        description: "Understanding of human behaviour",
        lessons: "16",
        category: Category.lesson,
        dateTime: DateFormat("d MMM, EEEE").format(DateTime.now())),
    Cart(
        imagePath: "assets/image/image2.png",
        title: "BABYCARE",
        description: "Understanding of human behaviour",
        lessons: "16",
        category: Category.lesson,
        dateTime: DateFormat("d MMM, EEEE").format(DateTime.now())),
    Cart(
        imagePath: "assets/image/image2.png",
        title: "BABYCARE",
        description: "Understanding of human behaviour",
        lessons: "16",
        category: Category.lesson,
        dateTime: DateFormat("d MMM, EEEE").format(DateTime.now())),
  ];

  List<Cart> get cart {
    return _carts;
  }

  List<Cart> get programList {
    return _carts
        .where((category) => category.category == Category.program)
        .toList();
  }

  List<Cart> get eventList {
    return _carts
        .where((category) => category.category == Category.event)
        .toList();
  }

  List<Cart> get lessonList {
    return _carts
        .where((category) => category.category == Category.lesson)
        .toList();
  }
}
