import 'package:flutter/material.dart';
import 'package:shabu_app/config/constant.dart';
import 'package:shabu_app/model/data.dart';
import 'package:shabu_app/backend/recommend.dart';

// ignore: must_be_immutable
class Index extends StatelessWidget {
  //const Index({Key? key}) : super(key: key);
  List<Recom> recom = getRecomList();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
      list.add(buildRecom(recom[i], i));
    }
    return list;
  }
}
