// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

class User {
  bool _notificationsEnabled;

  String _name;
  String _age;
  String _notificationTime;

  User.get(SharedPreferences sharedPreferences) {
    this._notificationsEnabled = sharedPreferences.getBool('notificationsEnabled') ?? false;

    this._name = sharedPreferences.getString('name') ?? '';
    this._age = sharedPreferences.getString('age') ?? '';
    this._notificationTime = sharedPreferences.getString('notificationTime') ?? '';
  }

  static bool exists(SharedPreferences sharedPreferences) {
    User user = User.get(sharedPreferences);

    if (user.name.isNotEmpty && user.age.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  /* Getters and setters */
  bool get notificationsEnabled => _notificationsEnabled;

  String get name => _name;
  String get age => _age;
  String get notificationTime => _notificationTime;
}
