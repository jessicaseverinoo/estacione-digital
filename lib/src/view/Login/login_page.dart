import 'package:estacione_digital/src/services/login_api.dart';
import 'package:estacione_digital/src/view/Navigation/navigation_page.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController cpfCnpjController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
                      if (valueValidator(value)) {
                        return 'Insira o CPF ou CNPJ';
                      }
                      return null;
                    },
                    controller: cpfCnpjController,
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      hintText: '000.000.000-00 / 000.000.000/0000',
                    ),
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black12,
                  ),
                  const SizedBox(height: 24),
                  const Text('Senha', textAlign: TextAlign.start),
                  const SizedBox(height: 8),
                  TextFormField(
                    validator: (String? value) {
                      if (valueValidator(value)) {
                        return 'Insira a senha';
                      }
                      return null;
                    },
                    controller: senhaController,
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
                        _clickLogin(context);
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
                        fontSize: 12,
                        color: Color(0xff424242),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navegaHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NavigationPage(),
      ),
    );
  }

  void _clickLogin(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      print(cpfCnpjController.text);
      print(senhaController.text);

      var response =
          await LoginApi.login(cpfCnpjController.text, senhaController.text);

      if (response == true) {
        _navegaHomePage(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Dados de login inválidos'),
          ),
        );
      }
    }
  }
}
