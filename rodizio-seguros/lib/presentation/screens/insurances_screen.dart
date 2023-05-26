import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/insurance.dart';
import 'package:untitled/presentation/components/bottom_screens.dart';
import 'package:untitled/presentation/components/drawers/navigation_drawer.dart';
import 'package:untitled/presentation/screens/login_screen.dart';

import '../components/drawers/navigation_end_drawer.dart';

class InsurancesScreen extends StatefulWidget {
  const InsurancesScreen({Key? key}) : super(key: key);

  @override
  State<InsurancesScreen> createState() => _InsurancesScreenState();
}

class _InsurancesScreenState extends State<InsurancesScreen> {

  TextEditingController brandController = TextEditingController(); //marca
  TextEditingController modelController = TextEditingController(); //modelo
  TextEditingController plateController = TextEditingController(); //placa
  TextEditingController firstNameController = TextEditingController(); //nome
  TextEditingController surnameController = TextEditingController(); //sobrenome
  TextEditingController birthController = TextEditingController(); //nascimento

  List<bool> buttonSelectionListController = [true, false];

  List listInsurances = [];

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        drawer: NavigationDrawer(children: [NavigationStartDrawer()]),
        endDrawer: NavigationDrawer(children: [NavigationEndDrawer()]),
        appBar: appBar(),
        body: bodyAll(),
      ),
    );
  }

  appBar(){
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: Row(
        children: [
          SizedBox(width: 25),
          GestureDetector(
              onTap: () {
                scaffoldKey.currentState!.openDrawer();
              },
              child: Icon(Icons.menu, color: Colors.black)
          ),
        ],
      ),
      title: ImageIcon(AssetImage("assets/icons/rodizio_logo.png"), color: Colors.black, size: 150),
      actions: [
        GestureDetector(
            onTap: (){
              scaffoldKey.currentState!.openEndDrawer();
            },
            child: Icon(Icons.person_outlined, color: Colors.black)
        ),
        SizedBox(width: 30)
      ],

    );
  }

  bodyAll() {
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
                    onTap: (){
                      setState(() {
                        buttonSelectionListController = [true, false];
                      });
                    },
                    child: buttonOption(text: "Orçamento de Seguros", isSelected: buttonSelectionListController[0])
                ),
                GestureDetector(
                    onTap: (){
                      setState(() {
                        buttonSelectionListController = [false, true];
                      });
                    },
                    child: buttonOption(text: "Listar Seguro", isSelected: buttonSelectionListController[1])
                )
              ],
            ),
          ),

          Divider(color: Color.fromRGBO(233, 233, 233, 1), thickness: 1),

          SizedBox(height: 42),

          buttonSelectionListController[0]
              ? bodyBudget()
              : bodyListInsurance()
        ],
      ),
    ),
  );
  }

  bodyBudget(){
    return Container(
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
                    child: buttonOption(text: "Enviar Notificação", isSelected: false)
                ),
                GestureDetector(
                    child: buttonOption(text: "Orçar", isSelected: true)
                ),
              ],
            ),
          ),

          BottomScreens()
        ],
      ),
    );
  }

  bodyListInsurance(){

    listInsurances = [
      setInsurance(status: "REPROVADO", vehicle: "ASTRA SS", brand: "GM", year: 2007, plate: "ABC-1234"),
      setInsurance(status: "EM ANÁLISE", vehicle: "ASTRA SS", brand: "GM", year: 2007, plate: "ABC-1234"),
      setInsurance(status: "APROVADO", vehicle: "ASTRA SS", brand: "GM", year: 2007, plate: "ABC-1234"),
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Center(
              child: Text(
                "LISTAR SEGURO",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700
                ),
              ),
            ),
          ),

          SizedBox(height: 24),

          ListView.separated(
              itemCount: listInsurances.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(height: 24),
              itemBuilder: (context, index){
                Insurance insurance = listInsurances[index];
                Color colorStatus;
                if(insurance.status == "REPROVADO") {
                  colorStatus = Colors.red;
                } else if(insurance.status == "EM ANÁLISE") {
                  colorStatus = Color.fromRGBO(224, 121, 0, 1);
                } else {
                  colorStatus = Colors.green;
                }

                return Container(
                  height: 155,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textUpField("STATUS:", isBold: true),
                          SizedBox(height: 10),
                          textUpField("VEÍCULO:", isBold: true),
                          SizedBox(height: 10),
                          textUpField("MARCA:", isBold: true),
                          SizedBox(height: 10),
                          textUpField("ANO:", isBold: true),
                          SizedBox(height: 10),
                          textUpField("PLACA:", isBold: true),
                        ],
                      ),

                      SizedBox(width: 20),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textUpField(insurance.status, color: colorStatus),
                          SizedBox(height: 10),
                          textUpField(insurance.vehicle),
                          SizedBox(height: 10),
                          textUpField(insurance.brand),
                          SizedBox(height: 10),
                          textUpField("${insurance.year}"),
                          SizedBox(height: 10),
                          textUpField(insurance.plate),
                        ],
                      )
                    ],
                  ),
                );
              },
          ),

          BottomScreens()
        ],
      ),
    );
  }

  textUpField(String text, {isBold = false, color = Colors.black}){
    return Text(
      text,
      style: TextStyle(
          fontSize: 14,
          color: color,
          fontWeight: isBold ? FontWeight.w700 : FontWeight.w400
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

  buttonOption({required String text, required isSelected}){
    return Container(
      width: (MediaQuery.of(context).size.width - 50) / 2,
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: isSelected ? Colors.transparent : Colors.black),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 14,
              color: isSelected ? Colors.white : Colors.black
          ),
        ),
      ),
    );
  }

  Insurance setInsurance({required String status, required String vehicle, required String brand, required int year, required String plate}){
    Insurance insurance = Insurance(
        status: status,
        vehicle: vehicle,
        brand: brand,
        year: year,
        plate: plate
    );

    return insurance;
  }
}
