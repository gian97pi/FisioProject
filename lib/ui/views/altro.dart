import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fisioproject/classes/user.dart';
import 'package:fisioproject/values/colors.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Altro extends StatefulWidget {
  @override
  _AltroState createState() => _AltroState();
}

class _AltroState extends State<Altro> {
  TimeOfDay _current = TimeOfDay.now();
  TimeOfDay _selected;
  String _timeToDisplay = '';

  bool _enableNotifications = false;

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  //TimePicker
  Future<void> _selectedTime(BuildContext context) async {
    _selected = await showTimePicker(context: context, initialTime: _selected ?? _current);
    setState(() {
      _timeToDisplay = _selected.format(context);
    });
    _setData('notificationTime', _timeToDisplay);
  }

  //Prendo i dati dalla SharedPreference e li setto nei campi corrispondenti
  @override
  void initState() {
    super.initState();
    _getData().then((user){
      setState(() {
        _nameController.text = user.name;
        _ageController.text = user.age;
        _timeToDisplay = user.notificationTime;
        _enableNotifications = user.notifications;
      });
    });
  }

  Future<User> _getData() async {
    final userPrefs = await SharedPreferences.getInstance();
    return User.get(userPrefs);
  }

  Future<void> _setData(String key, String value) async {
    final userPrefs = await SharedPreferences.getInstance();
    await userPrefs.setString(key, value);
  }

  Future<void> _setBool(String key, bool value) async {
    final userPrefs = await SharedPreferences.getInstance();
    await userPrefs.setBool(key, value);
  }

  /*Future<UserBloc> _getNameFromSharedPrefs() async {
    UserBloc user = UserBloc();
    final userPrefs = await SharedPreferences.getInstance();
    user.name = userPrefs.getString('name') ?? '';
    user.age = userPrefs.getString('age') ?? '';
    user.notificationTime = userPrefs.getString('notificationTime') ?? '';

    return user;
  }*/

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
                      padding: Platform.isIOS ?
                      const EdgeInsets.only(left: 20.0, right: 10.0) :
                      const EdgeInsets.symmetric(horizontal: 20.0),
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
                            Text('Ricordamelo alle',
                                style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal
                                )
                            ),
                            Container(
                              width: 150,
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
                                maxLength: 3,
                                maxLengthEnforced: true,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  WhitelistingTextInputFormatter.digitsOnly
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
