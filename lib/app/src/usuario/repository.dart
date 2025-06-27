import 'dart:convert';
import 'package:ordem_de_servico/app/src/API/alerts.dart';
import 'package:ordem_de_servico/app/src/API/http_client.dart';
import 'package:ordem_de_servico/app/src/usuario/model.dart';

abstract class IRepositoryTeste{
  Future<List<ModelTeste>> getUsuarios();
}

class RepositoryTeste implements IRepositoryTeste {

  final IHttpClient client;
  RepositoryTeste({required this.client});

  @override
  Future<List<ModelTeste>> getUsuarios() async {
    final response = await client.get(
      url: 'https://api-ordem-de-servico-tfyb.onrender.com/api/usuario'
    );

    if(response.statusCode == 200){
      final body = jsonDecode(response.body) as List;
      return body.map((item) => ModelTeste.fromMap(item)).toList();
    }
    else if(response.statusCode==404){
      throw NotFound('URL N EXISTE');
    }
    else{
      throw Exception('deu b.o');
    }
  }
}