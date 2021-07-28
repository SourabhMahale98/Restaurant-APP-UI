import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restra_app/data/my_cart_list.dart';
import 'package:restra_app/routers.dart';
import 'package:restra_app/screens/cart.dart';
import 'package:restra_app/screens/main_manu.dart';
import 'package:restra_app/sizedconfig.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyCartList>(
      create: (_) => MyCartList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        initialRoute: "/",
        onGenerateRoute: Routers.generateRoute,
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndexed = 0;

  final List<Widget> _children = [MainMenu(), Cart()];
  void ontabBar(int index) {
    setState(() {
      _currentIndexed = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizedConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white10,
      body: _children[_currentIndexed],
      bottomNavigationBar: ConvexAppBar(
        onTap: ontabBar,
        initialActiveIndex: _currentIndexed,
        activeColor: Colors.red,
        style: TabStyle.reactCircle,
        backgroundColor: Colors.black,
        items: [
          TabItem(icon: Icons.home, title: "Menu"),
          TabItem(icon: Icons.shopping_cart, title: "cart"),
        ],
      ),
    );
  }
}
