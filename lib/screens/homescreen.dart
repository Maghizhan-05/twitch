import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/userprovider.dart';


class homeScreen extends StatefulWidget {
  static const routeName = '/home';
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Center(child: Text(userProvider.user.username),),
    );
  }
}
