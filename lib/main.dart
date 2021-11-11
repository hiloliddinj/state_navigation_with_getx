import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.purpleAccent),
        primaryColor: Colors.purple,
      ),
      home: Home(),
    );
  }
}