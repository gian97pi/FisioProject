// Flutter imports:
import 'package:flutter/cupertino.dart';

/*
 * This class takes care of notifying the exercises schedule's UI on whether it should show the default schedule
 * accessible to everyone or a custom one that was possibly provided by a physiotherapist.
 */

class DoubleButtonSwitcher extends ChangeNotifier {
  bool _selected;

  /*
   * Return true if default, false if custom.
   */
  bool get isDefault {
    return _selected == true;
  }

  /*
   * Switch selection only if different from current.
   */
  void _switch(bool choice) {
    if(choice != _selected) {
      _selected = !_selected;
      notifyListeners();
    }
  }

  void toCustom() {
    _switch(false);
  }

  void toDefault() {
    _switch(true);
  }

  DoubleButtonSwitcher() {
    _selected = true;
  }
}
