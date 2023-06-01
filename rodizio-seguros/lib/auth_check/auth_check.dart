import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presentation/screens/insurances_screen.dart';
import 'package:untitled/presentation/screens/login_screen.dart';
import 'package:untitled/services/auth_service.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if(auth.isLoading){
      return loading();
    } else if(auth.user == null){
      return LoginScreen();
    } else {
      return InsurancesScreen();
    }
    return const Placeholder();
  }

  loading(){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(color: Colors.black),
      ),
    );
  }

}
