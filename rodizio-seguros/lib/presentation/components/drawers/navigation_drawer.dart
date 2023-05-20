import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationStartDrawer extends StatelessWidget {
  const NavigationStartDrawer({Key? key}) : super(key: key);

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
                "PLANOS COM ATÉ 25% OFF",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(30),
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){},
                child: textUpField("SEGURO VEICULAR"),
              ),
              SizedBox(height: 32),
              GestureDetector(
                onTap: (){},
                child: textUpField("MEUS SEGUROS"),
              )
            ],
          ),
        ),
      ],
    );
  }

  textUpField(String text){
    return Text(
      text,
      style: TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.w700
      ),
    );
  }
}
