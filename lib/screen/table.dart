import 'package:flutter/material.dart';
import 'package:shabu_app/config/constant.dart';

class ETable extends StatefulWidget {
  const ETable({Key? key}) : super(key: key);

  @override
  _ETableState createState() => _ETableState();
}

class _ETableState extends State<ETable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "สั่งอาหาร",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
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
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: sColor,
                    padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                    //shape: StadiumBorder(),
                  ),
                  child: Text(
                    'โต๊ะที่ : 1',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: pColor,
                    ),
                  ),
                  onPressed: () {
                    //Navigator.pushNamed(context, 'Login');
                  },
                ),
                SizedBox(
                  width: 100,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: sColor,
                    padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                    //shape: StadiumBorder(),
                  ),
                  child: Text(
                    'โต๊ะที่ : 2',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: pColor,
                    ),
                  ),
                  onPressed: () {
                    //Navigator.pushNamed(context, 'Login');
                  },
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: sColor,
                    padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                    //shape: StadiumBorder(),
                  ),
                  child: Text(
                    'โต๊ะที่ : 3',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: pColor,
                    ),
                  ),
                  onPressed: () {
                    //Navigator.pushNamed(context, 'Login');
                  },
                ),
                SizedBox(
                  width: 100,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: sColor,
                    padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                    //shape: StadiumBorder(),
                  ),
                  child: Text(
                    'โต๊ะที่ : 4',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: pColor,
                    ),
                  ),
                  onPressed: () {
                    //Navigator.pushNamed(context, 'Login');
                  },
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: sColor,
                    padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                    //shape: StadiumBorder(),
                  ),
                  child: Text(
                    'โต๊ะที่ : 5',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: pColor,
                    ),
                  ),
                  onPressed: () {
                    //Navigator.pushNamed(context, 'Login');
                  },
                ),
                SizedBox(
                  width: 100,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: sColor,
                    padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                    //shape: StadiumBorder(),
                  ),
                  child: Text(
                    'โต๊ะที่ : 6',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: pColor,
                    ),
                  ),
                  onPressed: () {
                    //Navigator.pushNamed(context, 'Login');
                  },
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: sColor,
                    padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                    //shape: StadiumBorder(),
                  ),
                  child: Text(
                    'โต๊ะที่ : 7',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: pColor,
                    ),
                  ),
                  onPressed: () {
                    //Navigator.pushNamed(context, 'Login');
                  },
                ),
                SizedBox(
                  width: 100,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: sColor,
                    padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                    //shape: StadiumBorder(),
                  ),
                  child: Text(
                    'โต๊ะที่ : 8',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: pColor,
                    ),
                  ),
                  onPressed: () {
                    //Navigator.pushNamed(context, 'Login');
                  },
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: sColor,
                    padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                    //shape: StadiumBorder(),
                  ),
                  child: Text(
                    'โต๊ะที่ : 9',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: pColor,
                    ),
                  ),
                  onPressed: () {
                    //Navigator.pushNamed(context, 'Login');
                  },
                ),
                SizedBox(
                  width: 100,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: sColor,
                    padding: EdgeInsets.fromLTRB(40, 50, 40, 50),
                    //shape: StadiumBorder(),
                  ),
                  child: Text(
                    'โต๊ะที่ : 10',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: pColor,
                    ),
                  ),
                  onPressed: () {
                    //Navigator.pushNamed(context, 'Login');
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
