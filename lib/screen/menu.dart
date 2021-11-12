import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shabu_app/config/constant.dart';
import 'package:shabu_app/model/data.dart';
import 'package:shabu_app/backend/menulist.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  List<MenuR> menu = getMenuList();
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
                  height: size.height * 0.03,
                  width: size.width,
                ),
                Image.asset(
                  "asset/image/logo.png",
                  width: size.width * 0.35,
                  //height: size.height * 0.4,
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "เมนูแนะนำ",
                            //textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[200],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 380,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: buildMenus(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      icon: Icon(
                        Icons.add_box,
                        color: pColor,
                        size: 32,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: sColor,
                        padding: EdgeInsets.fromLTRB(39, 19, 39, 19),
                        shape: StadiumBorder(),
                      ),
                      label: Text(
                        'เพิ่มเมนูอาหาร',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: pColor,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'AddFood');
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.07,
                    ),
                    ElevatedButton.icon(
                      icon: Icon(
                        Icons.edit,
                        color: pColor,
                        size: 32,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: sColor,
                        padding: EdgeInsets.fromLTRB(26, 20, 26, 20),
                        shape: StadiumBorder(),
                      ),
                      label: Text(
                        'แก้ไขเมนูอาหาร',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: pColor,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'Food');
                      },
                    ),
                  ],
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
                ElevatedButton.icon(
                  icon: Icon(
                    Icons.kitchen,
                    color: pColor,
                    size: 32,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: sColor,
                    padding: EdgeInsets.fromLTRB(70, 20, 70, 20),
                    shape: StadiumBorder(),
                  ),
                  label: Text(
                    'ห้องครัว',
                    style: TextStyle(
                      fontSize: 34,
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

  List<Widget> buildMenus() {
    List<Widget> list = [];
    for (var i = 0; i < menu.length; i++) {
      list.add(buildMenu(menu[i], i));
    }
    return list;
  }
}
