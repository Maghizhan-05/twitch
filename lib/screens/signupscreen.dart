import 'package:flutter/material.dart';
import 'package:twitch/widgets/buttons.dart';
import 'package:twitch/widgets/textfield.dart';

import '../resources/auth_methods.dart';
import '../widgets/loading_indicator.dart';
import 'homescreen.dart';

class signUpScreen extends StatefulWidget {
  static const routeName = '/signup';
  const signUpScreen({super.key});



  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final AuthMethods _authMethods = AuthMethods();
  bool _isLoading = false;

  void signUpUser()async{
    setState(() {
      _isLoading = true;
    });
    bool res = await _authMethods.signUpUser(context, _emailController.text, _usernameController.text, _passwordController.text);
    setState(() {
      _isLoading = false;
    });
    if(res){
      Navigator.pushReplacementNamed(context, homeScreen.routeName);
    }
  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }



  Widget build(BuildContext context) {
    @override
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: _isLoading
        ? const loadingIndicator()
        : SingleChildScrollView(
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
              const Text("Username", style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: customTextField(controller: _usernameController),
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
              customButton(text: "Sign Up", onTap: signUpUser),
            ],
          ),
        ),
      ),
    );
  }
}
