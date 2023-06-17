import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  final String id;
  final String imagePath;
  final String category;
  final String name;
  final int lessons;
  bool? isLocked;
  String? createdAt;
  int? duration;
  Cart( 
      {
      required this.id,
      required this.imagePath,
      required this.name,
      required this.lessons,
      required this.category,
      this.createdAt,
      this.isLocked,
      this.duration
      });
}
