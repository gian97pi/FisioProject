import 'dart:io' show Platform;

import 'package:fisioproject/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fisioproject/classes/user.dart';
import 'package:fisioproject/values/colors.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Altro extends StatefulWidget {
  @override
  _AltroState createState() => _AltroState();
}

class _AltroState extends State<Altro> {
  bool _enableNotifications = false;

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  DateTime _current = DateTime.now();
  DateTime _selected;
  String _timeToDisplay = '';

  //TimePicker
  //Nota: i minuti mi ritornano con una cifra, se minori di 10, quindi la aggiungo a mano per creare una data leggibile
  Future<void> _selectedTime(BuildContext context) async {
    _selected = await DatePicker.showTimePicker(
        context,
        showSecondsColumn: false,
        currentTime: _current,
        onConfirm: (date) {
          String hour = date.hour.toString();
          String minute;
          if(date.minute < 10)
            minute = '0' + date.minute.toString();
          else
            minute = date.minute.toString();
          _setData('notificationTime', '$hour:$minute');
        });
    setState(() {
      if(_selected.minute < 10)
        _timeToDisplay = _selected.hour.toString() + ':0' + _selected.minute.toString();
      else
      _timeToDisplay = _selected.hour.toString() + ':' + _selected.minute.toString();
    });
    _setData('notificationTime', _timeToDisplay);
  }

  //Prendo i dati dalla SharedPreference e li setto nei campi corrispondenti
  @override
  void initState() {
    super.initState();
    User user = _getData();
    setState(() {
      _nameController.text = user.name;
      _ageController.text = user.age;
      _timeToDisplay = user.notificationTime;
      _enableNotifications = user.notifications;
    });
  }

  User _getData()  {
    return User.get(Fisio.sharedPreferences);
  }

  void _setData(String key, String value) {
    Fisio.sharedPreferences.setString(key, value);
  }

  void _setBool(String key, bool value)  {
    Fisio.sharedPreferences.setBool(key, value);
  }

  Widget customSwitch() {
    if (Platform.isIOS) {
      return CupertinoSwitch(
          value: _enableNotifications,
          onChanged: (status) {
            setState(() {
              _enableNotifications = status;
              _setBool('notifications', status);
            });
          }
      );
    } else {
      return Switch(
        activeColor: AppColors.primaryText,
        value: _enableNotifications,
        onChanged: (status) {
          setState(() {
            _enableNotifications = status;
            _setBool('notifications', status);
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Altro',
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 28,
                        fontWeight: FontWeight.w500
                      )
                  ),
                ),
              ),
              Padding(                                                   //NOTIFICHE
                padding: const EdgeInsets.only(top: 24.0, left: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Notifiche',
                      style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 12.0, right: 24.0),
                child: Container(
                    height: 44,
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
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: //Platform.isIOS ?
                      const EdgeInsets.only(left: 20.0, right: 10.0), //:
                      //const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Abilita',
                              style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal
                              )
                          ),
                          customSwitch()
                        ],
                      ),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 5.0, right: 24.0),
                child: GestureDetector(
                  onTap: () {
                    _selectedTime(context);
                  },
                  child: Container(
                      height: 44,
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
                          color: Colors.white
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Promemoria esercizi alle',
                                style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal
                                )
                            ),
                            Container(
                              width: 60,
                              child: Text(                        //Orario notifiche
                                  _timeToDisplay,
                                  textAlign: TextAlign.right,

                                  style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500
                                  )
                              ),
                            )
                          ],
                        ),
                      )
                  ),
                ),
              ),
              Padding(                                              //AREA PERSONALE
                padding: const EdgeInsets.only(top: 24.0, left: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Area personale',
                      style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 12.0, right: 24.0),
                child: Container(
                    height: 44,
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
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Nome',
                              style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontSize: 15,
                              )
                          ),
                          Container(
                            width: 150,
                            child: TextField(                               //Nome
                              controller: _nameController,
                              textAlign: TextAlign.right,
                              cursorWidth: 2.0,
                              cursorColor: AppColors.primaryText,
                              decoration: null,
                              onChanged: (String str) {
                                _setData('name', str);
                              },
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                              )
                            ),
                          )
                        ],
                      ),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 5.0, right: 24.0),
                child: Container(
                    height: 44,
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
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Età',
                              style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal
                              )
                          ),
                          Container(                                          //Età
                            width: 100,
                            child: TextField(
                                controller: _ageController,
                                textAlign: TextAlign.right,
                                cursorWidth: 2.0,
                                cursorColor: AppColors.primaryText,
                                decoration: null,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  WhitelistingTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(3)
                                ],
                                onChanged: (String str) {
                                  _setData('age', str);
                                },
                                style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                                )
                            ),
                          )
                        ],
                      ),
                    )
                ),
              ),
              Padding(                                                    //SVILUPPO
                padding: const EdgeInsets.only(top: 24.0, left: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Sviluppo',
                      style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 12.0, right: 24.0),
                child: Container(
                    height: 44,
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
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Sviluppato da',
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 15,
                              )
                          ),
                          Text('GILD Studios',
                              style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500
                              )
                          )
                        ],
                      ),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 5.0, right: 24.0),
                child: Container(
                    height: 44,
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
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Versione',
                              style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal
                              )
                          ),
                          Text('0.0.1',
                              style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500
                              )
                          )
                        ],
                      ),
                    )
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
