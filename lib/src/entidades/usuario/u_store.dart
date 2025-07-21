import 'package:flutter/cupertino.dart';
import 'package:ordem_de_servico/src/entidades/usuario/u_model.dart';
import 'package:ordem_de_servico/src/entidades/usuario/u_repositorio.dart';

class UsuarioStore extends ChangeNotifier{
  final UsuarioRepositorio repositorio;
  UsuarioStore({required this.repositorio});


  bool _isLoading = false;
  List<UsuarioModel> _usuario = [];
  List<UsuarioModel> _allUsuarios = [];
  String _erro = '';
  bool get isLoading => _isLoading;
  List<UsuarioModel> get usuario => _usuario;
  String get erro => _erro;
  

  Future getUsuarios() async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await repositorio.obterUsuarios();
      _allUsuarios = result;
      _usuario = result;
    } catch (e) {
      _erro = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  void filtrarUsuarios(String termo) {
    if (termo.isEmpty) {
      _usuario= _allUsuarios;
    } else {
      _usuario = _allUsuarios.where((user) {
        return user.nome.toLowerCase().contains(termo.toLowerCase()) ||
        user.usuario.toLowerCase().contains(termo.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
