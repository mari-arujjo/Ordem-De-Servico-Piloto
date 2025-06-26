import 'package:flutter/material.dart';
import 'package:ordem_de_servico/app/src/API/api.dart';
import 'package:ordem_de_servico/app/src/models/usuario_model.dart';

class GestaoUsuariosController extends ChangeNotifier{
  final api = Api();
  List<Usuario> allUsers = [];
  List<Usuario> filteredUsers = [];

  GestaoUsuariosController(){
    obterTodosUsuarios();
  }

  void filtrarUsuarios(String textSearch){
    filteredUsers = allUsers.where((usuario){
      return usuario.usuario.toLowerCase().contains(textSearch.toLowerCase()) ||
            usuario.nome.toLowerCase().contains(textSearch.toLowerCase()) ||
            usuario.id_usuario.toString().contains(textSearch);
    }).toList();
    notifyListeners();
  }

  /// ---> END POINTS
  Future<void> obterTodosUsuarios() async {
    try {
      final response = await api.get('/api/usuario'); 
      debugPrint('Resposta da API: ${response.data}');
      final List<dynamic> dados = response.data;
      allUsers = dados.map((json) => Usuario.fromJson(json)).toList();
      filteredUsers = [...allUsers];
      notifyListeners();
    } 
    catch (e){
      debugPrint('Erro: $e');
    }
  }

  Future<String> obterUsuarioPorId() async {
    try{
      final response = await api.get('/api/usuarios/{id}');
      return response.data.toString();
    }
    catch (e){
      return 'Erro: $e';
    }
  }
}