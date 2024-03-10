import 'package:flutter/material.dart';
import './weatherapp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WeatherApp(),
      theme: ThemeData.dark(useMaterial3: true),
    );
  }
}
