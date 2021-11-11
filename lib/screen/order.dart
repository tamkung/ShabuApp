import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:shabu_app/config/constant.dart';

class Order extends StatefulWidget {
  final String tableName;
  const Order({required this.tableName}) : super();

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  String? tName, imgURL, amonth;
  Future<void> orderN() async {
    var db = FirebaseDatabase.instance.reference().child("Food");
    db.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      //print(values.toString());
      values.forEach((k, v) async {
        //print(k);
        tName = v["tName"];
        imgURL = v["imgURL"];
        amonth = v["amonth"];
        print(v["tName"]);
        print(v["imgURL"]);
        print(v["amonth"]);
      });
    });
  }

  var dbfirebase;
  Future<void> getData() async {
    dbfirebase = FirebaseDatabase.instance
        .reference()
        .child('Order')
        .child(widget.tableName);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getData();
      orderN();
    });
    return Flexible(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.tableName,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/image/bg1.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 12,
                child: FirebaseAnimatedList(
                  query: dbfirebase,
                  itemBuilder: (context, snapshot, animation, index) {
                    return Container(
                      height: 80,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Card(
                          elevation: 5,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 29,
                              backgroundImage:
                                  NetworkImage('${snapshot.value['imgURL']}'),
                            ),
                            title: Text(
                              '${snapshot.value['tName']}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            //subtitle: Text('เมนู : ' + '${snapshot.value['tName']}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'จำนวน',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(snapshot.value['amonth'].toString()),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: sColor,
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        //shape: StadiumBorder(),
                      ),
                      child: Text(
                        'แก้ไข',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: pColor,
                        ),
                      ),
                      onPressed: () {
                        //orderN();
                      },
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: sColor,
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        //shape: StadiumBorder(),
                      ),
                      child: Text(
                        'ยกเลิก',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: pColor,
                        ),
                      ),
                      onPressed: () {
                        _showMyDialog();
                        //Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'ยืนยันการยกเลิก',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  'คุณแน่ใจใช่ไหมที่จะยกเลิกรายการอาหาร',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'ยืนยัน',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                print('Confirmed');
                dbfirebase.remove();
                Navigator.of(context).pop();
                Navigator.pushNamed(context, 'ETable', arguments: []);
              },
            ),
            TextButton(
              child: Text(
                'ยกเลิก',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
