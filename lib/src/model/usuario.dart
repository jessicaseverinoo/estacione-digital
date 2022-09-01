import 'dart:convert';

import 'package:estacione_digital/src/model/veiculo.dart';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    required this.uuidUsuario,
    required this.cpfCnpj,
    required this.nome,
    required this.email,
    required this.status,
    required this.token,
    // required this.listVeiculo,
  });

  final String uuidUsuario;
  final String cpfCnpj;
  final String nome;
  final String email;
  final String status;
  final String token;
  // final List<Veiculo> listVeiculo;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        uuidUsuario: json["uuidUsuario"],
        cpfCnpj: json["cpfCnpj"],
        nome: json["nome"],
        email: json["email"],
        status: json["status"],
        token: json["token"],
        // listVeiculo: json["listVeiculo"],
      );

  Map<String, dynamic> toJson() => {
        "uuidUsuario": uuidUsuario,
        "cpfCnpj": cpfCnpj,
        "nome": nome,
        "email": email,
        "status": status,
        "token": token,
        // "listVeiculo": listVeiculo,
      };
}
