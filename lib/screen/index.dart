import 'package:flutter/material.dart';
import 'package:shabu_app/config/constant.dart';

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

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
                  width: size.width * 0.45,
                  //height: size.height * 0.4,
                ),
                SizedBox(
                  height: size.height * 0.13,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: sColor,
                    padding: EdgeInsets.fromLTRB(115, 20, 115, 20),
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
                    Navigator.pushNamed(context, 'AllTable');
                  },
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: sColor,
                    padding: EdgeInsets.fromLTRB(110, 20, 110, 20),
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
            )
          ],
        ),
      ),
    );
  }
}
