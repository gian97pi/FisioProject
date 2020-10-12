// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:fisioproject/classes/double_button_switcher.dart';
import 'package:fisioproject/ui/views/selezione_giorno.dart';
import 'package:fisioproject/values/colors.dart';

class ScheduleDoubleButton extends StatelessWidget {

  DoubleButtonSwitcher buttonSwitcher;

  ScheduleDoubleButton(DoubleButtonSwitcher buttonSwitcher) {
    this.buttonSwitcher = buttonSwitcher;
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(0,20,0,0),
      child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            FlatButton (
              onPressed: (){
                  buttonSwitcher.toDefault();
              },
              padding: EdgeInsets.symmetric(horizontal: 0.0),

              child: Container(
                width: 145,
                decoration: !buttonSwitcher.isDefault
               ? BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(41, 0, 0, 0),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30)
                  ),
                )

               : BoxDecoration(
                  color: AppColors.primaryText,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(41, 0, 0, 0),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30)
                  ),
                ),

                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8,12,8,12),
                  child: Text(
                    "PREDEFINITA",
                      textAlign: TextAlign.center,
                    style: !buttonSwitcher.isDefault
                      ? TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 12,
                        fontFamily: "Rubik",
                    )
                        : TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: "Rubik",
                      fontWeight: FontWeight.w500,
                    )
                  ),
                ),
              ),
            ),

            FlatButton(
              onPressed: () {
                  buttonSwitcher.toCustom();
              },
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              child: Container(
                width: 145,
                decoration: buttonSwitcher.isDefault
                    ? BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(41, 0, 0, 0),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30)
                  ),
                )

                    : BoxDecoration(
                  color: AppColors.primaryText,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(41, 0, 0, 0),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30)
                  ),
                ),

                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8,12,8,12),
                  child: Text(
                      "PERSONALIZZATA",
                      textAlign: TextAlign.center,
                      style: buttonSwitcher.isDefault
                          ? TextStyle(
                        color: AppColors.primaryText,
                          fontSize: 12,
                          fontFamily: "Rubik",
                        fontWeight: FontWeight.w500,
                      )
                          : TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: "Rubik"
                      )
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}

