import 'package:flutter/material.dart';

class loadingIndicator extends StatelessWidget {
  const loadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
