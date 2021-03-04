//! Basic & libraries
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/services.dart';
import 'dart:convert' show json, base64, ascii;
import 'package:http/http.dart' as http;
//! Constant & Style
import 'package:eportfolio/constants/style_constant.dart';
import 'package:eportfolio/constants/color_constant.dart';

//! Screen
import 'package:eportfolio/screens/home_screen.dart';

const SERVER_IP = 'http://192.168.1.44';
final storage = new FlutterSecureStorage();

//?Process เข้าสู่ระบบ
Future<String> loginProcess(String username, String password) async {
  var res = await http.post("$SERVER_IP/api/v1/user/userLogin",
      body: {"username": username, "password": password});
  if (res.statusCode == 200) {
    return res.body;
  } else {
    return null;
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _inputUser;
  String _inputPass;

  //?Dialog
  void displayDialog(BuildContext context, String title, String text) =>
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(text),
          actions: [
            new FlatButton(
              child: const Text("ตกลง"),
              onPressed: () => Navigator.pop(context, ""),
            ),
          ],
        ),
      );

  //?ช่องกรอก Username
  Widget _buildInputUser() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'ชื่อผู้ใช้',
          style: mLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: mBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            onChanged: (value) {
              setState(() {
                _inputUser = value;
              });
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Username',
              hintStyle: mHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

//?ช่องกรอก Password
  Widget _buildInputPass() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'รหัสผ่าน',
          style: mLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: mBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            onChanged: (value) {
              setState(() {
                _inputPass = value;
              });
            },
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Password',
              hintStyle: mHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonLogin() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          var username = _inputUser;
          var password = _inputPass;
          var token = await loginProcess(username, password);
          if (token != null) {
            var data = json.decode(token);

            if (data['resultCode'] == 401) {
              displayDialog(context, "เกิดข้อผิดพลาด",
                  "ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง");
            } else if (data['resultCode'] == 200) {
              await storage.write(key: "token", value: data['data']['token']);
              await storage.write(
                  key: "RefreshToken", value: data['data']['RefreshToken']);

              Map<String, String> allValues = await storage.readAll();
              // displayDialog(context, "เรียบร้อย", allValues.toString());
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => HomePage.fromBase64(token))
              //         );
            } else {
              displayDialog(context, "Error", " ");
            }

            // displayDialog(context, "เข้าสู่ระบบสำเร็จ", jwt);

            // storage.write(key: "jwt", value: jwt);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => HomePage.fromBase64(jwt)));

          } else {
            displayDialog(
                context, "เกิดข้อผิดพลาด", "ไม่สามารถเชื่อมต่อเซิฟเวอร์ได้");
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'เข้าสู่ระบบ',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildButtonRegister() {
    return GestureDetector(
      onTap: () => print('Sign Up Button Pressed'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'ยังไม่สมัครสมาชิก ',
              style: TextStyle(
                fontFamily: 'Prompt',
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'ลงทะเบียน',
              style: TextStyle(
                fontFamily: 'Prompt',
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonSkip() {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        )
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'ข้ามการเข้าสู่ระบบ',
              style: TextStyle(
                fontFamily: 'Prompt',
                color: mTitleColor,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: mBodyLoinScreen,
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'ePortfolio',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildInputUser(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildInputPass(),
                      _buildButtonLogin(),
                      _buildButtonRegister(),
                      SizedBox(height: 20.0),
                      _buildButtonSkip(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
