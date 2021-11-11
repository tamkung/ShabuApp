import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:shabu_app/config/constant.dart';
import 'package:shabu_app/screen/comfirmOrder.dart';

class Kitchen extends StatefulWidget {
  const Kitchen({Key? key}) : super(key: key);

  @override
  _KitchenState createState() => _KitchenState();
}

class _KitchenState extends State<Kitchen> {
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    print('True');
  }

  var dbfirebase;
  Future<void> getData() async {
    dbfirebase = FirebaseDatabase.instance.reference().child('Order');
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getData();
      //orderN();
    });
    return Flexible(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "ห้องครัว",
            style: TextStyle(
              fontSize: 32,
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
                      //height: 120,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Card(
                          color: Colors.white.withOpacity(0.8),
                          elevation: 5,
                          child: ListTile(
                            onTap: () {
                              confirmO(snapshot.key.toString());
                            },
                            leading: CircleAvatar(child: Icon(Icons.food_bank)
                                //backgroundColor: pColor,
                                ),
                            title: Text(
                              '${snapshot.key}',
                              style: TextStyle(fontSize: 20),
                            ),
                            /*
                            subtitle: Row(
                              children: [
                                Column(
                                  children: [
                                    Text('${snapshot.key}'),
                                    Text(' สถานะ : ' +
                                        '${snapshot.value['status']}'),
                                    Text(' สถานะ : ' +
                                        '${snapshot.value['status']}'),
                                    Text(' สถานะ : ' +
                                        '${snapshot.value['status']}'),
                                    Text(' สถานะ : ' +
                                        '${snapshot.value['status']}'),
                                  ],
                                ),
                              ],
                            ),*/
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //if(dbfirebase.length)
                                Text(
                                  'จำนวน',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${snapshot.value.length}',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'รายการ',
                                  style: TextStyle(fontSize: 16),
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
            ],
          ),
        ),
      ),
    );
  }

  Future confirmO(String tableName) async {
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
/*
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ห้องครัว",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: pColor,
              ),
              child: Text(
                'เมนู',
                style: TextStyle(
                  fontSize: 36,
                  color: sColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'เพิ่มเมนูอาหาร',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Icon(
                Icons.food_bank,
                color: Colors.pink,
                size: 35,
              ),
              onTap: () {
                print('Video');
                Navigator.pushNamed(context, 'Video');
              },
            ),
            ListTile(
              title: Text(
                'แก้ไขเมนูอาหาร',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Icon(
                Icons.no_food,
                color: Colors.green,
                size: 30,
              ),
              onTap: () {
                print('Image');
                Navigator.pushNamed(context, 'Image');
              },
            ),
            ListTile(
              title: Text(
                'โต๊ะ',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Icon(
                Icons.table_chart,
                color: Colors.blue,
                size: 30,
              ),
              onTap: () {
                print('Table');
                Navigator.pushNamed(context, 'AllTable');
              },
            ),
            ListTile(
              title: Text(
                'ห้องครัว',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Icon(
                Icons.kitchen,
                color: Colors.yellow[700],
                size: 30,
              ),
              onTap: () {
                print('Store');
                Navigator.pushNamed(context, 'Store');
              },
            ),
            ListTile(
              title: Text(
                'ออกจากระบบ',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Icon(
                Icons.logout,
                color: Colors.red[900],
                size: 30,
              ),
              onTap: () {
                logout();
                Navigator.of(context).pop();
                Navigator.pushNamed(context, 'Index', arguments: []);
              },
            ),
          ],
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
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
*/