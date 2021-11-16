import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:shabu_app/backend/menuRecom.dart';
import 'package:shabu_app/config/constant.dart';
import 'package:shabu_app/model/data.dart';
import 'package:shabu_app/screen/order.dart';

class TableMenu extends StatefulWidget {
  final String tableName;
  const TableMenu({required this.tableName}) : super();

  @override
  _TableMenuState createState() => _TableMenuState();
}

class _TableMenuState extends State<TableMenu> {
  List<MenuRecom> menuRecom = getMenuRecomList();
  //ประกาศตัวแปรอ้างอิงไปยัง Child ที่ต้องการ
  final dbfirebase = FirebaseDatabase.instance.reference().child('Food');
  //Function สำหรับแก้ไขข้อมูล
  Future<void> updateData(String key, int amonth, String op) async {
    try {
      if (op == "add") {
        dbfirebase.child(key).update({
          'amonth': amonth + 1,
        }).then((value) {
          print('Success');
        }).catchError((onError) {
          print(onError.code);
          print(onError.message);
        });
      } else if (op == "sub") {
        dbfirebase.child(key).update({
          'amonth': amonth - 1,
        }).then((value) {
          print('Success');
        }).catchError((onError) {
          print(onError.code);
          print(onError.message);
        });
      }
      /*
      if (amonth <= 0) {
        dbfirebase.child(key).update({
          'amonth': 0,
        }).then((value) {
          print('Success');
        }).catchError((onError) {
          print(onError.code);
          print(onError.message);
        });
      }
      if (amonth >= 20) {
        dbfirebase.child(key).update({
          'amonth': 20,
        }).then((value) {
          print('Success');
        }).catchError((onError) {
          print(onError.code);
          print(onError.message);
        });
      }
      */
    } catch (e) {
      print(e);
    }
  }

  Future<void> orderN() async {
    var db = FirebaseDatabase.instance.reference().child("Food");
    db.once().then((DataSnapshot snapshot) async {
      Map<dynamic, dynamic> values = snapshot.value;
      //print(values.toString());
      values.forEach((k, v) async {
        print(k);
        //print(v["amonth"]);
        if (v["amonth"] > 0) {
          await FirebaseDatabase.instance
              .reference()
              .child('Order')
              .child(widget.tableName)
              .push()
              .set({
            'tableN': widget.tableName,
            'tName': v["tName"],
            'imgURL': v["imgURL"],
            'amonth': v["amonth"],
          }).then((value) {
            print("Update Success");
            dbfirebase.child(k).update({
              'amonth': 0,
            }).then((value) {
              print('Success');
            }).catchError((onError) {
              print(onError.code);
              print(onError.message);
            });
          }).catchError((onError) {
            print(onError.code);
            print(onError.message);
          });
          //
        }
      });
      await _order(widget.tableName);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                    height: 250,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: buildMenuRecoms(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Expanded(
                flex: 12,
                child: FirebaseAnimatedList(
                  query: dbfirebase,
                  itemBuilder: (context, snapshot, animation, index) {
                    return Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Card(
                          margin: EdgeInsets.all(5),
                          elevation: 5,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 29,
                              backgroundImage:
                                  NetworkImage('${snapshot.value['imgURL']}'),
                              //backgroundColor: pColor,
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
                                IconButton(
                                  onPressed: () {
                                    updateData(snapshot.key!,
                                        snapshot.value['amonth'], "sub");
                                  },
                                  icon: Icon(Icons.do_disturb_on),
                                ),
                                Text(snapshot.value['amonth'].toString()),
                                IconButton(
                                  onPressed: () {
                                    updateData(snapshot.key!,
                                        snapshot.value['amonth'], "add");
                                  },
                                  icon: Icon(Icons.add_circle),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: sColor,
                        padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                        //shape: StadiumBorder(),
                      ),
                      child: Text(
                        'สั่ง',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: pColor,
                        ),
                      ),
                      onPressed: () {
                        orderN();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildMenuRecoms() {
    List<Widget> list = [];
    for (var i = 0; i < menuRecom.length; i++) {
      list.add(buildMenuRecom(menuRecom[i], i));
    }
    return list;
  }

  Future _order(String tableName) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Order(
          tableName: tableName,
        ),
      ),
    );
    print(tableName);
  }
}
