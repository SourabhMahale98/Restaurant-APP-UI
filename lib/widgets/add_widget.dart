import 'package:flutter/material.dart';
import 'package:restra_app/data/my_cart_list.dart';

class AddWidget extends StatefulWidget {
  final int i;
  const AddWidget({this.i});

  @override
  _AddWidgetState createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  final mycartlist = MyCartList();
  @override
  Widget build(BuildContext context) {
    // int i = (widget.i == 0) ? 0 : widget.i;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              mycartlist.removeFromCart(
                mycartlist.cardList[widget.i].name,
              );
            },
            child: Icon(Icons.remove),
          ),
          Text(
            mycartlist.cardList[widget.i].quantity.toString(),
            style: TextStyle(fontSize: 20),
          ),
          TextButton(
            onPressed: () {
              mycartlist.addToCart(
                mycartlist.cardList[widget.i].name,
                mycartlist.cardList[widget.i].price,
                mycartlist.cardList[widget.i].image,
              );
            },
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
