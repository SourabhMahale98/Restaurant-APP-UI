import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restra_app/data/my_cart_list.dart';
import 'package:restra_app/sizedconfig.dart';

class ExpansionWidget extends StatefulWidget {
  final List snapshot;
  final String foodName;
  const ExpansionWidget({this.snapshot, this.foodName});

  @override
  _ExpansionWidgetState createState() => _ExpansionWidgetState();
}

class _ExpansionWidgetState extends State<ExpansionWidget> {
  @override
  Widget build(BuildContext context) {
    SizedConfig().init(context);
    double screenWidth = SizedConfig.blockSizeHorizontal;
    double screenHeight = SizedConfig.blockSizeVertical;
    return ExpansionTile(
      subtitle: Text(
        widget.snapshot.length.toString(),
        style: TextStyle(fontSize: 17.0, fontStyle: FontStyle.italic),
      ),
      title: Text(
        widget.foodName,
        style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
      ),
      leading:
          Image.asset("asset/images/${widget.foodName.toLowerCase()}2.jpg"),
      children: [
        Container(
          color: Color(0xFF141313),
          height: screenHeight * 30,
          child: ListView.separated(
              itemCount: widget.snapshot.length,
              shrinkWrap: true,
              separatorBuilder: (context, i) => new Divider(
                    height: 15.0,
                    color: Colors.white,
                  ),
              itemBuilder: (context, i) {
                return ListTile(
                  hoverColor: Colors.white,
                  leading: Image.asset(
                      "asset/images/${widget.foodName.toLowerCase()}${i + 1}.jpg"),
                  title: Text(
                    widget.snapshot[i].name,
                    style: TextStyle(
                        fontSize: screenWidth * 5, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Consumer<MyCartList>(
                    builder: (context, mycartlist, child) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "\$ ${widget.snapshot[i].price.toString()}",
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
                              widget.snapshot[i].name,
                              widget.snapshot[i].price,
                              widget.snapshot[i].image,
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
