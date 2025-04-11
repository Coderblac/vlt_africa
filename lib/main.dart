import 'package:flutter/material.dart';
import 'package:vlt_africa/helper.dart';
import 'package:vlt_africa/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VLT Academy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: CustomHexColors.fromHex('#2a3935'),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const Homepage(),
    );
  }
}