import 'package:flutter/material.dart';
import 'package:twitch/utils/colors.dart';

class customTextField extends StatelessWidget {
  final TextEditingController controller;
  const customTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: buttonColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: secondaryBackgroundColor,
          ),
        ),
      ),
    );
  }
}
