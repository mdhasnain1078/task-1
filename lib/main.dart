import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/constant/appTheme.dart';
import 'package:task1/provider/carts.dart';
import 'package:task1/screen/homeWrapper.dart';

import 'model/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Carts()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: textTheme,
            cardTheme: const CardTheme(
                color: Colors.white, shadowColor: Colors.white)),
        home: homeWrapper(),
      ),
    );
  }
}
