import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eportfolio/constants/color_constant.dart';

var mTitleStyle = GoogleFonts.kanit(
  fontWeight: FontWeight.w600,
  color: mTitleColor,
  fontSize: 16,
);

var mMoreDetailStyle = GoogleFonts.kanit(
    fontWeight: FontWeight.w700, color: mBlueColor, fontSize: 12);

var mServiceTitleStyle = GoogleFonts.kanit(
    fontWeight: FontWeight.w500, color: mTitleColor, fontSize: 12);
var mServiceSubtitleStyle = GoogleFonts.kanit(
    fontWeight: FontWeight.w400, color: mSubtitleColor, fontSize: 10);

var mPopularTitleStyle = GoogleFonts.kanit(
    fontWeight: FontWeight.w700, color: mCardTitleColor, fontSize: 16);
var mPopularSubtitleStyle = GoogleFonts.kanit(
    fontWeight: FontWeight.w500, color: mCardSubtitleColor, fontSize: 10);

var mHintTextStyle = TextStyle(
  color: Colors.white54,
);

var mLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

var mBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
