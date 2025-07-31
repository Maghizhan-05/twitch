import 'package:flutter/material.dart';
import 'package:twitch/resources/auth_methods.dart';
import 'package:twitch/screens/homescreen.dart';
import 'package:twitch/widgets/buttons.dart';
import 'package:twitch/widgets/textfield.dart';

class loginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthMethods _authMethods = AuthMethods();
  loginUser()async{
    bool res = await _authMethods.loginUser(context, _emailController.text, _passwordController.text);
    if(res){
      Navigator.pushReplacementNamed(context, homeScreen.routeName);
    }
  }
  Widget build(BuildContext context) {
    @override
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: size.height*0.1),
              const Text("Email", style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: customTextField(controller: _emailController),
              ),
              const SizedBox(height: 20),
              const Text("Password", style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: customTextField(controller: _passwordController),
              ),
              const SizedBox(height: 20),
              customButton(text: "Log In", onTap: loginUser),
            ],
          ),
        ),
      ),
    );
  }
}
