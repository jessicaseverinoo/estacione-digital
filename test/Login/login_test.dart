import 'package:estacione_digital/src/pages/Login/login_provider.dart';
import 'package:estacione_digital/src/shared/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert' as convert;

void main() {
  const String cpfCnpj = '123.456.789-01';
  const String password = "123456";

  final userModel = UserModel(
    uuidUsuario: 'e7963200-2dd8-4a3d-8c7a-8f4c8eaf39bf',
    cpfCnpj: '123.456.789-01',
    nome: 'Jessica Severino',
    email: 'jessicaa.severinoo@gmail.com',
    status: 'ATIVO',
    token: 'null',
  );

  final response =
      '{"uuidUsuario": "e7963200-2dd8-4a3d-8c7a-8f4c8eaf39bf", "cpfCnpj": "123.456.789-01", "nome": "Jessica Severino", "email": "jessicaa.severinoo@gmail.com", "status": "ATIVO", "token": "e7963200-2dd8-4a3d-8c7a-8f4c8eaf39bf"}';

  test('Verifica se os campos de CPF ou CNPJ e senha estão preenchidos', () {});

  test('Verifica dados do UserModel', () async {
    expect(userModel.uuidUsuario, 'e7963200-2dd8-4a3d-8c7a-8f4c8eaf39bf');
    expect(userModel.cpfCnpj, '123.456.789-01');
    expect(userModel.nome, 'Jessica Severino');
    expect(userModel.email, 'jessicaa.severinoo@gmail.com');
    expect(userModel.status, 'ATIVO');
    expect(userModel.token, 'e7963200-2dd8-4a3d-8c7a-8f4c8eaf39bf');
  });

  group('Testando Login Provider', () async {
    var usuario = await LoginProvider.login(
      cpfCnpj,
      password,
    );
    test('Usuário deve ser diferente de null', () async {
      expect(
        usuario != null,
        true,
      );
    });
  });
}
