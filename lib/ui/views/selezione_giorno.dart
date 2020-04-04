import 'package:fisioproject/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:fisioproject/ui/views/scheda.dart';

class SelezioneGiorno extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                      }
                    ),
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
              padding: const EdgeInsets.fromLTRB(0,40,0,0),
              child: Align(
                alignment: Alignment.center,
                  child: Text("Sembra tutto ok")
              ),
            ),
          ],
        ),
      ),
    );
  }
}