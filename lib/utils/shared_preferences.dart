// Project imports:
import 'package:fisioproject/main.dart';

void setData(String key, String value) {
  Fisio.sharedPreferences.setString(key, value);
}

void setBool(String key, bool value)  {
  Fisio.sharedPreferences.setBool(key, value);
}
