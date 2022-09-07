import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.uuidUsuario,
    required this.cpfCnpj,
    required this.nome,
    required this.email,
    required this.status,
    required this.token,
  });

  final String uuidUsuario;
  final String cpfCnpj;
  final String nome;
  final String email;
  final String status;
  final String token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uuidUsuario: json["uuidUsuario"],
        cpfCnpj: json["cpfCnpj"],
        nome: json["nome"],
        email: json["email"],
        status: json["status"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "uuidUsuario": uuidUsuario,
        "cpfCnpj": cpfCnpj,
        "nome": nome,
        "email": email,
        "status": status,
        "token": token,
      };
}
