//! Basic & libraries
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

//! Model
import 'package:eportfolio/models/carousel_model.dart';

//! Constant & Style
import 'package:eportfolio/constants/color_constant.dart';
import 'package:eportfolio/constants/style_constant.dart';

//! Screen
import 'package:eportfolio/widgets/bottom_navigation_eportfolio.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //? ตั้งค่า AppBar
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        title: SvgPicture.asset('assets/svg/logo.svg'),
        elevation: 0,
      ),

      //? ตั้งค่าสีพื้นหลัง
      backgroundColor: mBackgroundColor,

      //?ตั้งค่า เมนูด้านล่าง
      bottomNavigationBar: BottomNavigationEportfolio(),

      //?เนื้อหา
      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            //? ส่วนแแนะนำ
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 24),
              child: Text(
                "ยินดีต้อนรับคุณ, วิธาน วงษาบุตร",
                style: mTitleStyle,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 16, right: 16),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    child: Swiper(
                      onIndexChanged: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                      autoplay: true,
                      layout: SwiperLayout.DEFAULT,
                      itemCount: carousels.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                            decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(carousels[index].image),
                            fit: BoxFit.cover,
                          ),
                        ));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: map<Widget>(carousels, (index, image) {
                          return Container(
                              alignment: Alignment.centerLeft,
                              height: 6,
                              width: 6,
                              margin: EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _current == index
                                      ? mBlueColor
                                      : mGreyColor));
                        }),
                      ),
                      Text("ดูเพิ่มเติม", style: mMoreDetailStyle)
                    ],
                  ),
                ],
              ),
            ),
            //? หมวดหมู่งาน
            Padding(
              padding: EdgeInsets.only(left: 16, top: 24),
              child: Text(
                "หมวดหมู่งาน",
                style: mTitleStyle,
              ),
            ),
            Container(
                height: 144,
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/icons/programming.svg',
                                fit: BoxFit.contain,
                                height: 40,
                                width: 40,
                                // allowDrawingOutsideViewBox: true,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "นักพัฒนา",
                                        style: mServiceTitleStyle,
                                      ),
                                      Text(
                                        "Developer",
                                        style: mServiceSubtitleStyle,
                                      )
                                    ]),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/icons/target.svg',
                                fit: BoxFit.contain,
                                height: 40,
                                width: 40,
                                // allowDrawingOutsideViewBox: true,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "การตลาด",
                                        style: mServiceTitleStyle,
                                      ),
                                      Text(
                                        "Marketing",
                                        style: mServiceSubtitleStyle,
                                      )
                                    ]),
                              )
                            ],
                          ),
                        ),
                      )
                    ]),
                    SizedBox(height: 6),
                    Row(children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/icons/designer.svg',
                                fit: BoxFit.contain,
                                height: 40,
                                width: 40,
                                // allowDrawingOutsideViewBox: true,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "นักออกแบบ",
                                        style: mServiceTitleStyle,
                                      ),
                                      Text(
                                        "Designer",
                                        style: mServiceSubtitleStyle,
                                      )
                                    ]),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/icons/accountant.svg',
                                fit: BoxFit.contain,
                                height: 40,
                                width: 40,
                                // allowDrawingOutsideViewBox: true,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "บัญชี",
                                        style: mServiceTitleStyle,
                                      ),
                                      Text(
                                        "Accounting",
                                        style: mServiceSubtitleStyle,
                                      )
                                    ]),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ],
                )),

            //?งานด่วน
            Padding(
              padding: EdgeInsets.only(left: 16, top: 24),
              child: Text(
                "ด่วน! กำลังเปิดรับสมัคร",
                style: mTitleStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
