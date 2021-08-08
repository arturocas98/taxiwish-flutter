import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider{
  late FirebaseAuth _firebaseAuth;

  AuthProvider(){
    _firebaseAuth = FirebaseAuth.instance;
  }

  Future<bool>login(String email,String password)async{
    String errorMessage = '';
    Object result;
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    }catch(error){
      /*print(error);*/
      errorMessage = error.toString();
    }

    if(errorMessage != ''){
      return Future.error(errorMessage);
    }else{
      return true;
    }


  }

  Future<bool>register(String email,String password)async{
    String errorMessage = '';
    Object result;
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(error){
      /*print(error);*/
      errorMessage = error.toString();
    }

    if(errorMessage != ''){
      return Future.error(errorMessage);
    }else{
      return true;
    }


  }

}