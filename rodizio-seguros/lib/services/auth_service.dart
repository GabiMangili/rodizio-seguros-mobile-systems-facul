import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthException implements Exception{
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier{
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  bool isLoading = true;

  AuthService(){
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? userAuth) {
       user = userAuth == null ? null : user;
       isLoading = false;
       notifyListeners();//usuário alterado
    });
  }

  registerUser(String email, String password) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email.replaceAll(" ", ""), password: password);
      _getUser();
    }on FirebaseAuthException catch(e){
      if(e.code == "weak-password"){
        throw AuthException("A senha é muito fraca");
      } else if(e.code == "email-already-in-use"){
        throw AuthException("Este e-mail já está cadastrado");
      } else if(e.code == "invalid-email"){
        throw AuthException("E-mail inválido");
      } else {
        throw AuthException("${e.message}");
      }
    }
  }

  login(String email, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _getUser();
    }on FirebaseAuthException catch(e){
      if(e.code == "user-not-found"){
        throw AuthException("E-mail não encontrado. Clique em 'CADASTRAR-SE'");
      } else if(e.code == "wrong-password"){
        throw AuthException("Senha incorreta");
      }
    }
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }

  _getUser(){
    user = _auth.currentUser;
    notifyListeners();
  }

  getUser(){
    return user;
  }
}