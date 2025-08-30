import 'package:flutter/material.dart';
import 'package:ordem_pro/entidades/fornecedor/f_model.dart';
import 'package:ordem_pro/entidades/fornecedor/f_repositorio.dart';

class FornecedorStore extends ChangeNotifier {
  final FornecedorRepositorio repositorio;
  FornecedorStore({required this.repositorio});

  bool _isLoading = false;
  List<FornecedorModel> _fornecedor = [];
  List<FornecedorModel> _allFornecedores = [];
  String _erro = '';
  bool get isLoading => _isLoading;
  List<FornecedorModel> get fornecedor => _fornecedor;
  String get erro => _erro;

  Future getFornecedores() async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await repositorio.obterFornecedores();
      _allFornecedores = result;
      _fornecedor = result;
    } catch (e) {
      _erro = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

  void filtrarFornecedores(String termo) {
    if (termo.isEmpty) {
      _fornecedor = _allFornecedores;
    } else {
      final cnpjLimpo = termo.replaceAll(
        RegExp(r'[^0-9a-zA-Z]'),
        '',
      ); //remove caracteres especiais do termo digitado

      _fornecedor =
          _allFornecedores.where((forn) {
            final cnpj = forn.cnpj_fornecedor.replaceAll(
              RegExp(r'[^0-9]'),
              '',
            ); //limpa o CNPJ do fornecedor

            return forn.razao_social.toLowerCase().contains(
                  termo.toLowerCase(),
                ) ||
                cnpj.contains(
                  cnpjLimpo,
                ); //verifica se o CNPJ sem máscara contém o termo limpo
          }).toList();
    }
    notifyListeners();
  }
}
