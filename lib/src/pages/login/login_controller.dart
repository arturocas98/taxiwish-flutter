import 'package:flutter/material.dart';
import 'package:taxiwish/src/providers/auth_provider.dart';



class LoginController {

  late BuildContext context;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  late AuthProvider _authProvider;

  Future init (BuildContext context) async {
    this.context = context;
    _authProvider = new AuthProvider();
  }

  void goToRegister(){
    Navigator.pushNamed(context, 'register');
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email: $email');
    print('Password: $password');

    try {

      bool isLogin = await _authProvider.login(email, password);

      if (isLogin) {
        print('El usuario esta logeado');
      }
      else {

        print('El usuario no se pudo autenticar');
      }

    } catch(error) {

      print('Error en el servicio de login: $error');
    }

  }

}