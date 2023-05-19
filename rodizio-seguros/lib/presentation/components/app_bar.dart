import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarApp extends StatelessWidget {
  const AppBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
