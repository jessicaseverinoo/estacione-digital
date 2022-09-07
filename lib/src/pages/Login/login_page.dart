import 'package:estacione_digital/src/pages/Login/login_controller.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: const Image(
                      image: AssetImage('assets/images/logo.png'),
                      height: 100,
                    ),
                  ),
                  const Text('CPF ou CNPJ', textAlign: TextAlign.start),
                  const SizedBox(height: 8),
                  TextFormField(
                    validator: (String? value) {
                      if (controller.valueValidator(value)) {
                        return 'Insira o CPF ou CNPJ';
                      }
                      return null;
                    },
                    controller: controller.cpfCnpjController,
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      hintText: 'Ex.: 000.000.000-00',
                    ),
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black12,
                  ),
                  const SizedBox(height: 24),
                  const Text('Senha', textAlign: TextAlign.start),
                  const SizedBox(height: 8),
                  TextFormField(
                    validator: (String? value) {
                      if (controller.valueValidator(value)) {
                        return 'Insira a senha';
                      }
                      return null;
                    },
                    controller: controller.senhaController,
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      hintText: '••••••••••••',
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                    obscureText: true,
                    obscuringCharacter: '•',
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black12,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.clickLogin(context);
                      },
                      child: const Text('Entrar'),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Center(
                      child: Text(
                    'Versão 1.0.0+1',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff34437A),
                      decoration: TextDecoration.underline,
                    ),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}