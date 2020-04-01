import 'package:flutter/material.dart';
import 'package:fisioproject/classes/double_buttons_model.dart';
import 'package:fisioproject/ui/elements/nuova_scheda_button.dart';
import 'package:fisioproject/ui/elements/double_buttons.dart';
import 'package:fisioproject/ui/views/scheda_predefinita.dart';
import 'package:provider/provider.dart';

class Schede extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ButtonsModel displayer = Provider.of<ButtonsModel>(context);

    return new Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            //Container Blu
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
                          "La tua scheda",
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
                        "Qui potrai trovare gli esercizi \nda svolgere settimanalmente.",
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
            PressedButton(displayer),
            displayer.default_selected ? Default() : NewSchedaButton(),
          ],
        ),
      ),
    );
  }
}
