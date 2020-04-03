import 'package:fisioproject/ui/views/intro_age_step.dart';
import 'package:flutter/material.dart';
import 'package:fisioproject/values/colors.dart';

class ProfileName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 20, 14, 0),
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
                            image: AssetImage('assets/images/container_bg.png'),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Container(
                        height: 15,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/container_bg.png'),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Container(
                        height: 15,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/container_bg.png'),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
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
                      padding: const EdgeInsets.fromLTRB(24.0, 32.0, 29.0, 0),
                      child: Container(
                        height: 89,
                        child: Image(
                          image: AssetImage("assets/images/spine_white.png"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                      child: Text(
                        "Ciao, come ti \nchiami?",
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
                  const EdgeInsets.only(left: 24.0, top: 12.0, right: 24.0),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 220),
                        blurRadius: 5.0,
                        spreadRadius: 0.5,
                        offset: Offset(0.0, 3.0), // shadow direction: bottom
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: TextField(
                      //Nome
                      //controller: _nameController,
                      textAlign: TextAlign.right,
                      cursorWidth: 2.0,
                      cursorColor: AppColors.primaryText,
                      decoration: null,
                      /* onChanged: (String str) {
                          _setData('name', str);
                        },*/
                      style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
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
                child: ButtonTheme(
                  minWidth: double.infinity,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileAge()));
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
    );
  }
}