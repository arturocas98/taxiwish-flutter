import 'package:flutter/material.dart';
import 'package:taxiwish/src/providers/auth_provider.dart';



class RegisterController {

  late BuildContext context;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmpasswordController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();

  late AuthProvider _authProvider;

  Future init (BuildContext context) async {
    this.context = context;
    _authProvider = new AuthProvider();
  }

  void register() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmpasswordController.text.trim();
    String username = usernameController.text.trim();
    if(email.isEmpty && password.isEmpty && confirmPassword.isEmpty && username.isEmpty){
      print('Llene todos los datos');
      return;
    }

    if(password != confirmPassword){
      print('Las contraseñas no coinciden ');
      return;
    }

    if(password.length < 6){
      print('El password debe tener al menos 6 caracteres');
      return;
    }

    try {

      bool isRegister = await _authProvider.register(email, password);

      if (isRegister) {
        print('El usuario se registro correctamente');
      }
      else {
        print('El usuario no se pudo registrar');
      }

    } catch(error) {

      print('Error en el servicio de registro: $error');
    }

  }



}