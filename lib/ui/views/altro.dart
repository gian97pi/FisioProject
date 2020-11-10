// Dart imports:
import 'dart:io' show Platform;

// Flutter imports:
import 'file:///C:/Users/Gianluca%20Picci/StudioProjects/FisioProject/lib/classes/NotificationPlugin.dart';
import 'package:fisioproject/ui/views/bottom_menu.dart';
import 'package:fisioproject/ui/views/riepilogo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:commons/commons.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

// Project imports:
import 'package:fisioproject/classes/user.dart';
import 'package:fisioproject/main.dart';
import 'package:fisioproject/utils/shared_preferences.dart';
import 'package:fisioproject/values/colors.dart';

class Altro extends StatefulWidget {
  @override
  _AltroState createState() => _AltroState();
}

class _AltroState extends State<Altro> {
  bool _notificationsEnabled = false;

  final _teNameController = TextEditingController();
  final _teAgeController = TextEditingController();

  DateTime _currentDt = DateTime.now();
  String _timeToDisplay = '';

  //TimePicker
  Future<void> _selectedTime(BuildContext context) async {
    await DatePicker.showTimePicker(
        context,
        showSecondsColumn: false,
        currentTime: _currentDt,
        onConfirm: (dateTime) async {
          await notificationPlugin.showDailyAtTime(dateTime.hour, dateTime.minute);
          setState(() {
            // HH:MM display format
            _timeToDisplay = DateFormat.Hm().format(dateTime);
            _currentDt = currentNotificationDt(_timeToDisplay);
          });
          setData('notificationTime', _timeToDisplay);
        });
  }

  // Prendo i dati dalla SharedPreference e li setto nei campi corrispondenti
  @override
  void initState() {
    super.initState();
    User user = User.get(Fisio.sharedPreferences);

    notificationPlugin
        .setListenerForLowerVersions(onNotificationInLowerVersions);
    notificationPlugin.setOnNotificationClick(onNotificationClick);

    setState(() {
      _teNameController.text = user.name;
      _teAgeController.text = user.age;
      _timeToDisplay = user.notificationTime;
      _notificationsEnabled = user.notificationsEnabled;

      /* Ensure that the time picker is opened at the current selected notification time,
       * if already present in the shared preferences.
       */
      if (_timeToDisplay.isNotEmpty) {
        _currentDt = currentNotificationDt(_timeToDisplay);
      }
    });
  }

  DateTime currentNotificationDt(String displayTime) {
    if (_currentDt == null || displayTime.isEmpty)
      return null;

    List<int> hourMin = displayTime.split(':')
        .map(int.parse).toList();

    return _currentDt.copyWith(hour: hourMin[0],
        minute: hourMin[1]);
  }

  Widget NotificationSwitch() {
    if (Platform.isIOS) {
      return CupertinoSwitch(
          value: _notificationsEnabled,
          onChanged: (status) {
            setState(() {
              _notificationsEnabled = status;
              setBool('notificationsEnabled', status);
            });
          }
      );
    } else {
      return Switch(
        activeColor: AppColors.primaryText,
        value: _notificationsEnabled,
        onChanged: (status) {
          setState(() {
            _notificationsEnabled = status;
            setBool('notificationsEnabled', status);
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
                          NotificationSwitch()
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
                              controller: _teNameController,
                              textAlign: TextAlign.right,
                              cursorWidth: 2.0,
                              cursorColor: AppColors.primaryText,
                              decoration: null,
                              onChanged: (String str) {
                                setData('name', str);
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
                                controller: _teAgeController,
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
                                  setData('age', str);
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

  onNotificationInLowerVersions(ReceivedNotification receivedNotification) {
    print('Notification Received ${receivedNotification.id}');
  }

  onNotificationClick(String payload) {
    print('Payload $payload');
    Navigator.push(context, MaterialPageRoute(builder: (coontext) {
      return BottomMenu();
    }));
  }
}


