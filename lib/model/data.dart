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
  String name;
  int offers;
  String image;

  MenuR(this.name, this.offers, this.image);
}

List<MenuR> getMenuList() {
  return <MenuR>[
    MenuR(
      "ชุดเปิด",
      174,
      "asset/image/bg1.png",
    ),
    MenuR(
      "Avis",
      126,
      "asset/image/logo.png",
    ),
    MenuR(
      "Avis",
      126,
      "asset/image/recom1.jpg",
    ),
    MenuR(
      "Avis",
      126,
      "asset/image/recom1.jpg",
    ),
    MenuR(
      "Avis",
      126,
      "asset/image/recom1.jpg",
    ),
  ];
}

class Recom {
  String name;
  int offers;
  String image;

  Recom(this.name, this.offers, this.image);
}

List<Recom> getRecomList() {
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

class MenuRecom {
  String name;
  int offers;
  String image;

  MenuRecom(this.name, this.offers, this.image);
}

List<MenuRecom> getMenuRecomList() {
  return <MenuRecom>[
    MenuRecom(
      "ชุดเปิด",
      174,
      "asset/image/logo.png",
    ),
    MenuRecom(
      "Avis",
      126,
      "asset/image/logo.png",
    ),
    MenuRecom(
      "Avis",
      126,
      "asset/image/logo.png",
    ),
    MenuRecom(
      "Avis",
      126,
      "asset/image/logo.png",
    ),
    MenuRecom(
      "Avis",
      126,
      "asset/image/logo.png",
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
