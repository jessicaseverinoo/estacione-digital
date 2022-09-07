import 'package:estacione_digital/src/model/user_model.dart';
import 'package:estacione_digital/src/view/Login/login_provider.dart';
import 'package:estacione_digital/src/view/Navigation/navigation_page.dart';
import 'package:flutter/material.dart';

class LoginController {
  TextEditingController cpfCnpjController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  void clickLogin(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      var usuario = await LoginProvider.login(
        cpfCnpjController.text,
        senhaController.text,
      );

      if (usuario != null) {
        navegaHomePage(context, usuario);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Dados de login inválidos'),
          ),
        );
      }
    }
  }

  void navegaHomePage(BuildContext context, UserModel userModel) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NavigationPage(userModel: userModel),
      ),
    );
  }
}
