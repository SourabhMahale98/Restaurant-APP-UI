import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restra_app/data/my_cart_list.dart';
import 'package:restra_app/sizedconfig.dart';

class PopularExpansion extends StatefulWidget {
  final MyCartList myCartList;
  final String foodName;
  const PopularExpansion({this.myCartList, this.foodName});

  @override
  _PopularExpansionState createState() => _PopularExpansionState();
}

class _PopularExpansionState extends State<PopularExpansion> {
  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];
    SizedConfig().init(context);
    double screenWidth = SizedConfig.blockSizeHorizontal;
    double screenHeight = SizedConfig.blockSizeVertical;
    Chip chipAtPopular(int i) {
      if (i == 0) {
        return Chip(
          elevation: 5,
          backgroundColor: Colors.white70,
          shadowColor: Colors.black,
          label: AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText(
                'Bestseller',
                colors: colorizeColors,
                textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ],
            isRepeatingAnimation: true,
          ),
        ); //Chip,
      }
    }

    return ExpansionTile(
      subtitle: Text(
        widget.myCartList.popularItems.length.toString(),
        style: TextStyle(fontSize: 17.0, fontStyle: FontStyle.italic),
      ),
      title: Text(
        widget.foodName,
        style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
      ),
      leading: Image.asset("asset/images/popular.png"),
      children: [
        Container(
          color: Color(0xFF141313),
          height: screenHeight * 30,
          child: ListView.separated(
              itemCount: widget.myCartList.popularItems.length,
              shrinkWrap: true,
              separatorBuilder: (context, i) => new Divider(
                    height: 15.0,
                    color: Colors.white,
                  ),
              itemBuilder: (context, i) {
                return ListTile(
                  hoverColor: Colors.white,
                  leading: Image.asset(widget.myCartList.popularItems[i].image),
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.myCartList.popularItems[i].name,
                          style: TextStyle(
                              fontSize: screenWidth * 5,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: chipAtPopular(i) ?? Container(),
                      ),
                    ],
                  ),
                  subtitle: Consumer<MyCartList>(
                    builder: (context, mycartlist, child) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "\$ ${widget.myCartList.popularItems[i].price.toString()}",
                          style: TextStyle(fontSize: 18.0),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 3,
                            primary: Colors.red[300],
                            shadowColor: Colors.white,
                          ),
                          onPressed: () {
                            mycartlist.addToCart(
                              widget.myCartList.popularItems[i].name,
                              widget.myCartList.popularItems[i].price,
                              widget.myCartList.popularItems[i].image,
                            );
                          },
                          child: Text("add to cart"),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
