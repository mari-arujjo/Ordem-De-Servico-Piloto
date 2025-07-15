import 'package:flutter/material.dart';

class CoresClass extends ChangeNotifier {
  late Color primaria;
  late Color secundaria;
  late Color terciaria;
  late Color terciaria_clara;
  late Color terciaria_escuro;
  late Color gray;
  int? corSelecionada = 0; //padrão: ROSA

  CoresClass() {
    CoresPadrao();
  }

  void setCorSelecionada(int? index){
    corSelecionada = index;
    notifyListeners();
  }

  void CoresPadrao() {
    primaria = const Color(0xFF2C2C2C);
    secundaria = const Color(0xFFEDEDED);
    terciaria = const Color(0xFFFF4081);
    terciaria_clara = const Color.fromARGB(255, 233, 130, 164);
    terciaria_escuro = const Color.fromARGB(255, 143, 40, 74);
    gray = const Color(0xFF818181);
  }

  void AtualizaPaleta({
    required Color terciary,
    required Color terciary_clear,
    required Color terciary_dark,
  }) {
    terciaria = terciary;
    terciaria_clara = terciary_clear;
    terciaria_escuro = terciary_dark;
    notifyListeners();
  }
}
