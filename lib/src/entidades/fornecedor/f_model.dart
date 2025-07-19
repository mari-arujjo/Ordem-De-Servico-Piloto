class FornecedorModel {
  final int idFornecedor;
  final String cnpjFornecedor;
  final String razaoSocial;
  final String email;
  final String telefone;
  final String categoria;
  final String cep;
  final String rua;
  final int numero;
  final String? complemento;
  final String bairro;
  final String cidade;
  final String uf;

  FornecedorModel({
    required this.idFornecedor,
    required this.cnpjFornecedor,
    required this.razaoSocial,
    required this.email,
    required this.telefone,
    required this.categoria,
    required this.cep,
    required this.rua,
    required this.numero,
    this.complemento,
    required this.bairro,
    required this.cidade,
    required this.uf,
  });

  // vai retonrar um mapa que a key=string e value=dynamic(int, string, float etc)
  // PARA RECEBER
  factory FornecedorModel.fromMap(Map<String, dynamic> map) {
    return FornecedorModel(
      idFornecedor: map['idFornecedor'] ?? 0,
      cnpjFornecedor: map['cnpjFornecedor'] ?? '',
      razaoSocial: map['razaoSocial'] ?? '',
      email: map['email'] ?? '',
      telefone: map['telefone'] ?? '',
      categoria: map['categoria'] ?? '',
      cep: map['cep'] ?? '',
      rua: map['rua'] ?? '',
      numero: map['numero'] ?? 0,
      bairro: map['bairro'] ?? '',
      cidade: map['cidade'] ?? '',
      uf: map['uf'] ?? '',
    );
  }

  //PARA ENVIAR
  Map<String, dynamic> toMap() {
    return {
      'idFornecedor': idFornecedor,
      'cnpjFornecedor': cnpjFornecedor,
      'razaoSocial': razaoSocial,
      'email': email,
      'telefone': telefone,
      'categoria': categoria,
      'cep': cep,
      'rua': rua,
      'bairro': bairro,
    };
  }
}
