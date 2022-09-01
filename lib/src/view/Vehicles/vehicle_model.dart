class VehicleItem {
  // final String uuidUsuario;
  // final String cpfCnpj;
  // final String nome;
  // final String email;
  // final List<Map> listVeiculo;

  final String uuidVeiculo;
  final String placa;
  final String modelo;
  final bool favorito;
  final String tipoVeiculo;

  VehicleItem({
    // required this.uuidUsuario,
    // required this.cpfCnpj,
    // required this.nome,
    // required this.email,
    // required this.listVeiculo,
    required this.uuidVeiculo,
    required this.placa,
    required this.modelo,
    required this.favorito,
    required this.tipoVeiculo,
  });

  factory VehicleItem.fromJson(Map<String, dynamic> json) {
    return VehicleItem(
      // uuidUsuario: json['uuidUsuario'],
      // cpfCnpj: json['cpfCnpj'],
      // nome: json['nome'],
      // email: json['email'],
      // listVeiculo: json['listVeiculo'],
      uuidVeiculo: json['uuidVeiculo'] as String,
      placa: json['placa'] as String,
      modelo: json['modelo'] as String,
      favorito: json['favorito'] as bool,
      tipoVeiculo: json['tipoVeiculo'] as String,
    );
  }
}
