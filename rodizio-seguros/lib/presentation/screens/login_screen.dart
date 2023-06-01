import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presentation/dialogs.dart';
import 'package:untitled/presentation/screens/registration_screen.dart';
import 'package:untitled/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: _body(),
      ),
    );
  }

  _body(){
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.w700
                ),
            ),
            Text(
              "ENTRE USANDO SUA CONTA!",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black
              ),
            ),

            SizedBox(height: 20),

            Form(
              key: formKey,
              child: Column(
                children: [
                  textField(emailController, "E-mail"),
                  SizedBox(height: 20),
                  textField(passwordController, "Senha", obscure: true),
                ],
              ),
            ),

            SizedBox(height: 20),

            buttonOption(),

            SizedBox(height: 30),

            Text(
              "OU",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black
              ),
            ),

            SizedBox(height: 5),

            TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
                },
                child: Container(
                  child: Text(
                    "CADASTRE-SE ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }

  textField(TextEditingController controller, String hintText, {obscure = false}){
    return Container(
      // height: 42,
      margin: EdgeInsets.only(top: 5),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          counterText: "",
          labelText: hintText,
          hintStyle: TextStyle(
              fontSize: 12,
              color: Color.fromRGBO(106, 106, 106, 1),
              fontWeight: FontWeight.w400
          ),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black)),
          border: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black)),
        ),
      ),
    );
  }

  buttonOption(){
    return GestureDetector(
      onTap: (){
        if(formKey.currentState!.validate()){
          login();
        }
      },
      child: Container(
        width: 172,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            "ENTRAR",
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }

  login() async {
    try{
      Dialogs.dialogLoadingRegistration(context);
      await context.read<AuthService>().login(emailController.text.replaceAll(" ", ""), passwordController.text);
      Navigator.of(context).pop();
    } on AuthException catch(e){
      Navigator.of(context).pop();
      Dialogs.showMessage(context, e.message);
    }
  }
}
