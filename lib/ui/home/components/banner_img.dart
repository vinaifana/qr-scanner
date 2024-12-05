import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerImage extends StatefulWidget {
  const BannerImage({super.key});

  @override
  State<BannerImage> createState() => _BannerImageState();
}

class _BannerImageState extends State<BannerImage> {

  final List<String> imgList = [
    'assets/images/banner_img1.jpg',
    'assets/images/banner_img2.jpg',
    'assets/images/banner_img3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10),
        CarouselSlider(
          items: imgList.map((item) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                item,
                fit: BoxFit.cover,
                width: double.infinity, 
              ),
            ),
          )).toList(),
          options: CarouselOptions(
            autoPlay: true,
            enableInfiniteScroll: true, 
            enlargeCenterPage: true, 
            height: 150, 
          ),
        ),
      ],
    );
  }
}