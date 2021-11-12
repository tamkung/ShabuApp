import 'package:flutter/material.dart';
import 'package:shabu_app/model/data.dart';

Widget buildMenuRecom(MenuRecom menuRecome, int index) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
    width: 250,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(menuRecome.image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          height: 170,
          width: 190,
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          menuRecome.name,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
        /*
        Text(
          dealer.offers.toString() + " offers",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),*/
      ],
    ),
  );
}
