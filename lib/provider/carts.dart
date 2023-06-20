import 'dart:convert';
import 'package:flutter/material.dart';
 import 'package:dio/dio.dart';
import 'package:task1/model/cart.dart';
import 'package:http/http.dart' as http;

class Carts with ChangeNotifier {
  final List<Cart> _carts = [
    // Cart(
    //     imagePath: "assets/image/image1.png",
    //     title: "LIFESTYLE",
    //     description: "A complete guide for your new born baby",
    //     lessons: "16",
    //     category: Category.program,
    //     dateTime: DateFormat("d MMM, EEEE").format(DateTime.now())
    //     ),
    // Cart(
    //     imagePath: "assets/image/image1.png",
    //     title: "LIFESTYLE",
    //     description: "A complete guide for your new born baby",
    //     lessons: "12",
    //     category: Category.program,
    //     dateTime: DateFormat("d MMM, EEEE").format(DateTime.now())),
    // Cart(
    //     imagePath: "assets/image/image1.png",
    //     title: "LIFESTYLE",
    //     description: "A complete guide for your new born baby",
    //     lessons: "13",
    //     category: Category.program,
    //     dateTime: DateFormat("d MMM, EEEE").format(DateTime.now())),
    // Cart(
    //     imagePath: "assets/image/image2.png",
    //     title: "BABYCARE",
    //     description: "Understanding of human behaviour",
    //     lessons: "16",
    //     category: Category.event,
    //     dateTime: DateFormat("d MMM, EEEE").format(DateTime.now())),
    // Cart(
    //     imagePath: "assets/image/image2.png",
    //     title: "BABYCARE",
    //     description: "Understanding of human behaviour",
    //     lessons: "16",
    //     category: Category.event,
    //     dateTime: DateFormat("d MMM, EEEE").format(DateTime.now())),
    // Cart(
    //     imagePath: "assets/image/image2.png",
    //     title: "BABYCARE",
    //     description: "Understanding of human behaviour",
    //     lessons: "16",
    //     category: Category.event,
    //     dateTime: DateFormat("d MMM, EEEE").format(DateTime.now())),
    // Cart(
    //     imagePath: "assets/image/image2.png",
    //     title: "BABYCARE",
    //     description: "Understanding of human behaviour",
    //     lessons: "16",
    //     category: Category.lesson,
    //     dateTime: DateFormat("d MMM, EEEE").format(DateTime.now())),
    // Cart(
    //     imagePath: "assets/image/image2.png",
    //     title: "BABYCARE",
    //     description: "Understanding of human behaviour",
    //     lessons: "16",
    //     category: Category.lesson,
    //     dateTime: DateFormat("d MMM, EEEE").format(DateTime.now())),
    // Cart(
    //     imagePath: "assets/image/image2.png",
    //     title: "BABYCARE",
    //     description: "Understanding of human behaviour",
    //     lessons: "16",
    //     category: Category.lesson,
    //     dateTime: DateFormat("d MMM, EEEE").format(DateTime.now())),
  ];

  int length = 0;

  Future<void> fetchData1(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      final extractedData = jsonDecode(response.body) as Map<String, dynamic>?;
      if (extractedData == null) {
        return;
      }
      extractedData['items'].map(
        (item) =>
        _carts.add(
          Cart(
            id: item['id'],
            imagePath: "assets/image/image2.png",
            name: item['name'],
            lessons: item['lesson'] ?? 0, 
            category: item['category'],
            createdAt: item['createdAt'],
            isLocked: item['locked'] ?? true,
            duration: item['duration'] ?? 0,
          ),
        ),
      ).toList();
      print("Done");
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  

  // Future<void>getData1() async{
  //   const url1 = "https://632017e19f82827dcf24a655.mockapi.io/api/programs";
  //   const url2 = "https://632017e19f82827dcf24a655.mockapi.io/api/lessons";
  //   await fetchData(url1);
  //   await fetchData(url2);
  //   notifyListeners();
  // }


 


Future<void> fetchData() async {
  const url1 = "https://632017e19f82827dcf24a655.mockapi.io/api/programs";
  const url2 = "https://632017e19f82827dcf24a655.mockapi.io/api/lessons";
  print("Start");

  Dio dio = Dio();
  // Create two separate requests for the APIs
  var request1 = dio.get(url1);
  var request2 = dio.get(url2);

  // Use Dio's `Future.wait` to await both requests
  List<Response<dynamic>> responses = await Future.wait([request1, request2]);

  // Process the responses
  Response<dynamic> response1 = responses[0];
  Response<dynamic> response2 = responses[1];
  // print(response1.data);
  // Handle the API responses as needed
  if (response1.statusCode == 200) {
    // print(response1.data);
    // Successful response from API 1
    final extractedData = response1.data as Map<String, dynamic>?;
      if (extractedData == null) {
        print("NULL");
        return;
      }
      (extractedData['items'] as List<dynamic>).map(
        (item){
        _carts.add(
          Cart(
            id: item['id'],
            imagePath: "assets/image/image2.png",
            name: item['name'],
            lessons: item['lesson'] ?? 0, 
            category: item['category'],
            createdAt: item['createdAt'],
            isLocked: item['locked'] ?? true,
            duration: item['duration'] ?? 0,
          ),
        );
        
        print("Done");}
      ).toList();
      print("0");
    // var data1 = response1.data;
    print(extractedData);
    // Process the data
  } else {
    print("Error");
    // Handle API 1 error
  }

  if (response2.statusCode == 200) { 
    // Successful response from API 2
    final extractedData = response2.data as Map<String, dynamic>?;
      if (extractedData == null) {
        return;
      }
      (extractedData['items'] as List<dynamic>).map(
        (item) =>
        _carts.add(
          Cart(
            id: item['id'],
            imagePath: "assets/image/image2.png",
            name: item['name'],
            lessons: item['lesson'] ?? 0, 
            category: item['category'],
            createdAt: item['createdAt'],
            isLocked: item['locked'] ?? true,
            duration: item['duration'] ?? 0,
          ),
        ),
      ).toList();
      print("1");
    // var data2 = response2.data;
    print(extractedData);
    // Process the data
  } else {
    print("Error");
    // Handle API 2 error
  }
}



  List<Cart> get cart {
    return _carts;
  }

  int get lengthOfList {
    return length;
  }

  List<Cart> get programList {
    return _carts.where((item) => item.isLocked == true).toList();
  }

  List<Cart> get eventList {
    return _carts;
  }

  List<Cart> get lockLessonsList {
    return _carts.where((item) => item.isLocked == false).toList();
  }
}
