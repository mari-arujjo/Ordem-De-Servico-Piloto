import 'dart:convert';
import 'package:ordem_de_servico/src/API/http_client.dart';
import 'package:ordem_de_servico/src/usuario/u_model.dart';

abstract class IUsuarioRepository {
  Future<List<UsuarioModel>> obterUsuarios();
}

class UsuarioRepository implements IUsuarioRepository {
  final IHttpClient client;
  UsuarioRepository({required this.client});

  @override
  Future<List<UsuarioModel>> obterUsuarios() async {
    final response = await client.get(
      url: 'https://api-ordem-de-servico-tfyb.onrender.com/api/usuario',
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List;
      return body.map((item) => UsuarioModel.fromMap(item)).toList();
    } else if (response.statusCode == 404) {
      throw Exception('A URL não é válida');
    } else {
      throw Exception('pode sacrificar');
    }
  }

  Future<UsuarioModel> cadastrarUsuario(UsuarioModel user) async {
    final response = await client.post(
      url: 'https://api-ordem-de-servico-tfyb.onrender.com/api/usuario',
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toMap()),
    );

    try {
      //if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      print('Resposta do backend: $body');
      return UsuarioModel.fromMap(body);
      //}
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deletarUsuario(int id) async {
    final response = await client.delete(
      url: 'https://api-ordem-de-servico-tfyb.onrender.com/api/usuario/$id',
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      return;
    } else if (response.statusCode == 404) {
      throw Exception('Usuário não encontrado para exclusão');
    } else {
      throw Exception('Falha ao deletar usuário');
    }
  }
}
