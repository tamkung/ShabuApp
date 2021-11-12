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
      "asset/image/pro12.jpg",
    ),
    MenuR(
      "Avis",
      126,
      "asset/image/pro11.jpg",
    ),
    MenuR(
      "Avis",
      126,
      "asset/image/pro13.jpg",
    ),
    MenuR(
      "Avis",
      126,
      "asset/image/pro14.jpg",
    ),
    MenuR(
      "Avis",
      126,
      "asset/image/pro15.jpg",
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
      "ซุปใส/ซุปน้ำดำ",
      174,
      "asset/image/water.jpg",
    ),
    MenuRecom(
      "ซุปหมู/ซุปต้มยำ",
      126,
      "asset/image/water1.jpg",
    ),
    MenuRecom(
      "ชุปน้ำดำ/ซุปข้น",
      126,
      "asset/image/water3.jpg",
    ),
    MenuRecom(
      "เซ็ทน้ำจิ้ม1",
      126,
      "asset/image/water5.jpg",
    ),
    MenuRecom(
      "เซ็ทน้ำจิ้ม2",
      126,
      "asset/image/water4.jpg",
    ),
    MenuRecom(
      "สันคอหมูสไลด์",
      126,
      "asset/image/mo.jpg",
    ),
    MenuRecom(
      "สามชั้นสไลด์",
      126,
      "asset/image/mo1.jpg",
    ),
    MenuRecom(
      "กุ้งแม่น้ำ",
      126,
      "asset/image/kung.jpg",
    ),
    MenuRecom(
      "ซูชิ",
      126,
      "asset/image/shushi.jpg",
    ),
    MenuRecom(
      "ชุดเปิด",
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
