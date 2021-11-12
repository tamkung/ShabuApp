import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shabu_app/config/constant.dart';
import 'package:shabu_app/screen/menu.dart';

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
        print(onError);
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
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.1,
                  color: sColor,
                  alignment: Alignment.center,
                  child: Text(
                    'เข้าสู่ระบบ',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.12,
                  color: Colors.black87,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ชื่อผู้ใช้ : ',
                        style: TextStyle(
                          fontSize: 38,
                          color: sColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        color: sColor,
                        width: size.width * 0.55,
                        child: TextFormField(
                          style: TextStyle(
                            color: pColor,
                            fontSize: 30,
                          ),
                          decoration: InputDecoration(
                            hintText: "Email",
                            hoverColor: pColor,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'กรุณาป้อนอีเมล';
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
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.12,
                  color: Colors.black87,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'รหัสผ่าน : ',
                        style: TextStyle(
                          fontSize: 38,
                          color: sColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        color: sColor,
                        width: size.width * 0.55,
                        child: TextFormField(
                          style: TextStyle(
                            color: pColor,
                            fontSize: 30,
                          ),
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'กรุณาป้อนรหัสผ่าน';
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
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.12,
                  color: Colors.black87,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: sColor,
                            padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                            shape: StadiumBorder(),
                          ),
                          child: Text(
                            'ยืนยัน',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: pColor,
                            ),
                          ),
                          onPressed: () {
                            /*if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              checkUser();
                            }
                            print(email);
                            print(password);
*/
                            Navigator.pushNamed(context, 'MainMenu');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
