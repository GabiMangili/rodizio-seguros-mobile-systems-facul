import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/auth_check/auth_check.dart';
import 'package:untitled/presentation/components/bottom_screens.dart';
import 'package:untitled/presentation/screens/insurances_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBar(),
        body: _body(context),
      ),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: Row(
        children: [
          SizedBox(width: 25),
          Icon(Icons.menu, color: Colors.black),
        ],
      ),
      title: ImageIcon(AssetImage("assets/icons/rodizio_logo.png"), color: Colors.black, size: 150),
      actions: [
        Icon(Icons.person_outlined, color: Colors.black),
        SizedBox(width: 30)
      ],
    );
  }

  _body(BuildContext context) {
      Future.delayed(Duration(seconds: 3), (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AuthCheck()));
      });
      return Center(
        child: Container(
          margin: EdgeInsets.all(63),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/splash_dizio.png"))
          ),
        ),
      );
    }
}
