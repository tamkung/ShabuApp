import 'package:flutter/material.dart';
import 'package:shabu_app/config/constant.dart';
import 'package:shabu_app/screen/addFood.dart';
import 'package:shabu_app/screen/addFood1.dart';
import 'package:shabu_app/screen/editFood.dart';

class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);

  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Store'),
          backgroundColor: pColor,
        ),
        body: TabBarView(
          children: [
            AddFood1(),
            EditFood(),
          ],
        ),
        bottomNavigationBar: Container(
          child: TabBar(
            indicatorColor: Colors.red,
            labelColor: tColor,
            tabs: [
              Tab(
                //text: 'Add Data',
                icon: Icon(Icons.add),
              ),
              Tab(
                //text: 'View Data',
                icon: Icon(Icons.view_agenda),
              ),
            ],
          ),
          color: Colors.amber[400],
        ),
      ),
    );
  }
}
