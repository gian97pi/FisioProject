import 'package:fisioproject/classes/user.dart';
import 'package:fisioproject/ui/elements/carusel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fisioproject/values/colors.dart';

import '../../main.dart';

class Riepilogo extends StatelessWidget {

  User _getData()  {
    return User.get(Fisio.sharedPreferences);
  }

  @override
  Widget build(BuildContext context) {
    final String user = _getData().name;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 170,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 220),
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                          offset: Offset(0.0, 3.0), // shadow direction: bottom right
                        )
                      ],
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      image: DecorationImage(
                          image: AssetImage('assets/images/container_bg.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0, top: 16.0, right: 24.0, bottom: 0.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                  'Ciao,\n$user',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500
                                  )
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Text(
                                  'Ecco la tua prossima\nsessione di allenamento.',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300
                                  )
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 16.0, left: 16.0),
                child: Container(
                  height: 44,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 220),
                            blurRadius: 5.0,
                            spreadRadius: 0.5,
                            offset: Offset(0.0, 3.0), // shadow direction: bottom right
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      color: Colors.white
                    ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('CRUNCH',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            )
                        ),
                        Text('4 x 10',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 15,
                            )
                        )
                      ],
                    ),
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, right: 16.0, left: 16.0),
                child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 220),
                            blurRadius: 5.0,
                            spreadRadius: 0.5,
                            offset: Offset(0.0, 3.0), // shadow direction: bottom right
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('SQUAT',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500
                              )
                          ),
                          Text('4 x 10',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 15,
                              )
                          )
                        ],
                      ),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, right: 16.0, left: 16.0),
                child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 220),
                            blurRadius: 5.0,
                            spreadRadius: 0.5,
                            offset: Offset(0.0, 3.0), // shadow direction: bottom right
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('FRENCH CURL',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500
                              )
                          ),
                          Text('4 x 10',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 15,
                              )
                          )
                        ],
                      ),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: FisioCarusel(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
