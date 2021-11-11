import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shabu_app/config/constant.dart';
import 'package:shabu_app/screen/tableMenu.dart';

class ETable extends StatefulWidget {
  const ETable({Key? key}) : super(key: key);

  @override
  _ETableState createState() => _ETableState();
}

class _ETableState extends State<ETable> {
  final dbfirebase = FirebaseDatabase.instance.reference().child('Table');
  //Function สำหรับแก้ไขข้อมูล
  Future<void> updateData(String key) async {
    try {
      dbfirebase
          .child(key)
          .update({
            'status': "ขายแล้ว",
          })
          .then((value) => print('Success'))
          .catchError((onError) {
            print(onError.code);
            print(onError.message);
          });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Scaffold(
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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/image/bg1.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: FirebaseAnimatedList(
            query: dbfirebase,
            itemBuilder: (context, snapshot, animation, index) {
              return Container(
                child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Card(
                    //color: Colors.white.withOpacity(0.7),
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.table_chart),
                        backgroundColor: pColor,
                      ),
                      title: Text(
                        '${snapshot.value['tName']}',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () => _order('${snapshot.value['tName']}'),
                    ),
                  ),
                ),
              );
            },
          ),
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
