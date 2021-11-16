import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shabu_app/config/constant.dart';
import 'package:shabu_app/model/data.dart';
import 'package:shabu_app/backend/recommend.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Index extends StatelessWidget {
  _launchURLBrowser() async {
    const url = 'https://www.youtube.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _openFacebook() async {
    const url = 'https://www.facebook.com/shabuzab/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _phoneCall() async {
    const url = 'tel:0994563144';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _sendMail() async {
    const url = 'mailto:theradach.s@gmail.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  var ct;
  //const Index({Key? key}) : super(key: key);
  List<Recom> recom = getRecomList();
  @override
  Widget build(BuildContext context) {
    ct = context;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: pColor,
              ),
              child: Text(
                'ทำไว้เล่นๆ',
                style: TextStyle(
                  color: sColor,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.youtube_searched_for),
              title: const Text('เปิด Youtube'),
              onTap: () {
                _launchURLBrowser();
              },
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: const Text('Sing In Google'),
              onTap: () {
                Navigator.pushNamed(context, 'SignInG');
              },
            ),
            ListTile(
              leading: Icon(Icons.menu),
              title: const Text('Menu'),
              onTap: () {
                Navigator.pushNamed(context, 'MainMenu');
              },
            ),
          ],
        ),
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
                  width: size.width * 0.42,
                  //height: size.height * 0.4,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "โปรโมชั่น",
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
                      height: 490,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: buildRecoms(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: sColor,
                        padding: EdgeInsets.fromLTRB(70, 20, 70, 20),
                        shape: StadiumBorder(),
                      ),
                      child: Text(
                        'สั่งอาหาร',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: pColor,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'ETable');
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.08,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: sColor,
                        padding: EdgeInsets.fromLTRB(62, 20, 62, 20),
                        shape: StadiumBorder(),
                      ),
                      child: Text(
                        'เข้าสู่ระบบ',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: pColor,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'Login');
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => _openFacebook(),
                      icon: Icon(Icons.facebook),
                      color: sColor,
                      iconSize: 50,
                    ),
                    IconButton(
                      onPressed: () => _phoneCall(),
                      icon: Icon(Icons.call),
                      color: sColor,
                      iconSize: 50,
                    ),
                    IconButton(
                      onPressed: () => _sendMail(),
                      icon: Icon(Icons.email),
                      color: sColor,
                      iconSize: 50,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Widget> buildRecoms() {
    List<Widget> list = [];
    for (var i = 0; i < recom.length; i++) {
      list.add(buildRecom(recom[i], i, ct));
    }
    return list;
  }
}
