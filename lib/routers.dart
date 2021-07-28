import 'package:flutter/material.dart';
import 'package:restra_app/main.dart';
import 'package:restra_app/screens/cart.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => MainPage());

      case "/cart":
        return MaterialPageRoute(builder: (_) => Cart());

      default:
        return MaterialPageRoute(builder: (_) => MainPage());
    }
  }
}
