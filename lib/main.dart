import 'package:flutter/material.dart';
import 'package:flutter_chart/view/screens/converter_screen.dart';
import 'package:flutter_chart/view/screens/dropdown_button.dart';
import 'package:flutter_chart/view/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Charts',
      theme: ThemeData.dark().copyWith(appBarTheme: const AppBarTheme(backgroundColor: Colors.deepPurple)),
      home: const TemperatureConverterScreen(),
    );
  }
}
