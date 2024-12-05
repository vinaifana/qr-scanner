import 'package:flutter/material.dart';
import 'package:qr_scanner/consts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            // Heading Text
            const Text(
              "Hi! Welcome to Scannie",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Choose Your Option To Do",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            // Title for categories
            const Text(
              "Choose a Feature",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Column for categories (vertical, full width)
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/scanner');
                  },
                  child: Container(
                    width: double.infinity,
                    height: 250.0,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/image_bg_scanner1.png'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 24), // Add space between the buttons
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/generator');
                  },
                  child: Container(
                    width: double.infinity, // Full width
                    height: 250.0,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/image_bg_scanner2.png'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
