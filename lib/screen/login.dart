import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shabu_app/config/constant.dart';
import 'package:shabu_app/screen/menu.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email, password;
  final formKey = GlobalKey<FormState>();

  Future<void> checkUser() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        print('Success');
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => MainMenu());
        Navigator.of(context).pushAndRemoveUntil(
            materialPageRoute, (Route<dynamic> route) => false);
      }).catchError((onError) {
        print("Error : " + onError.toString());
        if (onError.toString() ==
            "[firebase_auth/unknown] Given String is empty or null") {
          print("true");
        } else {
          _onBasicAlertPressed(context);
          final snackBar =
              SnackBar(content: Text('ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "เข้าสู่ระบบ",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/image/bg1.png"),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  "asset/image/logo.png",
                  width: size.width * 0.42,
                  //height: size.height * 0.4,
                ),
                /* Container(
                  width: size.width * 0.9,
                  height: size.height * 0.1,
                  //  color: sColor,
                  alignment: Alignment.center,
                  child: Text(
                    'เข้าสู่ระบบ',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),*/
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white.withOpacity(0.8),
                  ),
                  //color: pColor,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Container(
                        width: size.width * 0.9,
                        //height: size.height * 0.12,
                        // color: Colors.black87,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ชื่อผู้ใช้ : ',
                              style: TextStyle(
                                fontSize: 38,
                                color: pColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.04,
                            ),
                            Container(
                              width: size.width * 0.55,
                              child: TextFormField(
                                style: TextStyle(
                                    fontSize: 28, color: Colors.white),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade700),
                                  filled: true,
                                  fillColor: Color(0xff161d27).withOpacity(0.9),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(color: sColor)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(color: sColor)),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    final snackBar = SnackBar(
                                        content: Text('กรุณาป้อนอีเมล'));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                },
                                onSaved: (value) {
                                  email = value!.trim();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Container(
                        width: size.width * 0.9,
                        //height: size.height * 0.10,
                        //color: Colors.black87,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'รหัสผ่าน : ',
                              style: TextStyle(
                                fontSize: 38,
                                color: pColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Container(
                              width: size.width * 0.55,
                              child: TextFormField(
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade700),
                                  filled: true,
                                  fillColor: Color(0xff161d27).withOpacity(0.9),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(color: sColor)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(color: sColor)),
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    final snackBar = SnackBar(
                                        content: Text('กรุณาป้อนรหัสผ่าน'));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                },
                                onSaved: (value) {
                                  password = value!.trim();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Container(
                        width: size.width * 0.9,
                        height: size.height * 0.12,
                        //  color: Colors.black87,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: ElevatedButton.icon(
                                icon: Icon(
                                  Icons.login,
                                  color: pColor,
                                  size: 32,
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: sColor,
                                  padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                                  shape: StadiumBorder(),
                                  side: BorderSide(
                                    color: pColor,
                                  ),
                                ),
                                label: Text(
                                  'เข้าสู่ระบบ',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: pColor,
                                  ),
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    checkUser();
                                  }
                                  print(email);
                                  print(password);

                                  //  Navigator.pushNamed(context, 'MainMenu');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onBasicAlertPressed(context) {
    Alert(
      style: AlertStyle(
        backgroundColor: sColor,
        titleStyle: TextStyle(fontSize: 32),
      ),
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          color: pColor,
          onPressed: () => Navigator.pop(context),
          width: 120,
        ),
      ],
      context: context,
      title: "ไม่พบข้อมูล",
      //desc: "Flutter is more awesome with RFlutter Alert.",
    ).show();
  }
}
