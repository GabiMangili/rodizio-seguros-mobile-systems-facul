import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationEndDrawer extends StatelessWidget {
  const NavigationEndDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 39,
          color: Colors.black,
          child: Container(
            child: Center(
              child: Text(
                "OLÁ, (USUÁRIO)! SEJA BEM VINDO(A)",
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
              GestureDetector(
                onTap: (){},
                child: Container(
                  height: 42,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: textUpField("ENTRAR", Colors.white)
                  )
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: (){},
                child: Container(
                  height: 42,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black)
                  ),
                  child: Center(
                      child: textUpField("CADASTRAR ", Colors.black)
                  ),
                ),
              ),

              SizedBox(height: 30),
              Divider(color: Color.fromRGBO(233, 233, 233, 1), thickness: 1),
              SizedBox(height: 20),

              Center(
                  child: textUpField("SAIR", Colors.black)
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
