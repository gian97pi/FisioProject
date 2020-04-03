import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User /*extends ChangeNotifier*/ {
  String _name;
  String _age;
  String _notificationTime;
  bool _notifications;

  User() {
    this.name = name;
    this.age = age;
    this.notificationTime = notificationTime;
    this._notifications = _notifications;
  }

  User.get(SharedPreferences sharedPreferences) {
    this.name = sharedPreferences.getString('name') ?? '';
    this.age = sharedPreferences.getString('age') ?? '';
    this.notificationTime = sharedPreferences.getString('notificationTime') ?? '';
    this.notifications = sharedPreferences.getBool('notifications') ?? false;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
    //notifyListeners();
  }

  String get age => _age;

  set age(String value) {
    _age = value;
    //notifyListeners();
  }

  String get notificationTime => _notificationTime;

  set notificationTime(String value) {
    _notificationTime = value;
    //notifyListeners();
  }

  bool get notifications => _notifications;

  set notifications(bool value) {
    _notifications = value;
  }

}