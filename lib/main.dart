import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:vlt_africa/helper.dart';
import 'package:vlt_africa/new_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ), 
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
          seedColor: CustomHexColors.fromHex('ffffff'),//#2a3935
          brightness: Brightness.light, // Change to Brightness.dark for dark mode
          primary: CustomHexColors.fromHex('#2a3935'), // Primary color
        ),
        useMaterial3: true,
      ),
      home: const NewHomePage(),
    );
  }
}