import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
    ),
    borderRadius: BorderRadius.all(Radius.circular(30.0)));

const hintTextStyle = TextStyle(
    color: Colors.white54,
    fontWeight: FontWeight.w100,
    fontStyle: FontStyle.italic);

const nightColor = Color(0xff262431);
const dayColor = Color(0xffFDAE1C);
const dayShadowColor = Color(0xff200003);

TextStyle bigTitleStyle =
    GoogleFonts.raleway(fontSize: 48, color: Colors.white);

List<BoxShadow> backBtnBoxShadow = [
  BoxShadow(
    color: Color(0xffc3c3c3),
    spreadRadius: 15,
    blurRadius: 30,
    offset: Offset(-20, 20), // changes position of shadow
  ),
  BoxShadow(
    color: Color(0xfffdfdfd),
    spreadRadius: 15,
    blurRadius: 30,
    offset: Offset(20, -20), // changes position of shadow
  )
];
