import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_coffee_app/app/styles/app_colors.dart';
import 'package:flutter_coffee_app/pages/main_page.dart';
import 'package:flutter_coffee_app/pages/splash_page.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: context.colors.primary),
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: context.colors.greyF8,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/main': (context) => const MainPage(),
      },
    );
  }
}
