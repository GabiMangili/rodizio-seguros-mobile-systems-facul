import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialogs{

  static dialogLoadingRegistration(BuildContext context){
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Container(
            height: 185,
            width: 280,
            child: AlertDialog(
              insetPadding: EdgeInsets.all(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Color.fromRGBO(246, 246, 246, 1),
              content: Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Carregando, por favor aguarde.",
                      style: TextStyle(
                          color: Color.fromRGBO(51, 51, 57, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 30),
                    Center(child: CircularProgressIndicator(color: Colors.black))
                  ],
                ),
              ),
            ),
          );
        });
  }

  static showMessage(BuildContext context, String message){
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 185,
            width: 280,
            child: AlertDialog(
              insetPadding: EdgeInsets.all(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Color.fromRGBO(246, 246, 246, 1),
              content: Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message,
                      style: TextStyle(
                        color: Color.fromRGBO(51, 51, 57, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}