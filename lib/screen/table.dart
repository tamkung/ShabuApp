import 'package:flutter/material.dart';
import 'package:shabu_app/config/constant.dart';
import 'package:shabu_app/screen/tableMenu.dart';

class ETable extends StatefulWidget {
  const ETable({Key? key}) : super(key: key);

  @override
  _ETableState createState() => _ETableState();
}

class _ETableState extends State<ETable> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "เลือกโต๊ะ",
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
            SizedBox(height: size.height * 0.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.black.withOpacity(0.5),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Color(0xFF8B4513),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                    child: Column(
                      children: [
                        Image.asset(
                          "asset/image/table2.png",
                          height: 100,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          'โต๊ะที่ : 1',
                          style: TextStyle(
                            fontSize: 42,
                            color: sColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    _order('โต๊ะที่ : 1');
                  },
                ),
                SizedBox(
                  width: 100,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.black.withOpacity(0.5),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Color(0xFF8B4513),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                    child: Column(
                      children: [
                        Image.asset(
                          "asset/image/table2.png",
                          height: 100,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          'โต๊ะที่ : 2',
                          style: TextStyle(
                            fontSize: 42,
                            color: sColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    _order('โต๊ะที่ : 2');
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
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.black.withOpacity(0.5),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Color(0xFF8B4513),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                    child: Column(
                      children: [
                        Image.asset(
                          "asset/image/table4.png",
                          height: 100,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          'โต๊ะที่ : 3',
                          style: TextStyle(
                            fontSize: 42,
                            //fontWeight: FontWeight.bold,
                            color: sColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    _order('โต๊ะที่ : 3');
                  },
                ),
                SizedBox(
                  width: 100,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.black.withOpacity(0.5),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Color(0xFF8B4513),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                    child: Column(
                      children: [
                        Image.asset(
                          "asset/image/table4.png",
                          height: 100,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          'โต๊ะที่ : 4',
                          style: TextStyle(
                            fontSize: 42,
                            //fontWeight: FontWeight.bold,
                            color: sColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    _order('โต๊ะที่ : 4');
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
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.black.withOpacity(0.5),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Color(0xFF8B4513),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                    child: Column(
                      children: [
                        Image.asset(
                          "asset/image/table4.png",
                          height: 100,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          'โต๊ะที่ : 5',
                          style: TextStyle(
                            fontSize: 42,
                            //fontWeight: FontWeight.bold,
                            color: sColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    _order('โต๊ะที่ : 5');
                  },
                ),
                SizedBox(
                  width: 100,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.black.withOpacity(0.5),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Color(0xFF8B4513),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                    child: Column(
                      children: [
                        Image.asset(
                          "asset/image/table4.png",
                          height: 100,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          'โต๊ะที่ : 6',
                          style: TextStyle(
                            fontSize: 42,
                            //fontWeight: FontWeight.bold,
                            color: sColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    _order('โต๊ะที่ : 6');
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
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.black.withOpacity(0.5),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Color(0xFF8B4513),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                    child: Column(
                      children: [
                        Image.asset(
                          "asset/image/table8.png",
                          height: 100,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          'โต๊ะที่ : 7',
                          style: TextStyle(
                            fontSize: 42,
                            //fontWeight: FontWeight.bold,
                            color: sColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    _order('โต๊ะที่ : 7');
                  },
                ),
                SizedBox(
                  width: 100,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.black.withOpacity(0.5),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Color(0xFF8B4513),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                    child: Column(
                      children: [
                        Image.asset(
                          "asset/image/table8.png",
                          height: 100,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          'โต๊ะที่ : 8',
                          style: TextStyle(
                            fontSize: 42,
                            //fontWeight: FontWeight.bold,
                            color: sColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    _order('โต๊ะที่ : 8');
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
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.black.withOpacity(0.5),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Color(0xFF8B4513),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                    child: Column(
                      children: [
                        Image.asset(
                          "asset/image/table8.png",
                          height: 100,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          'โต๊ะที่ : 9',
                          style: TextStyle(
                            fontSize: 42,
                            //fontWeight: FontWeight.bold,
                            color: sColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    _order('โต๊ะที่ : 9');
                  },
                ),
                SizedBox(
                  width: 100,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.black.withOpacity(0.5),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Color(0xFF8B4513),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 10),
                    child: Column(
                      children: [
                        Image.asset(
                          "asset/image/table8.png",
                          height: 100,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          'โต๊ะที่ : 10',
                          style: TextStyle(
                            fontSize: 42,
                            //fontWeight: FontWeight.bold,
                            color: sColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    _order('โต๊ะที่ : 10');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future _order(String tableName) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TableMenu(
          tableName: tableName,
        ),
      ),
    );
    print(tableName);
  }
}
