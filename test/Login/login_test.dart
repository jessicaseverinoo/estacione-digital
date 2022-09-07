import 'package:estacione_digital/src/shared/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

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

  test('Verifica se os campos de CPF ou CNPJ e senha estão preenchidos', () {});

  test('Verifica dados do UserModel', () async {
    expect(userModel.uuidUsuario, 'e7963200-2dd8-4a3d-8c7a-8f4c8eaf39bf');
    expect(userModel.cpfCnpj, '123.456.789-01');
    expect(userModel.nome, 'Jessica Severino');
    expect(userModel.email, 'jessicaa.severinoo@gmail.com');
    expect(userModel.status, 'ATIVO');
    expect(userModel.token, 'null');
  });

  group('Testando Login Provider', () {
    // expect(actual, matcher);
  });
}
