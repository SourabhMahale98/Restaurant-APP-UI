import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:restra_app/data/my_cart_list.dart';
import 'package:restra_app/sizedconfig.dart';
import 'package:restra_app/widgets/empty_cart_widget.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    SizedConfig().init(context);
    double screenWidth = SizedConfig.blockSizeHorizontal;
    double screenHeight = SizedConfig.blockSizeVertical;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Icon(Icons.shopping_cart_sharp)),
                Text(
                  "  My Cart",
                  style: TextStyle(
                    fontSize: screenWidth * 6,
                    fontWeight: FontWeight.bold,
                  ),
                  // mycartlist.totalPrice.toString(),
                ),
              ],
            )),
        body: Consumer<MyCartList>(
          builder: (context, mycartlist, child) => SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: screenHeight * 6,
                ),
                Container(
                  height: screenHeight * 50,
                  child: (mycartlist.totalPrice == 0)
                      ? EmptyCartWidget()
                      : ListView.separated(
                          separatorBuilder: (context, i) => new Divider(
                            height: 15.0,
                            color: Colors.white,
                          ),
                          itemCount: mycartlist.cardList.length == 0
                              ? 0
                              : mycartlist.cardList.length,
                          itemBuilder: (context, i) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Image.asset(
                                    mycartlist.cardList[i].image,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    mycartlist.cardList[i].name.toString(),
                                    style: TextStyle(fontSize: screenWidth * 6),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    mycartlist.cardList[i].price.toString(),
                                    style: TextStyle(
                                      fontSize: screenWidth * 4,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            mycartlist.removeFromCart(
                                              mycartlist.cardList[i].name,
                                            );
                                          },
                                          child: Icon(Icons.remove),
                                        ),
                                        Text(
                                          mycartlist.cardList[i].quantity
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: screenWidth * 5),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            mycartlist.addToCart(
                                              mycartlist.cardList[i].name,
                                              mycartlist.cardList[i].price,
                                              mycartlist.cardList[i].image,
                                            );
                                          },
                                          child: Icon(Icons.add),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                ),
                SizedBox(
                  height: screenHeight * 7,
                ),
                Text(
                  "Total Amount : \$${mycartlist.totalPrice.toString()}",
                  style: TextStyle(
                    fontSize: screenWidth * 6,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 2,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 3, right: screenWidth * 3),
                  child: InkWell(
                    onTap: () {
                      mycartlist.saveToPopular();
                      Fluttertoast.showToast(
                        msg: "Order Placed",
                        backgroundColor: Colors.red,
                        // fontSize: 25
                        // gravity: ToastGravity.TOP,
                        // textColor: Colors.pink
                      );
                      mycartlist.removeAllFromCart();
                    },
                    splashColor: Colors.blue,
                    child: Container(
                      height: screenHeight * 6,
                      width: SizedConfig.screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Place your Order",
                          style: TextStyle(
                            fontSize: screenWidth * 5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
