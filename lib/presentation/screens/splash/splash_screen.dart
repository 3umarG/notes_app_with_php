import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: 6), () {
      Navigator.pushReplacementNamed(context, AppRoutes.signUpScreenRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomLogoSplash(),
    );
  }
}

class CustomLogoSplash extends StatelessWidget {
  const CustomLogoSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset("assets/lottie/logo.json",height: 250,width: 250 ),
    );
  }
}
