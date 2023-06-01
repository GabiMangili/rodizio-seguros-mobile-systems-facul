import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/services/auth_service.dart';

class NavigationEndDrawer extends StatelessWidget {
  const NavigationEndDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = context.read<AuthService>().getUser();
    String firstName;
    if(user.displayName != null){
      firstName = user.displayName!.split(" ")[0];
    } else {
      firstName = user.email!.split("@")[0];
    }

    return Column(
      children: [
        Container(
          height: 39,
          color: Colors.black,
          child: Container(
            child: Center(
              child: Text(
                "OLÁ, ${firstName.toUpperCase()}! SEJA BEM VINDO(A)",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(30),
          alignment: Alignment.topRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Divider(color: Color.fromRGBO(233, 233, 233, 1), thickness: 1),
              SizedBox(height: 20),

              GestureDetector(
                onTap: (){
                  context.read<AuthService>().logout();
                },
                child: Center(
                    child: textUpField("SAIR", Colors.black)
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  textUpField(String text, Color color){
    return Text(
      text,
      style: TextStyle(
          fontSize: 14,
          color: color,
          fontWeight: FontWeight.w700
      ),
    );
  }
}
