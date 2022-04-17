import 'package:Encasillado/common/methods.dart';
import 'package:Encasillado/common/miscellaneous.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:Encasillado/common/widgets.dart';
import 'package:Encasillado/common/colors.dart';

class Suggest extends StatefulWidget {
  @override
  _SuggestState createState() => _SuggestState();
}

class _SuggestState extends State<Suggest> {

  final wordController = TextEditingController();

  @override
  void dispose() {
    wordController.dispose();
    super.dispose();
  }

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
        appBar: myAppBarWithoutButtonsWithBackArrow(context),
        backgroundColor: appWhite,
        body: Container(
          margin: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
          alignment: Alignment.topCenter,
          child: Column(children: [
            Expanded(
              child: ListView(
                  addAutomaticKeepAlives: true,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Sugerir nuevas palabras",
                      style: TextStyle(
                        fontSize: 25,
                        color: appBlack,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        fontFamily: 'RaleWay',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Palabras registradas: " +
                          (selectedDatabase.length).toString(),
                      style: TextStyle(
                        fontSize: 15,
                        color: appBlack,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        fontFamily: 'RaleWay',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Sugiere palabras que falten en el juego. Todas las palabras "
                          "deben ser de 5 letras.\n"
                          "Las palabras deben existir en el diccionario de la lengua "
                          "española.\n"
                          "Recuerda que no se aceptan verbos conjugados ni plurales.\n"
                          "Sí se admiten femeninos y nombres propios.",
                      style: TextStyle(
                        fontSize: 15,
                        color: appBlack,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                        fontFamily: 'RaleWay',
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 15,),
                    Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(Icons.security_rounded),
                        Text(
                          "Las palabras se envían de forma anónima.",
                          style: TextStyle(
                            fontSize: 15,
                            color: appBlack,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            fontFamily: 'RaleWay',
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(height: 50,),
                    TextField(
                      controller: wordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Palabra de 5 letras',
                        hintText: 'Sugiere una palabra...',
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                if ((wordController.text).length == 5) {
                                  sendSuggestedWord(wordController.text);
                                  Flushbar(
                                    message: "Palabra enviada. ¡Gracias por colaborar!",
                                    duration: Duration(seconds: 3),
                                    backgroundColor: Colors.orange,
                                    flushbarPosition: FlushbarPosition.TOP,
                                  ).show(context);
                                }
                                else Flushbar(
                                  message: "La palabra debe ser de 5 letras",
                                  duration: Duration(seconds: 3),
                                  backgroundColor: Colors.redAccent,
                                  flushbarPosition: FlushbarPosition.TOP,
                                ).show(context);
                              },
                              style: TextButton.styleFrom(
                                primary: appWhite,
                                backgroundColor: appMainColor,
                              ),
                              child: Text("ENVIAR PALABRA")),
                        ],
                      ),
                    ),

                  ]),
            ),
          ]),
        )
    );
  }
}