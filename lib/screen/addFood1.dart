import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shabu_app/config/constant.dart';

class AddFood1 extends StatefulWidget {
  const AddFood1({Key? key}) : super(key: key);

  @override
  _AddFood1State createState() => _AddFood1State();
}

class _AddFood1State extends State<AddFood1> {
  String? name, price, status;
  final formKey = GlobalKey<FormState>();

  //กำหนดค่าเริ่มต้นสำหรับการส่งข้อมูลไปที่ Realtime Firebase
  final dbfirebase = FirebaseDatabase.instance.reference().child('Store');

  Future<void> createData() async {
    await dbfirebase.push().set({
      'product': name,
      'price': price,
      'status': status,
    }).then((value) {
      print("Success");
    }).catchError((onError) {
      print(onError.code);
      print(onError.message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                txtName(),
                txtPrice(),
                txtStatus(),
                btnSubmit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget txtName() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 15, 15, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
          labelText: 'Product :',
          icon: Icon(Icons.production_quantity_limits),
          hintText: 'Input your product name',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณาป้อนข้อมูล';
          }
        },
        onSaved: (value) {
          name = value!.trim();
        },
      ),
    );
  }

  Widget txtPrice() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 15, 15, 10),
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
          labelText: 'Price :',
          icon: Icon(Icons.price_check),
          hintText: 'Input your product price',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณาป้อนข้อมูล';
          }
        },
        onSaved: (value) {
          price = value!.trim();
        },
      ),
    );
  }

  Widget txtStatus() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 15, 15, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
          labelText: 'Status :',
          icon: Icon(Icons.description),
          hintText: 'Input your product status',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณาป้อนข้อมูล';
          }
        },
        onSaved: (value) {
          status = value!.trim();
        },
      ),
    );
  }

  Widget btnSubmit() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: tColor,
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            print(name);
            print(price);
            print(status);
            createData();
            formKey.currentState!.reset();
          }
        },
        child: Text('Add'),
      );
}
