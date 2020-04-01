
import 'package:fisioproject/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:fisioproject/classes/double_buttons_model.dart';
import 'package:fisioproject/ui/views/selezione_giorno.dart';
import 'package:provider/provider.dart';


class PressedButton extends StatelessWidget {

  ButtonsModel buttonSelected;

  PressedButton(ButtonsModel buttonSelected ){
    this.buttonSelected = buttonSelected;
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
                  buttonSelected.change(true);
              },
              padding: EdgeInsets.symmetric(horizontal: 0.0),

              child: Container(
                width: 145,
                decoration: !buttonSelected.default_selected
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
                    style: !buttonSelected.default_selected
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
                  buttonSelected.change(false);
              },
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              child: Container(
                width: 145,
                decoration: buttonSelected.default_selected
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
                      style: buttonSelected.default_selected
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

