import 'package:flutter/material.dart';

class ColorsClass {
  late final Color primaryColor;
  late final Color secondaryColor;
  late final Color terciaryColor;
  late final Color transparente;

  ColorsClass(){
    primaryColor = const Color(0xFF2C2C2C);
    secondaryColor = const Color(0xFFEDEDED);
    terciaryColor = const Color(0xFFFF4081);
    transparente = Colors.transparent;
  }
}