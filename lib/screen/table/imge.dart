import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:shabu_app/config/constant.dart';

class PackageImage extends StatefulWidget {
  const PackageImage({Key? key}) : super(key: key);

  @override
  _PackageImageState createState() => _PackageImageState();
}

class _PackageImageState extends State<PackageImage> {
  FirebaseStorage storage = FirebaseStorage.instance;
  var file;
  final picker = ImagePicker();
  File? imageFile;
  String? fileName;

  String? name;
  final formKey = GlobalKey<FormState>();

  ListResult? result;
  List<Reference>? allFiles;
  String? fileUrl;
  FullMetadata? fileMeta;

  //กำหนดค่าเริ่มต้นสำหรับการส่งข้อมูลไปที่ Realtime Firebase
  final dbfirebase = FirebaseDatabase.instance.reference().child('test');

  Future<void> createData() async {
    List<Map<String, dynamic>> files = [];

    result = await storage.ref('Image').list();
    allFiles = result!.items;

    await Future.forEach<Reference>(allFiles!, (file) async {
      fileUrl = await file.getDownloadURL();
      fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "uploaded_by": fileMeta!.customMetadata?['uploaded_by'] ?? 'Nobody',
        "description":
            fileMeta!.customMetadata?['description'] ?? 'No description'
      });
    });

    await dbfirebase.push().set({
      'tName': name,
      //'imgURL': fileUrl,
    }).then((value) {
      print("Success");
    }).catchError((onError) {
      print(onError.code);
      print(onError.message);
    });
  }

  Future<void> openCamera() async {
    PickedFile? pickedImage;
    try {
      pickedImage = await picker.getImage(source: ImageSource.camera);

      fileName = path.basename(pickedImage!.path);
      setState(() {
        file = File(pickedImage!.path);
      });
      imageFile = File(pickedImage.path);
    } catch (err) {
      print(err);
    }
  }

  Future<void> upload() async {
    try {
      // Uploading the selected image with some custom meta data
      await storage.ref('Image').child(fileName!).putFile(
            imageFile!,
            SettableMetadata(
              customMetadata: {
                'uploaded_by': 'A bad guy',
                'description': 'Some description...'
              },
            ),
          );

      // Refresh the UI
      TaskSnapshot snapshot =
          await storage.ref().child("Image/$fileName").putFile(file);
      if (snapshot.state == TaskState.success) {
        final String downloadUrl = await snapshot.ref.getDownloadURL();
        await dbfirebase.push().set({
          'tName': name,
          'imgURL': downloadUrl,
        }).then((value) {
          print("Success");
        }).catchError((onError) {
          print(onError.code);
          print(onError.message);
        });
        final snackBar = SnackBar(content: Text('Yay! Success'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print(fileName);
        print(imageFile);
        print(downloadUrl);
      } else {
        print('Error from image repo ${snapshot.state.toString()}');
        throw ('This file is not an image');
      }
    } on FirebaseException catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FirebaseAnimatedList(
        query: dbfirebase,
        itemBuilder: (context, snapshot, animation, index) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Image'),
              backgroundColor: pColor,
            ),
            body: Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.computer),
                          backgroundColor: pColor,
                        ),
                        title: Text('${snapshot.value['Food']}'),
                        subtitle: Row(
                          children: [
                            Text('ราคา : ' + '${snapshot.value['price']}'),
                            Text(' สถานะ : ' + '${snapshot.value['status']}'),
                          ],
                        ),
                        trailing: Column(
                          children: [
                            Expanded(
                              child: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  print('ลบข้อมูล');
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
                                  //updateData(snapshot.key!);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: file == null
                              ? Text('Not Found')
                              : Image.file(
                                  file,
                                  scale: 5,
                                ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        txtName(),
                        btnSubmit(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.camera),
              backgroundColor: pColor,
              onPressed: () {
                print('Open Camera');
                openCamera();
              },
            ),
          );
        },
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
          labelText: 'ชื่อเมนู :',
          icon: Icon(Icons.production_quantity_limits),
          hintText: 'Input your table name',
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

  Widget btnSubmit() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: pColor,
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            print(name);
            //createData();
            formKey.currentState!.reset();
            upload();
          }
        },
        child: Text('เพิ่ม'),
      );
}
