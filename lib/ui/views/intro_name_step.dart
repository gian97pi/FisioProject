import 'package:fisioproject/ui/views/intro_age_step.dart';
import 'package:flutter/material.dart';
import 'package:fisioproject/values/colors.dart';
import 'package:flutter/services.dart';

import '../../main.dart';

class IntroNameStep extends StatelessWidget {
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool validInput = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Container(
                            height: 15,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/container_bg.png'),
                                fit: BoxFit.fill,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Opacity(
                            opacity: 0.3,
                            child: Container(
                              height: 15,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/container_bg.png'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Opacity(
                            opacity: 0.3,
                            child: Container(
                              height: 15,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/container_bg.png'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, top: 24.0, right: 24.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(41, 0, 0, 0),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage('assets/images/container_bg.png'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(24.0, 32.0, 28.0, 0.0),
                          child: Container(
                            height: 89,
                            child: Image(
                              image:
                                  AssetImage("assets/images/spine_white.png"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 32.0),
                          child: Text(
                            "Ciao, come ti\nchiami?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Rubik",
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24.0, top: 48.0, right: 24.0),
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 220),
                            blurRadius: 5.0,
                            spreadRadius: 0.5,
                            offset:
                                Offset(0.0, 3.0), // shadow direction: bottom
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        color: Colors.white
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextField(                                     //Nome
                            controller: _nameController,
                            textAlign: TextAlign.center,
                            cursorWidth: 2.0,
                            cursorColor: AppColors.primaryText,
                            decoration: null,
                            textAlignVertical: TextAlignVertical.center,
                            inputFormatters: <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(16)
                            ],
                            style: TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                            )
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(41, 0, 0, 0),
                          offset: Offset(0, 3.0),
                          blurRadius: 6.0,
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage('assets/images/container_bg.png'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: ButtonTheme(
                      minWidth: double.infinity,
                      child: FlatButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {
                          if(validInput) {
                            _setData('name', _nameController.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => IntroAgeStep()
                                )
                            );
                          }
                        },
                        child: Text(
                          "Continua",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Rubik",
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _setData(String key, String value) {
    Fisio.sharedPreferences.setString(key, value);
  }
}
