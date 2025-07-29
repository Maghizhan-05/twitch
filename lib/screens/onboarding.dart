import 'package:flutter/material.dart';
import 'package:twitch/screens/loginscreen.dart';
import 'package:twitch/screens/signupscreen.dart';
import 'package:twitch/widgets/buttons.dart';

class onBoardingScreen extends StatelessWidget {
  static const routeName = '/onboarding';
  const onBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to \n twitch",style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: customButton(text: "Log In", onTap: (){
                Navigator.pushNamed(context, loginScreen.routeName);
              }),
            ),
            customButton(text: "Sign Up", onTap: (){
              Navigator.pushNamed(context, signUpScreen.routeName);
            })
          ],
        ),
      ),
    );
  }
}
