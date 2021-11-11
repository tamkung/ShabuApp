import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shabu_app/config/constant.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    print('True');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "หน้าหลัก",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            iconSize: 32,
            onPressed: () {
              logout();
              Navigator.of(context).pop();
              Navigator.pushNamed(context, 'Index', arguments: []);
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/image/bg1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.05,
                  width: size.width,
                ),
                Image.asset(
                  "asset/image/logo.png",
                  width: size.width * 0.4,
                  //height: size.height * 0.4,
                ),
                SizedBox(
                  height: size.height * 0.07,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: sColor,
                    padding: EdgeInsets.fromLTRB(47, 20, 47, 20),
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    'เพิ่มเมนูอาหาร',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: pColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'AddFood');
                  },
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: sColor,
                    padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    'แก้ไขเมนูอาหาร',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: pColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'Food');
                  },
                ),
                /*
                SizedBox(
                  height: size.height * 0.03,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: sColor,
                    padding: EdgeInsets.fromLTRB(145, 20, 145, 20),
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    'โต๊ะ',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: pColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'AllTable');
                  },
                ),*/
                SizedBox(
                  height: size.height * 0.03,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: sColor,
                    padding: EdgeInsets.fromLTRB(105, 20, 105, 20),
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    'ห้องครัว',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: pColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'Kitchen');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
