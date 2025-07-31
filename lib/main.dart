import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitch/providers/userprovider.dart';
import 'package:twitch/resources/auth_methods.dart';
import 'package:twitch/screens/homescreen.dart';
import 'package:twitch/screens/onboarding.dart';
import 'package:twitch/screens/signupscreen.dart';
import 'package:twitch/utils/colors.dart';
import 'package:twitch/screens/loginscreen.dart';
import 'package:twitch/widgets/loading_indicator.dart';
import 'firebase_options.dart';
import 'package:twitch/models/user.dart' as model;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyAgfFdvPOP5c6RVncV9V-jciCg0K8pKNO8',
        appId: '1:913812268775:android:21b3fb41e3bf7387d5a442',
        messagingSenderId: '913812268775',
        projectId: 'twitch-clone-b1541',
        storageBucket: 'twitch-clone-b1541.firebasestorage.app',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>UserProvider())
  ],child: const MyApp()));
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
        homeScreen.routeName: (context)=> const homeScreen()
    },
      home: FutureBuilder(
        future: AuthMethods().getCurrentUser(FirebaseAuth.instance.currentUser != null ? FirebaseAuth.instance.currentUser!.uid : null).then((value){
          if(value != null){
            Provider.of<UserProvider>(context, listen: false).setUser(model.User.fromJson(value));
      }
          return value;
      }),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return const loadingIndicator();
          }
          if(snapshot.hasData){
            return const homeScreen();
          }
          return const onBoardingScreen();
        },
      ),
    );
  }
}

