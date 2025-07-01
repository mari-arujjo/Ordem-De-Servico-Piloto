import 'package:flutter/widgets.dart';
import 'package:ordem_de_servico/src/API/http_client.dart';
import 'package:ordem_de_servico/src/usuario/u_model.dart';
import 'package:ordem_de_servico/src/usuario/u_repository.dart';

class UsuarioController extends ChangeNotifier{

  final UsuarioRepository rep = UsuarioRepository(client: HttpClient());
  List<UsuarioModel> allUsers = [];
  List<UsuarioModel> filteredUsers = [];

  UsuarioController(){
    carregarUsarios();
  }
  
  Future<void> carregarUsarios() async{
    allUsers = await rep.obterUsuarios();
    filteredUsers = [...allUsers];
  }

  void filtrarUsuarios(String txt){
    filteredUsers = allUsers.where((usuario){
      return usuario.usuario.toLowerCase().contains(txt.toLowerCase()) ||
            usuario.nome.toLowerCase().contains(txt.toLowerCase()) ||
            usuario.id_usuario.toString().contains(txt);
    }).toList();
    notifyListeners();
  }

}