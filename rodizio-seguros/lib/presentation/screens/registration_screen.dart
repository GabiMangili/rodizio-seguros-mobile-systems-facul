import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/auth_service.dart';
import '../dialogs.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();

  bool showPassword = false;
  bool showPasswordConfirmation = false;

  final formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body(){
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "CADASTRE-SE",
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.w700
              ),
            ),
            Text(
              "CADASTRE-SE USANDO SEUS DADOS!",
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
                    textField(nameController, "Nome"),
                    SizedBox(height: 10),
                    textField(emailController, "E-mail", validateEmail: true),
                    SizedBox(height: 10),
                    textField(passwordController, "Senha", showText: showPassword, isPassword: true),
                    SizedBox(height: 10),
                    textField(passwordConfirmationController, "Confirme a senha", showText: showPasswordConfirmation, isPassword: true, isConfirm: true),
                  ],
                )
            ),

            SizedBox(height: 30),

            buttonOption(),

            SizedBox(height: 30),

            GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Container(
                child: Text(
                  "Voltar ao login",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  textField(TextEditingController controller, String hintText, {showText = true, isPassword = false, isConfirm = false, bool validateEmail = false}){
    return Container(
      // height: 42,
      margin: EdgeInsets.only(top: 5),
      child: TextFormField(
        validator: (value){
           if(value == null || value.isEmpty){
             return "Campo obrigatório";
           }
           if(validateEmail){
             if(!EmailValidator.validate(value.replaceAll(" ", ""))){
               return "E-mail inválido";
             }
           }
           if(isConfirm){
             if(passwordController.text != passwordConfirmationController.text){
               return "Senhas não conferem";
             }
           }
           return null;
        },
        controller: controller,
        obscureText: !showText,
        decoration: InputDecoration(
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: (){
                    setState(() {
                      if(isConfirm){
                        showPasswordConfirmation = !showPasswordConfirmation;
                      } else {
                        showPassword = !showPassword;
                      }
                    });
                  },
                  icon: showText ? Icon(Icons.visibility) : Icon(Icons.visibility_off))
              : null,
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
          register();
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
            "CADASTRAR",
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

  register() async {
    try{
      Dialogs.dialogLoadingRegistration(context);
      await context.read<AuthService>().registerUser(emailController.text, passwordController.text).then((value) async {
        User user = context.read<AuthService>().getUser();
        await user.updateDisplayName(nameController.text);
        user.reload();
      });

      Navigator.of(context).pop();
      Navigator.of(context).pop();
    } on AuthException catch(e){
      Navigator.of(context).pop();
      Dialogs.showMessage(context, e.message);
    }
  }
}
