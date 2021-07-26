import 'package:flutter/material.dart';

class LoginController{
  late BuildContext context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  Future init (BuildContext context)async{
    this.context = context;
  }

  void login(){
    String email = emailController.text;
    String password = passwordController.text;

    print("email:"+email);
    /*print("email: $email");*/
    print("password:"+password);
  }

}