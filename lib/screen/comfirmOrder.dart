import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:shabu_app/config/constant.dart';

class ConfirmOrder extends StatefulWidget {
  final String tableName;
  const ConfirmOrder({required this.tableName}) : super();

  @override
  _ConfirmOrderState createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
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
        body: Column(
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
                            child: Image(
                              image:
                                  NetworkImage('${snapshot.value['imgURL']}'),
                            ),
                            //backgroundColor: pColor,
                          ),
                          title: Text(
                            '${snapshot.value['tName']}',
                            style: TextStyle(fontSize: 20),
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
                      'ส่งอาหาร',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: pColor,
                      ),
                    ),
                    onPressed: () {
                      dbfirebase.remove();
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, 'Kitchen', arguments: []);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future delete(String tableName) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ConfirmOrder(
          tableName: tableName,
        ),
      ),
    );
    print(tableName);
  }
}
