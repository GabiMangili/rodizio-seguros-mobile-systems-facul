import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/presentation/components/bottom_screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool showSplashScreen = true;

  TextEditingController brandController = TextEditingController(); //marca
  TextEditingController modelController = TextEditingController(); //modelo
  TextEditingController plateController = TextEditingController(); //placa
  TextEditingController firstNameController = TextEditingController(); //nome
  TextEditingController surnameController = TextEditingController(); //sobrenome
  TextEditingController birthController = TextEditingController(); //nascimento


  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBar(),
        body: _body(),
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

  _body() {
    if(showSplashScreen){
      Future.delayed(Duration(seconds: 3), (){
        setState(() {
          showSplashScreen = false;
        });
      });
      return Center(
        child: Container(
          margin: EdgeInsets.all(63),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/splash_dizio.png"))
          ),
        ),
      );
    } else{
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 5),
          child: Column(
            children: [
              Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: buttonOption(text: "Orçamento de Seguros", buttonColor: Colors.black, textColor: Colors.white)
                    ),
                    GestureDetector(
                      child: buttonOption(text: "Listar Seguro", buttonColor: Colors.white, textColor: Colors.black, hasBorder: true)
                    )
                  ],
                ),
              ),

              Divider(color: Color.fromRGBO(233, 233, 233, 1), thickness: 1),

              SizedBox(height: 42),

              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                          "ORÇAMENTO SEGURO",
                        style: TextStyle(
                          fontSize: 16,
                            color: Colors.black,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),

                    SizedBox(height: 24),

                    textUpField("MARCA"),
                    textField(brandController, "Marca"),

                    SizedBox(height: 24),

                    textUpField("MODELO"),
                    textField(modelController, "Modelo"),

                    SizedBox(height: 24),

                    textUpField("PLACA"),
                    textField(plateController, "Placa"),

                    SizedBox(height: 42),

                    Center(
                      child: Text(
                        "DADOS DO PROPRIETÁRIO",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),

                    SizedBox(height: 24),

                    textUpField("NOME"),
                    textField(firstNameController, "Nome"),

                    SizedBox(height: 24),

                    textUpField("SOBRENOME"),
                    textField(surnameController, "Sobrenome"),

                    SizedBox(height: 24),

                    textUpField("DATA DE NASCIMENTO"),
                    textField(birthController, "dd/mm/aaaa"),

                    SizedBox(height: 42),

                    Container(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              child: buttonOption(text: "Enviar Notificação", buttonColor: Colors.white, textColor: Colors.black, hasBorder: true)
                          ),
                          GestureDetector(
                              child: buttonOption(text: "Orçar", buttonColor: Colors.black, textColor: Colors.white)
                          ),
                        ],
                      ),
                    ),

                    BottomScreens()
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
  }

  textUpField(String text){
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w400
      ),
    );
  }

  textField(TextEditingController controller, String hintText){
    return Container(
      height: 42,
      margin: EdgeInsets.only(top: 5),
      child: TextFormField(
        controller: controller,
        maxLength: 40,
        decoration: InputDecoration(
          counterText: "",
          hintText: hintText,
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

  buttonOption({required String text, required Color textColor, required Color buttonColor, bool hasBorder = false}){
    return Container(
      width: (MediaQuery.of(context).size.width - 50) / 2,
      height: 40,
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: hasBorder ? Colors.black : Colors.transparent),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 14,
              color: textColor
          ),
        ),
      ),
    );
  }
}
