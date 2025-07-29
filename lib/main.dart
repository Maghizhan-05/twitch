import 'package:flutter/material.dart';
import 'package:twitch/screens/onboarding.dart';
import 'package:twitch/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: backgroundColor,
          titleTextStyle: const TextStyle(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: onBoarding(),
    );
  }
}

