import 'package:flutter/material.dart';
import 'package:qr_scanner/consts.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({super.key, required this.text, required this.image});

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 300,
          width: 400,
        ),
        const SizedBox(height: 20,),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20, 
            color: textBlue,
            fontWeight: FontWeight.bold
            ),
          ),
      ],
    );
  }
}