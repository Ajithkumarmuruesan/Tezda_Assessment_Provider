import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:tezda_ecommerce/view/start_view/start_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      duration: 5000,
      textType: TextType.TyperAnimatedText,
      textStyle: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),
      text: "Tezda Shop",
      backgroundColor: Color(0xFFf5eded),
      navigateRoute: StartView(),
    );
  }
}