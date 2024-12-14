import 'package:cafe_menu/Features/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';

import 'Core/Theme/app_palette.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppPalette.primaryBackgroundColor,
        fontFamily: "Sora",
      ),
      home: const SplashScreen(),
    );
  }
}
