import 'package:flutter/material.dart';
import 'package:qr_scanner/ui/generator/qr_generator_screen.dart';
import 'package:qr_scanner/ui/home/home_screen.dart';
import 'package:qr_scanner/ui/onboarding/components/on_boarding_screen.dart';
import 'package:qr_scanner/ui/scanner/qr_scanner_screen.dart';
import 'package:qr_scanner/ui/splash/splash_screen.dart';

void main() {
  runApp(const QrScannerApp());
}

class QrScannerApp extends StatelessWidget {
  const QrScannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QR Scanner App",
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Colfax',
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => const SplashScreen(),
        "/onboarding": (context) => const OnBoardingScreen(),
        "/home": (context) => const HomeScreen(),
        "/scanner": (context) => const QrScannerScreen(),
        "/generator": (context) => const QrGeneratorScreen(),
      },
    );
  }
}