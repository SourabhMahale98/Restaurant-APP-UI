

import 'dart:convert';

Food foodFromJson(String str) => Food.fromJson(json.decode(str));

String foodToJson(Food data) => json.encode(data.toJson());

class Food {
  Food({
    this.salad,
    this.soup,
    this.sweet,
  });

  List<Salad> salad;
  List<Salad> soup;
  List<Salad> sweet;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        salad: List<Salad>.from(json["salad"].map((x) => Salad.fromJson(x))),
        soup: List<Salad>.from(json["soup"].map((x) => Salad.fromJson(x))),
        sweet: List<Salad>.from(json["sweet"].map((x) => Salad.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "salad": List<dynamic>.from(salad.map((x) => x.toJson())),
        "soup": List<dynamic>.from(soup.map((x) => x.toJson())),
        "sweet": List<dynamic>.from(sweet.map((x) => x.toJson())),
      };
}

class Salad {
  Salad({
    this.name,
    this.price,
    this.image,
  });

  String name;
  int price;
  String image;

  factory Salad.fromJson(Map<String, dynamic> json) => Salad(
        name: json["name"],
        price: json["price"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "image": image,
      };
}
