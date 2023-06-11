
import 'package:flutter/material.dart';

enum Category{program, event, lesson}
class Cart with ChangeNotifier{
  final String imagePath;
  final String title;
  final String description;
  final String lessons;
  final Category category;
  String dateTime;
  Cart({required this.imagePath, required this.title, required this.description, required this.lessons, required this.category, this.dateTime = ''});
}