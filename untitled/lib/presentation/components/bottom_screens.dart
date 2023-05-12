import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomScreens extends StatelessWidget {
  const BottomScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50),

        Divider(thickness: 1, color: Colors.black),

        SizedBox(height: 30),

        Center(
          child: Container(
            height: 114.5,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/splash_dizio.png")
                )
            ),
          ),
        ),

        SizedBox(height: 50),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "INSTITUCIONAL",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w700
                  ),
                ),

                SizedBox(height: 16),

                textOptions("Quem Somos"),

                SizedBox(height: 16),

                textOptions("Poçíticas da Empresa"),

                SizedBox(height: 16),

                textOptions("Políticas de Privacidade"),

                SizedBox(height: 16),

                textOptions("Formas de Pagamento"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PRECISA DE AJUDA?",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w700
                  ),
                ),

                SizedBox(height: 16),

                textOptions("Minha Conta"),

                SizedBox(height: 16),

                textOptions("Meus Orçamentos"),

                SizedBox(height: 16),

                textOptions("Quero me Cadastrar"),

                SizedBox(height: 16),

                textOptions("Onde nos Localizamos"),
              ],
            )
          ],
        ),

        SizedBox(height: 50),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SIGA-NOS NAS REDES SOCIAIS",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                    children: [
                      SizedBox(height: 16),

                      socialMedia("Facebook", "assets/icons/facebook.png"),

                      SizedBox(height: 16),

                      socialMedia("Instagram", "assets/icons/instagram.png"),

                      SizedBox(height: 16),

                      socialMedia("YouTube", "assets/icons/youtube.png")
                    ]
                ),

                SizedBox(width: 46.5),

                Column(
                    children: [
                      SizedBox(height: 16),

                      socialMedia("Facebook", "assets/icons/facebook.png")
                    ]
                )
              ],
            ),

            SizedBox(height: 50),

            Center(
              child: Text(
                "RODRIGO SEGUROS  LTDA. - 00.000.000/0001-00 - © 2023\nGabriel Faria Sferra - Todos os direitos reservados",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.w400
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  socialMedia(String socialMedia, String imagePath){
    return Row(
      children: [
        ImageIcon(AssetImage(imagePath)),
        SizedBox(width: 10),
        textOptions(socialMedia)
      ],
    );
  }

  textOptions(String text){
    return Text(
      text,
      style: TextStyle(
          fontSize: 14,
          color: Color.fromRGBO(1, 1, 1, 1),
          fontWeight: FontWeight.w400
      ),
    );
  }
}
