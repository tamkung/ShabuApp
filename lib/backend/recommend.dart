import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shabu_app/config/constant.dart';
import 'package:shabu_app/model/data.dart';

Widget buildRecom(Recom recome, int index, dynamic context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
    width: 350,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () => _onBasicAlertPressed(context, recome.image),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(recome.image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            height: 400,
            width: 300,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          recome.name,
          style: TextStyle(
            fontSize: 30,
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

_onBasicAlertPressed(context, dynamic img) {
  Alert(
    style: AlertStyle(
      backgroundColor: sColor,
      titleStyle: TextStyle(fontSize: 32),
    ),
    image: Image.asset(img),
    context: context,
    buttons: [
      DialogButton(
        child: Text(
          "OK",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        color: pColor,
        onPressed: () => Navigator.pop(context),
        width: 120,
      ),
    ],
    //desc: "Flutter is more awesome with RFlutter Alert.",
  ).show();
}
