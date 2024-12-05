import 'package:flutter/material.dart';
import 'package:qr_scanner/consts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/onboarding');
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/app_logo.png",
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Scannie',
              style: TextStyle(
                fontSize: 24,
                color: primaryColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}