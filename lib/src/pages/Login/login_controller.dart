import 'package:estacione_digital/src/shared/models/user_model.dart';
import 'package:estacione_digital/src/pages/Login/login_provider.dart';
import 'package:estacione_digital/src/pages/Navigation/navigation_page.dart';
import 'package:flutter/material.dart';

class LoginController {
  final formKey = GlobalKey<FormState>();
  TextEditingController cpfCnpjController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

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
        navegaHomePage(context: context, userModel: usuario);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Dados de login inválidos'),
          ),
        );
      }
    }
  }

  void navegaHomePage({
    required BuildContext context,
    required UserModel userModel,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NavigationPage(
          userModel: userModel,
        ),
      ),
    );
  }
}
