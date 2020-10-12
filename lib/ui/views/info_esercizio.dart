import 'package:fisioproject/ui/elements/video_player.dart';
import 'package:fisioproject/values/colors.dart';
import 'package:flutter/material.dart';

class InfoEsercizio extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "INDIETRO",
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "AGGIUNGI",
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/container_bg.png'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30)
                        ),
                        child: VideoPlayer("https://www.youtube.com/watch?v=aRsWk4JZa5k")
                        // child: Image(
                        //   image: AssetImage("assets/images/french_curl.png"),
                        //   fit: BoxFit.fill,
                        // ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 0.0, 8.0),
                        child: Text("French Curl",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          ),
                        ),
                      )
                    ],
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(41, 0, 0, 0),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                ),


                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Text(
                          "DIFFICOLTÀ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16,0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(41, 0, 0, 0),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 12, 0, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "DESCRIZIONE",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscin \nelit, sed do eiusmod tempor incididunt ut labore et \ndolore magna aliqua. Ut enim ad minim veniam, \nquis nostrud exercitation ullamco laboris nisi ut \naliquip ex ea commodo \nconsequat.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}