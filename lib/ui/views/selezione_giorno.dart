import 'package:fisioproject/presentation/custom_icons.dart';
import 'package:fisioproject/ui/elements/selezione_giorno_listview.dart';
import 'package:fisioproject/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:fisioproject/ui/views/scheda.dart';

class SelezioneGiorno extends StatelessWidget {
  final List<String> giorni = [
    'LUNEDÌ',
    'MARTEDÌ',
    'MERCOLEDÌ',
    'GIOVEDÌ',
    'VENERDÌ',
    'SABATO',
    'DOMENICA',
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: Icon(
                              Custom.back,
                              size: 17,
                              color: AppColors.primaryText,
                            ),
                          ),
                          Text(
                            "INDIETRO",
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontFamily: "Rubik",
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => Schede()),
                        );
                      }),
                  Text(
                    "FATTO",
                    style: TextStyle(
                      color: Color.fromARGB(255, 41, 171, 166),
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
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
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 8, 0, 20),
                              child: Text(
                                "Organizza i tuoi esercizi nei giorni che preferisci.",
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
                      child: DaySelectionListview(entries: giorni),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
