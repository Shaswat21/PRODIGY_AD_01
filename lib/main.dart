import 'package:flutter/material.dart';
import 'package:neumorphic_calculator/screens/calculator.dart';
import 'package:neumorphic_calculator/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      home: const CalculatorScreen(),
    );
  }
}

