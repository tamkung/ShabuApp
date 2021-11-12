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
      "ราคาโปรโมชั่น",
      174,
      "asset/image/price.jpg",
    ),
    Recom(
      "199-.",
      126,
      "asset/image/price2.jpg",
    ),
    Recom(
      "ติดตามโปรโมชั่น",
      126,
      "asset/image/promo.jpg",
    ),
    Recom(
      "สมัครสมาชิก",
      126,
      "asset/image/pro2.jpg",
    ),
    Recom(
      "รับฟรีน้ำดื่ม",
      126,
      "asset/image/pro3.jpg",
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
      "asset/image/recom1.jpg",
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
