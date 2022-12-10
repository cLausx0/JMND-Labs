import 'package:flutter/material.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkclr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryclr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
Color darkHeaderClr = Colors.grey[800]!;

class Themes {
  static final light = ThemeData(
    primaryColor: primaryclr,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}
