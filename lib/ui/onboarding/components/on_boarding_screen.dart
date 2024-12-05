import 'package:flutter/material.dart';
import 'package:qr_scanner/size_config.dart';
import 'package:qr_scanner/ui/onboarding/components/body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}