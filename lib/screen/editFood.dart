import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:shabu_app/config/constant.dart';

class EditFood extends StatefulWidget {
  const EditFood({Key? key}) : super(key: key);

  @override
  _EditFoodState createState() => _EditFoodState();
}

class _EditFoodState extends State<EditFood> {
  //ประกาศตัวแปรอ้างอิงไปยัง Child ที่ต้องการ
  final dbfirebase = FirebaseDatabase.instance.reference().child('Food');
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
      child: FirebaseAnimatedList(
        query: dbfirebase,
        itemBuilder: (context, snapshot, animation, index) {
          return Container(
            height: 100,
            child: Padding(
              padding: EdgeInsets.all(3.0),
              child: Card(
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Image(
                      image: NetworkImage('${snapshot.value['imgURL']}'),
                    ),
                    //backgroundColor: pColor,
                  ),
                  title: Text('${snapshot.value['tName']}'),
                  subtitle: Row(
                    children: [
                      Text('เมนู : ' + '${snapshot.value['tName']}'),
                      //Text(' สถานะ : ' + '${snapshot.value['status']}'),
                    ],
                  ),
                  trailing: Column(
                    children: [
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            print('ลบข้อมูล');
                            print('${snapshot.value['imgURL']}');
                            dbfirebase.child(snapshot.key!).remove();
                          },
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            print('แก้ไขข้อมูล');
                            print(snapshot.key!);
                            updateData(snapshot.key!);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
