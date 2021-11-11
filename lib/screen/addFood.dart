import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:shabu_app/config/constant.dart';

class AddFood extends StatefulWidget {
  const AddFood({Key? key}) : super(key: key);

  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  FirebaseStorage storage = FirebaseStorage.instance;
  String? name, imgURL;
  final formKey = GlobalKey<FormState>();
  var file;
  final picker = ImagePicker();
  File? imageFile;
  String? fileName;

  ListResult? result;
  List<Reference>? allFiles;
  String? fileUrl;
  FullMetadata? fileMeta;

  //กำหนดค่าเริ่มต้นสำหรับการส่งข้อมูลไปที่ Realtime Firebase
  final dbfirebase = FirebaseDatabase.instance.reference().child('Food');

  // Select and image from the gallery or take a picture with the camera
  // Then upload to Firebase Storage
  Future<void> _upload(String inputSource) async {
    PickedFile? pickedImage;
    try {
      pickedImage = await picker.getImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery);

      fileName = path.basename(pickedImage!.path);
      setState(() {
        file = File(pickedImage!.path);
      });
      imageFile = File(pickedImage.path);
    } catch (err) {
      print(err);
    }
  }

  Future<void> createData() async {
    try {
      /*
      await storage.ref('Image').child(fileName!).putFile(
            imageFile!,
            SettableMetadata(
              customMetadata: {
                'uploaded_by': 'Admin',
                'description': 'Some description...'
              },
            ),
          );
      */
      TaskSnapshot snapshot =
          await storage.ref().child("Image/$fileName").putFile(file);
      if (snapshot.state == TaskState.success) {
        final String downloadUrl = await snapshot.ref.getDownloadURL();
        await dbfirebase.push().set({
          'tName': name,
          'imgURL': downloadUrl,
          'amonth': 0,
        }).then((value) {
          print("Success");
        }).catchError((onError) {
          print(onError.code);
          print(onError.message);
        });
        final snackBar = SnackBar(content: Text('เพิ่มสำเร็จ'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print(fileName);
        print(imageFile);
        print(downloadUrl);
        setState(() {});
      } else {
        print('Error from image repo ${snapshot.state.toString()}');
        throw ('This file is not an image');
      }
    } on FirebaseException catch (error) {
      print(error);
    }
  }

  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref('Image').list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      imgURL = fileUrl;
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
        "description":
            fileMeta.customMetadata?['description'] ?? 'No description'
      });
    });

    return files;
  }

  Future<void> _delete(String ref) async {
    await storage.ref(ref).delete();
    // Rebuild the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "เพิ่มเมนูอาหาร",
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
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () => _upload('camera'),
                            icon: Icon(Icons.camera),
                            label: Text('camera'),
                            style: ElevatedButton.styleFrom(
                              primary: pColor,
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () => _upload('gallery'),
                            icon: Icon(Icons.library_add),
                            label: Text('Gallery'),
                            style: ElevatedButton.styleFrom(
                              primary: pColor,
                            ),
                          ),
                        ],
                      ),
                      txtName(),
                      Center(
                        child: file == null
                            ? Text('Not Found')
                            : Image.file(
                                file,
                                scale: 5,
                              ),
                      ),
                      btnSubmit(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
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
                                radius: 28,
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
          icon: Icon(Icons.food_bank),
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
            createData();
            formKey.currentState!.reset();
            file = null;
          }
        },
        child: Text('เพิ่ม'),
      );
}
