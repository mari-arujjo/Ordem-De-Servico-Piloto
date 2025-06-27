import 'dart:convert';
import 'package:ordem_de_servico/app/src/API/alerts.dart';
import 'package:ordem_de_servico/app/src/API/http_client.dart';
import 'package:ordem_de_servico/app/src/usuario/u_model.dart';

abstract class IUsuarioRepository{
  Future<List<UsuarioModel>> getUsuarios();
}

class UsuarioRepository implements IUsuarioRepository {

  final IHttpClient client;
  UsuarioRepository({required this.client});

  @override
  Future<List<UsuarioModel>> getUsuarios() async {
    final response = await client.get(
      url: 'https://api-ordem-de-servico-tfyb.onrender.com/api/usuario'
    );

    if(response.statusCode == 200){
      final body = jsonDecode(response.body) as List;
      return body.map((item) => UsuarioModel.fromMap(item)).toList();
    }
    else if(response.statusCode==404){
      throw NotFound('URL N EXISTE');
    }
    else{
      throw Exception('deu b.o');
    }
  }
}