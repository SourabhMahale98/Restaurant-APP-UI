import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restra_app/data/food_data.dart';
import 'package:restra_app/data/my_cart_list.dart';
import 'package:restra_app/sizedconfig.dart';
import 'package:restra_app/widgets/expansiontile.dart';
import 'package:restra_app/widgets/main_carousel.dart';
import 'package:restra_app/widgets/popular_expansion.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  Food foodList;
  String data;

  Future<Food> d() async {
    data = await DefaultAssetBundle.of(context).loadString("asset/food.json");
    return foodFromJson(data);
  }

  PopularExpansion popular(
      AsyncSnapshot<dynamic> snapshot, String foodName, MyCartList mycartlist) {
    if (mycartlist.popularItems.length != 0) {
      return PopularExpansion(
          myCartList: mycartlist, foodName: "Popular Items");
    }
  }

  @override
  Widget build(BuildContext context) {
    SizedConfig().init(context);
    double screenWidth = SizedConfig.blockSizeHorizontal;
    double screenHeight = SizedConfig.blockSizeVertical;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.fastfood_outlined,
              color: Colors.red,
            ),
            Text(
              "  Foody",
              style: TextStyle(
                fontSize: screenWidth * 6,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
          future: d(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              print(snapshot);
              return Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 30,
                    width: SizedConfig.screenWidth,
                    child: MainCarousel(),
                  ),
                  SizedBox(height: screenHeight * 3),
                  Consumer<MyCartList>(
                    builder: (context, mycartlist, child) =>
                        popular(snapshot, "Salad", mycartlist) ??
                        Container(height: 10),
                  ),
                  Divider(height: 6, color: Colors.white),
                  ExpansionWidget(
                      snapshot: snapshot.data.salad, foodName: "Salad"),
                  Divider(height: 6, color: Colors.white),
                  ExpansionWidget(
                      snapshot: snapshot.data.soup, foodName: "Soup"),
                  Divider(height: 6, color: Colors.white),
                  ExpansionWidget(
                      snapshot: snapshot.data.sweet, foodName: "Sweet"),
                  Divider(height: 6, color: Colors.white),
                  ExpansionWidget(
                      snapshot: snapshot.data.soup, foodName: "Soup"),
                  Divider(height: 6, color: Colors.white),
                  ExpansionWidget(
                      snapshot: snapshot.data.sweet, foodName: "Sweet"),
                ],
              ),
            );
          }),
    );
  }
}
// _buildExpandableContent(Food vehicle) {
//     List<Widget> columnContent = [];

//     for (String content in vehicle.contents)
//       columnContent.add(
//          ListTile(
//           title: new Text(content, style: new TextStyle(fontSize: 18.0),),
//           leading: new Icon(vehicle.icon),
//         ),
//       );

//     return columnContent;
//   }
// }