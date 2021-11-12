import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shabu_app/screen/addFood.dart';
import 'package:shabu_app/screen/allTable.dart';
import 'package:shabu_app/screen/food.dart';
import 'package:shabu_app/screen/index.dart';
import 'package:shabu_app/screen/kitchen.dart';
import 'package:shabu_app/screen/login.dart';
import 'package:shabu_app/screen/menu.dart';
import 'package:shabu_app/screen/table.dart';
import 'package:shabu_app/screen/test.dart';

import 'config/constant.dart';

Future<void> main() async {
  //เปิด Connection Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Index(),
      routes: {
        'Index': (context) => Index(),
        'Login': (context) => Login(),
        //'EditFood': (context) => EditFood(),
        'AddFood': (context) => AddFood(),
        'Test': (context) => HomePage(),
        'Kitchen': (context) => Kitchen(),
        'MainMenu': (context) => MainMenu(),
        'ETable': (context) => ETable(),
        'AllTable': (context) => AllTable(),
        'Food': (context) => Food(),
        //'TableMenu': (context) => TableMenu(),
      },
      theme: ThemeData(
        primaryColor: pColor,
        secondaryHeaderColor: sColor,
      ),
    );
  }
}
