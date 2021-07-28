import 'package:flutter/material.dart';
import 'package:restra_app/sizedconfig.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizedConfig().init(context);
    double screenWidth = SizedConfig.blockSizeHorizontal;
    double screenHeight = SizedConfig.blockSizeVertical;
    return Center(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: screenWidth * 40,
              child: Image.asset(
                "asset/images/emptycart.png",
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(height: screenHeight * 8),
            Container(
              // padding: EdgeInsets.only(left: screenWidth * 15),
              child: Text(
                "your cart is empty",
                style: TextStyle(
                  fontSize: screenWidth * 6,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: screenWidth * 15,
                  right: screenWidth * 13,
                  top: screenWidth * 4),
              child: Text(
                "looks like you haven't added anything",
                style: TextStyle(
                  fontSize: screenWidth * 4,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: screenWidth * 15,
                  right: screenWidth * 13,
                  top: screenWidth * 1),
              child: Text(
                "to your cart yet",
                style: TextStyle(
                  fontSize: screenWidth * 4,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
