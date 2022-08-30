import 'package:estacione_digital/src/view/Navigation/navigation_page.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: const Image(
                  image: AssetImage('assets/images/logo.png'),
                  height: 100,
                ),
              ),
              const Spacer(),
              const Text('CPF ou CNPJ', textAlign: TextAlign.start),
              const SizedBox(height: 8),
              const TextField(
                cursorColor: Colors.black12,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '000.000.000-00 / 000.000.000/0000',
                ),
              ),
              const SizedBox(height: 24),
              const Text('Senha', textAlign: TextAlign.start),
              const SizedBox(height: 8),
              const TextField(
                cursorColor: Colors.black12,
                keyboardType: TextInputType.number,
                obscureText: true,
                obscuringCharacter: '•',
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.visibility_off),
                    border: OutlineInputBorder(),
                    hintText: '••••••••••••'),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Esqueceu sua senha? Clique aqui!',
                      textScaleFactor: 1,
                      style: TextStyle(
                        color: Color(0xff34437A),
                        decoration: TextDecoration.underline,
                      ),
                    )),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavigationPage(),
                      ),
                    );
                  },
                  child: const Text('Entrar'),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Entrar com gov.br'),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('Criar Conta'),
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
    );
  }
}
