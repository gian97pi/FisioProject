import 'package:fisioproject/presentation/custom_icons.dart';

import 'package:fisioproject/ui/elements/day_selection_listview.dart';

import 'package:fisioproject/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:fisioproject/ui/views/scheda.dart';

class SelezioneGiorno extends StatelessWidget {
  final List<String> giorni = [
    'Lunedì',
    'Martedì',
    'Mercoledì',
    'Giovedì',
    'Venerdì',
    'Sabato',
    'Domenica'
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                        child: Text(
                          "INDIETRO",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(builder: (context) => Schede()),
                          );
                        }),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "AGGIUNGI",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color.fromARGB(255, 41, 171, 166),
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/container_bg.png'),
                      fit: BoxFit.fill,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(41, 0, 0, 0),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Scegli un giorno \ndella settimana.",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Rubik",
                              fontWeight: FontWeight.w800,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 8, 0, 20),
                        child: Text(
                          "Testo di esempio.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 220),
                          blurRadius: 5.0,
                          spreadRadius: 0.5,
                          offset: Offset(
                              0.0, 3.0), // shadow direction: bottom right
                        )
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: Text('Lunedi',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Icon(
                          Custom.next,
                          size: 20,
                          color: AppColors.primaryText,
                        ),
                      ],
                    ),
                  )),
            ),
            /*Padding(
              padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0),
              child: CatalogListView(entries: giorni),
            )*/
          ],
        ),
      ),
    );
  }
}
