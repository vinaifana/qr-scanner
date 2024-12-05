import 'package:flutter/material.dart';
import 'package:qr_scanner/consts.dart';
import 'package:qr_scanner/ui/onboarding/components/on_boarding_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0; 
  PageController _pageController = PageController();

  List<Map<String, String>> splashData = [
    {
      "text": "Hi, Welcome to Scannie and \nEffortless QR Code Scanning",
      "image": "assets/images/onboarding_img1.png"
    },
    {
      "text": "Enter text, links, or other info.\nYour QR Code is ready in seconds!",
      "image": "assets/images/onboarding_img2.png"
    },
    {
      "text": "Share on WhatsApp, Instagram, Facebook,\nand more with just one tap.",
      "image": "assets/images/onboarding_img3.png"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                  width: double.infinity,
                  child: PageView.builder( 
                    controller: _pageController,
                      onPageChanged: (value){
                        setState(() {
                          currentPage = value;
                        });
                      },
                      itemCount: splashData.length, 
                      itemBuilder: (context, index) => OnBoardingContent(
                          text: splashData[index]["text"]!, 
                          image: splashData[index]["image"]!))), 
            ),
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
              children:
                List.generate(
                  splashData.length,
                  (index) => _dotsIndicator(index: index))
              )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor
                  ),
                  onPressed: () {
                    if (currentPage == splashData.length - 1) { //berpindah sesuai data
                      //untuk perpindahan antar halaman 
                      Navigator.pushNamed(context, '/home');
                    } else {
                      _pageController.animateToPage(
                        currentPage + 1,
                       duration: animationDuration, 
                       curve: Curves.ease);
                      currentPage + 1;
                    }
                  }, //repersentasi dari function yang kosong (agar ga error)
                  child: Text(
                    currentPage == splashData.length - 1 ? "Start" : "Next",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ),
              ),
            )
          ],
        )
      ),
    );
  }

    AnimatedContainer _dotsIndicator({required int index}) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: currentPage == index
        ? primaryColor
        : textBlue
      ),
      duration: animationDuration,
      width : currentPage == index ? 20 : 10,
      height: 10,
    );
  }
}