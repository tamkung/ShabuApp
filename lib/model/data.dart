import 'package:flutter/material.dart';

class NavigationItem {
  IconData iconData;

  NavigationItem(this.iconData);
}

List<NavigationItem> getNavigationItemList() {
  return <NavigationItem>[
    NavigationItem(Icons.home),
    NavigationItem(Icons.calendar_today),
    NavigationItem(Icons.notifications),
    NavigationItem(Icons.person),
  ];
}

class MenuR {
  String brand;
  String model;
  double price;
  String condition;
  List<String> images;

  MenuR(this.brand, this.model, this.price, this.condition, this.images);
}

List<MenuR> getCarList() {
  return <MenuR>[
    MenuR(
      "Land Rover",
      "Discovery",
      2580,
      "Weekly",
      [
        "assets/images/land_rover_0.png",
        "assets/images/land_rover_1.png",
        "assets/images/land_rover_2.png",
      ],
    ),
    MenuR(
      "Alfa Romeo",
      "C4",
      3580,
      "Monthly",
      [
        "assets/images/alfa_romeo_c4_0.png",
      ],
    ),
    MenuR(
      "Nissan",
      "GTR",
      1100,
      "Daily",
      [
        "assets/images/nissan_gtr_0.png",
        "assets/images/nissan_gtr_1.png",
        "assets/images/nissan_gtr_2.png",
        "assets/images/nissan_gtr_3.png",
      ],
    ),
    MenuR(
      "Acura",
      "MDX 2020",
      2200,
      "Monthly",
      [
        "assets/images/acura_0.png",
        "assets/images/acura_1.png",
        "assets/images/acura_2.png",
      ],
    ),
    MenuR(
      "Chevrolet",
      "Camaro",
      3400,
      "Weekly",
      [
        "assets/images/camaro_0.png",
        "assets/images/camaro_1.png",
        "assets/images/camaro_2.png",
      ],
    ),
    MenuR(
      "Ferrari",
      "Spider 488",
      4200,
      "Weekly",
      [
        "assets/images/ferrari_spider_488_0.png",
        "assets/images/ferrari_spider_488_1.png",
        "assets/images/ferrari_spider_488_2.png",
        "assets/images/ferrari_spider_488_3.png",
        "assets/images/ferrari_spider_488_4.png",
      ],
    ),
    MenuR(
      "Ford",
      "Focus",
      2300,
      "Weekly",
      [
        "assets/images/ford_0.png",
        "assets/images/ford_1.png",
      ],
    ),
    MenuR(
      "Fiat",
      "500x",
      1450,
      "Weekly",
      [
        "assets/images/fiat_0.png",
        "assets/images/fiat_1.png",
      ],
    ),
    MenuR(
      "Honda",
      "Civic",
      900,
      "Daily",
      [
        "assets/images/honda_0.png",
      ],
    ),
    MenuR(
      "Citroen",
      "Picasso",
      1200,
      "Monthly",
      [
        "assets/images/citroen_0.png",
        "assets/images/citroen_1.png",
        "assets/images/citroen_2.png",
      ],
    ),
  ];
}

class Recom {
  String name;
  int offers;
  String image;

  Recom(this.name, this.offers, this.image);
}

List<Recom> getDealerList() {
  return <Recom>[
    Recom(
      "ชุดเปิด",
      174,
      "asset/image/recom1.jpg",
    ),
    Recom(
      "Avis",
      126,
      "asset/image/recom1.jpg",
    ),
    Recom(
      "Avis",
      126,
      "asset/image/recom1.jpg",
    ),
    Recom(
      "Avis",
      126,
      "asset/image/recom1.jpg",
    ),
    Recom(
      "Avis",
      126,
      "asset/image/recom1.jpg",
    ),
  ];
}

class Filter {
  String name;

  Filter(this.name);
}

List<Filter> getFilterList() {
  return <Filter>[
    Filter("Best Match"),
    Filter("Highest Price"),
    Filter("Lowest Price"),
  ];
}
