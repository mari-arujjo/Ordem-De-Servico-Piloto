class FornecedorModel {
  final int id_fornecedor;
  final String cnpj_fornecedor;
  final String razao_social;
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
    required this.id_fornecedor,
    required this.cnpj_fornecedor,
    required this.razao_social,
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
      id_fornecedor: map['id_fornecedor'] ?? 0,
      cnpj_fornecedor: map['cnpj_fornecedor'] ?? '',
      razao_social: map['razao_social'] ?? '',
      email: map['email'] ?? '',
      telefone: map['telefone'] ?? '',
      categoria: map['categoria'] ?? '',
      cep: map['cep'] ?? '',
      rua: map['rua'] ?? '',
      numero: map['numero'] ?? 0,
      complemento: map['complemento'] ?? '',
      bairro: map['bairro'] ?? '',
      cidade: map['cidade'] ?? '',
      uf: map['uf'] ?? '',
    );
  }

  //PARA ENVIAR
  Map<String, dynamic> toMap() {
    return {
      'id_fornecedor': id_fornecedor,
      'cnpj_fornecedor': cnpj_fornecedor,
      'razao_social': razao_social,
      'email': email,
      'telefone': telefone,
      'categoria': categoria,
      'cep': cep,
      'rua': rua,
      'numero': numero,
      'complemento': complemento,
      'bairro': bairro,
      'cidade': cidade,
      'uf': uf
    };
  }
}
