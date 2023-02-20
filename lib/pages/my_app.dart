import 'package:flutter/material.dart';
import 'package:flutter_project_4/pages/home_page/dashboard.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Dashboard(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFfafafb),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
