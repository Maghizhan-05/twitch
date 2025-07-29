import 'package:flutter/material.dart';
import 'package:twitch/screens/onboarding.dart';
import 'package:twitch/screens/signupscreen.dart';
import 'package:twitch/utils/colors.dart';
import 'package:twitch/screens/loginscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        iconTheme: const IconThemeData(
          color: primaryColor,
        )
      ),
      routes:  {
        onBoardingScreen.routeName: (context)=>const onBoardingScreen(),
        loginScreen.routeName: (context)=>const loginScreen(),
        signUpScreen.routeName: (context)=> const signUpScreen(),
    },
      home: onBoardingScreen(),
    );
  }
}

