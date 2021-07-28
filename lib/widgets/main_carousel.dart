import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class MainCarousel extends StatefulWidget {
  const MainCarousel({Key key}) : super(key: key);

  @override
  _MainCarouselState createState() => _MainCarouselState();
}

class _MainCarouselState extends State<MainCarousel> {
  @override
  Widget build(BuildContext context) {
    return Carousel(
      images: [
        ExactAssetImage("asset/images/salad1.jpg"),
        ExactAssetImage("asset/images/soup1.jpg"),
        ExactAssetImage("asset/images/sweet1.png"),
        ExactAssetImage("asset/images/sweet2.jpg"),
      ],
      dotSize: 4.0,
      dotSpacing: 15.0,
      dotColor: Colors.white,
      indicatorBgPadding: 5.0,
      dotBgColor: Colors.purple.withOpacity(0.5),
      borderRadius: true,
      moveIndicatorFromBottom: 180.0,
      noRadiusForIndicator: true,
      boxFit: BoxFit.fill,
    );
  }
}
