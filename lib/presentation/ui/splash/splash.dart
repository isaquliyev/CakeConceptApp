import 'package:cake_concept_app/presentation/shared/color.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColor.example(context),
      body: const Center(child: Text('Splash'),),
    );
  }
}
