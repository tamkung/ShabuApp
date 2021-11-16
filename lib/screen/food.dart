import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shabu_app/screen/editFood.dart';

class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);

  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  //ประกาศตัวแปรอ้างอิงไปยัง Child ที่ต้องการ
  final dbfirebase = FirebaseDatabase.instance.reference().child('Food');
  //Function สำหรับแก้ไขข้อมูล

  /*
  var img, nameE;
  Future loadData() async {
    await dbfirebase.once().then((DataSnapshot snapshot) {
      print('Data1 : ${snapshot.key}');
      print('Data2 : ${snapshot.value["tName"]}');
      print('Data3 : ${snapshot.value['imgURL']}');
      nameE = snapshot.value['tName'];
      img = snapshot.value['imgURL'];
    });
  }
*/

  Future<void> _delete(String ref) async {
    await FirebaseStorage.instance.refFromURL(ref).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "แก้ไขเมนูอาหาร",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          /*
          actions: [
            IconButton(onPressed: () => loadData(), icon: Icon(Icons.ac_unit))
          ],*/
          centerTitle: true,
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
                //height: 100,
                child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Card(
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
                      subtitle: Row(
                        children: [],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _edit(
                                snapshot.key,
                                '${snapshot.value['tName']}',
                                '${snapshot.value['imgURL']}',
                              );
                              //print(snapshot.key);
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              _showMyDialog(
                                snapshot.key,
                                '${snapshot.value['imgURL']}',
                              );
                              //dbfirebase.child(snapshot.key!).remove();
                            },
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
      ),
    );
  }

  Future<void> _showMyDialog(var key, imgurl) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'ยืนยันการลบ',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  'คุณแน่ใจใช่ไหมที่จะลบรายการอาหาร',
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
                _delete(imgurl);
                dbfirebase.child(key).remove();
                //print(key);
                Navigator.of(context).pop();
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

  Future _edit(dynamic foodKey, sendName, sendURL) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditFood(
          foodKey: foodKey,
          readName: sendName,
          readURL: sendURL,
        ),
      ),
    );
    print(foodKey);
  }
}
