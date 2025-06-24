import 'package:flutter/material.dart';
import 'package:ordem_de_servico/app/src/models/usuario_model.dart';
import 'package:ordem_de_servico/app/src/repository/usuario_repository.dart';

class GestaoUsuariosController extends ChangeNotifier{
  final repositorio = UsuarioRepository();
  List<Usuario> allUsers = [];
  List<Usuario> filteredUsers = [];

  GestaoUsuariosController(){
    allUsers = repositorio.all;
    filteredUsers = repositorio.filtered;
  }

  void filtrarUsuarios(String textSearch){
    filteredUsers = allUsers.where((usuario){
      return usuario.usuario.toLowerCase().contains(textSearch.toLowerCase()) ||
            usuario.nome.toLowerCase().contains(textSearch.toLowerCase()) ||
            usuario.id_usuario.toString().contains(textSearch);
    }).toList();
    notifyListeners();
  }
}