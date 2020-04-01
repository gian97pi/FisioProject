import 'package:flutter/cupertino.dart';

class ButtonsModel extends ChangeNotifier {
  bool default_selected;

  //true quando chiamato dalla personalizzata
  void change(bool custom) {
    if(custom != default_selected) {
      default_selected = !default_selected;
      notifyListeners();
    }
  }

  ButtonsModel(){
    default_selected = true;
  }
}