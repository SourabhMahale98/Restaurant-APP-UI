import 'package:flutter/material.dart';

class MyCartList extends ChangeNotifier {
  List<MyCart> cardList = [];
  int totalPrice = 0;
  List<MyCart> popularItems = [];
  saveToPopular() {
    popularItems = List.from(cardList);
    popularItems.sort((a, b) => b.quantity.compareTo(a.quantity));
    notifyListeners();
  }

  addToCart(String name, int price, String image) {
    bool isFound = false;
    if (cardList.length != 0) {
      for (int i = 0; i < cardList.length; i++) {
        print(cardList[i].image);
        if (name == cardList[i].name) {
          isFound = true;
          cardList[i].quantity++;
          priceOfProduct();
          notifyListeners();
          break;
        }
      }
    }
    if (!isFound) {
      cardList.add(MyCart(name: name, price: price, image: image));
      priceOfProduct();

      notifyListeners();
    }
  }

  removeFromCart(String name) {
    if (cardList.length != 0) {
      for (int i = 0; i < cardList.length; i++) {
        if (cardList[i].name == name) {
          if (cardList[i].quantity == 1) {
            cardList.removeAt(i);
            priceOfProduct();

            notifyListeners();
            break;
          } else if (cardList[i].quantity > 1) {
            cardList[i].quantity--;
            priceOfProduct();

            notifyListeners();
            break;
          }
        }
      }
    }
  }

  removeAllFromCart() {
    if (cardList.length != 0) {
      cardList.clear();
      totalPrice = 0;
      notifyListeners();
    }
  }

  priceOfProduct() {
    int price = 0;
    for (int i = 0; i < cardList.length; i++) {
      price += cardList[i].price * cardList[i].quantity;
      print("totalprice $totalPrice $i ${cardList.length} ");
    }
    totalPrice = price;
    notifyListeners();
  }
}

class MyCart {
  final String name;
  final int price;
  int quantity;
  final String image;

  MyCart({
    this.name,
    this.price,
    this.quantity = 1,
    this.image,
  });
}
