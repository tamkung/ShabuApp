import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shabu_app/screen/allTable.dart';
import 'package:shabu_app/screen/index.dart';
import 'package:shabu_app/screen/kitchen.dart';
import 'package:shabu_app/screen/login.dart';
import 'package:shabu_app/screen/menu.dart';
import 'package:shabu_app/screen/table.dart';

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
        //'Register': (context) => FirebaseRegister(),
        //'Dashboard': (context) => Dashboard(),
        //'Video': (context) => PackageVideo(),
        'Kitchen': (context) => Kitchen(),
        'MainMenu': (context) => MainMenu(),
        'Table': (context) => ETable(),
        'AllTable': (context) => AllTable(),
      },
      theme: ThemeData(
        primaryColor: pColor,
        secondaryHeaderColor: sColor,
      ),
    );
  }
}
