import 'package:flutter/material.dart';

class ColorsClass {
  late final Color primaryColor;
  late final Color secondaryColor;
  late final Color terciaryColor;
  late final Color quarternaryColor;
  late final Color gray;

  ColorsClass(){
    primaryColor = const Color(0xFF2C2C2C);
    secondaryColor = const Color(0xFFEDEDED);
    terciaryColor = const Color(0xFFFF4081);
    quarternaryColor = const Color.fromARGB(255, 240, 166, 191);
    gray = const Color(0xFF818181);
  }
}