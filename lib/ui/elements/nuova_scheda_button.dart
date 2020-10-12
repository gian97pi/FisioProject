// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:fisioproject/ui/views/selezione_giorno.dart';
import 'package:fisioproject/values/colors.dart';

class NewSchedaButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(

      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            FlatButton(
                child: Container(
                  height: 60,
                  width: 60,
                  child: Image(
                    image: AssetImage("assets/images/plus.png"),
                  ),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context) => SelezioneGiorno()));
                }
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0,8,0,0),
                child: Text(
                  "CREA LA TUA SCHEDA \nPERSONALIZZATA",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
