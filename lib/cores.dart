import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoresClass extends ChangeNotifier {
  late Color primaria;
  late Color secundaria;
  late Color terciaria;
  late Color terciaria_clara;
  late Color terciaria_escuro;
  late Color gray;
  int? corSelecionada = 1; // Padrão: Azul

  CoresClass() {
    CoresPadrao();
    CarregarCorSelecionada();
  }

  Future<void> CarregarCorSelecionada() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    corSelecionada = prefs.getInt('corSelecionada') ?? 1;
    AtualizarPaletaPorIndex(corSelecionada!);
    notifyListeners();
  }

  void setCorSelecionada(int? index) async {
    corSelecionada = index;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('corSelecionada', index!);
    notifyListeners();
  }

  void CoresPadrao() {
    primaria = const Color(0xFF2C2C2C);
    secundaria = const Color(0xFFEDEDED);
    terciaria = const Color(0xFF448AFF);
    terciaria_clara = const Color.fromARGB(255, 117, 167, 252);
    terciaria_escuro = const Color.fromARGB(255, 11, 46, 143);
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

  void AtualizarPaletaPorIndex(int index) {
    switch (index) {
      case 0:
        AtualizaPaleta(
          terciary: const Color(0xFFFF4081),
          terciary_clear: const Color.fromARGB(255, 233, 130, 164),
          terciary_dark: const Color.fromARGB(255, 163, 17, 71),
        );
        break;
      case 1:
        AtualizaPaleta(
          terciary: const Color(0xFF448AFF),
          terciary_clear: const Color.fromARGB(255, 117, 167, 252),
          terciary_dark: const Color.fromARGB(255, 11, 46, 143),
        );
        break;
      case 2:
        AtualizaPaleta(
          terciary: const Color.fromARGB(255, 6, 165, 72),
          terciary_clear: const Color.fromARGB(255, 80, 206, 133),
          terciary_dark: const Color.fromARGB(255, 6, 112, 31),
        );
        break;
      case 3:
        AtualizaPaleta(
          terciary: const Color.fromARGB(255, 216, 17, 17),
          terciary_clear: const Color.fromARGB(255, 221, 107, 107),
          terciary_dark: const Color.fromARGB(255, 165, 7, 7),
        );
        break;
      case 4:
        AtualizaPaleta(
          terciary: const Color(0xFF7C4DFF),
          terciary_clear: const Color.fromARGB(255, 150, 123, 224),
          terciary_dark: const Color.fromARGB(255, 84, 3, 199),
        );
        break;
      default:
        break;
    }
  }
}
