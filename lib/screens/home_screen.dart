import 'package:flutter/material.dart';
import 'package:mood_app1/widgets/backgroung_gradient.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [BackgroundImage()],
      ),
    );
  }
}
