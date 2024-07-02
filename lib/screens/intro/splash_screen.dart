import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopz/util/constants/color_constants.dart';
import 'package:shopz/screens/main_screen/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryColor,
      body: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Shop",
                style: TextStyle(
                  color: ColorConstants.whiteColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const TextSpan(
                text: "Z",
                style: TextStyle(
                  color: Color.fromARGB(174, 211, 197, 197),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
            style: const TextStyle(
              fontSize: 55,
              letterSpacing: 7,
            ),
          ),
        ),
      ),
    );
  }
}
