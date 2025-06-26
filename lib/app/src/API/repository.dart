import 'package:ordem_de_servico/app/src/API/model.dart';

abstract class IRepositoryTeste{
  Future<List<ModelTeste>> getUsuarios();
}

class RepositoryTeste implements IRepositoryTeste {
  @override
  Future<List<ModelTeste>> getUsuarios() {
    // TODO: implement getUsuarios
    throw UnimplementedError();
  }
}