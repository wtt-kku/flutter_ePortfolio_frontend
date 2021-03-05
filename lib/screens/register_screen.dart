//! Basic & libraries
import 'package:flutter/material.dart';

//! Constant & Style
import 'package:eportfolio/constants/style_constant.dart';
import 'package:eportfolio/constants/color_constant.dart';

class GoogleButton extends StatelessWidget {
  GoogleButton({this.char});
  String char;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
                offset: Offset(12, 11),
                blurRadius: 26,
                color: Color(0xFFAAAA).withOpacity(0.1))
          ]),
      child: Center(
        child: Text(
          char,
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0962FF),
          ),
        ),
      ),
    );
  }
}

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var scrWidth = MediaQuery.of(context).size.width;
    var srcHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 40, top: 40),
                  child: Text(
                    'ลงทะเบียน',
                    style: mRegisterTitleStyle,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 40, top: 0),
                  child: Text(
                    'ลงทะเบียนด้วย',
                    style: mRegisterWithSocialStyle,
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Container(
              //   margin: EdgeInsets.only(left: 38),
              //   child: Row(
              //     children: [
              //       GoogleButton(
              //         char: 'G',
              //       ),
              //       SizedBox(width: 30),
              //       GoogleButton(
              //         char: 'f',
              //       ),
              //     ],
              //   ),
              // ),
            ])
          ],
        ),
      ),
    );
  }
}
