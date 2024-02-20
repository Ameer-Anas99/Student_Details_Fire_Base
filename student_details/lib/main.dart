import 'package:flutter/material.dart';
import 'package:student_details/add_details.dart';
import 'package:student_details/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/add': (context) => AddPage(),
      },
      initialRoute: '/',
    );
  }
}
