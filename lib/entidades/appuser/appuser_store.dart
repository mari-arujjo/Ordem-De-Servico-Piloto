import 'package:flutter/material.dart';
import 'package:ordem_de_servico/entidades/appuser/appuser_model.dart';
import 'package:ordem_de_servico/entidades/appuser/appuser_repositorio.dart';

class AppUserStore extends ChangeNotifier{
  final AppUserRepositorio repositorio;
  AppUserStore({required this.repositorio});

  bool _isLoading = false;
  AppUserModel? _userLogado;
  List<AppUserModel> _appUser = [];
  List<AppUserModel> _allAppUser = [];
  String _erro = '';

  bool get isLoading => _isLoading;
  AppUserModel? get userLogado => _userLogado;
  List<AppUserModel> get appUser => _appUser;
  String get erro => _erro;
  

  Future <bool> login (String username, String senha) async {
    _isLoading = true;
    notifyListeners();
    try {
      final user = await repositorio.login(username, senha);
      _userLogado = user;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e){
      _erro = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future getUsuarios() async {
    _isLoading = true;
    notifyListeners();
    try{
      final result = await repositorio.obterUsuarios();
      _allAppUser = result;
      _appUser = result;
    } catch (e){
      _erro = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

  void filtrarAppUser (String termo){
    if(termo.isEmpty){
      _appUser = _allAppUser;
    } else {
      _appUser = _allAppUser.where((a) {
        return a.nome.toLowerCase().contains(termo.toLowerCase()) 
        || a.username.toLowerCase().contains(termo.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}