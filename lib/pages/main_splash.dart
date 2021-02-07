import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gee/utils/appPrefences.dart';

import 'login.dart';
import 'register.dart';
import 'profil.dart';
import 'home_page.dart';
import 'post_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  bool logoVisible = false;
  bool visible = false;
  bool visible2 = false;
  bool visible3 = false;

  AnimationController slideController;
  Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();

    slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    slideAnimation =
        Tween<Offset>(begin: Offset(0, 1.2), end: Offset(0.0, 0.0)).animate(CurvedAnimation(parent: slideController, curve: Curves.linear));

    Timer(Duration(milliseconds: 650), () {
      setState(() {
        logoVisible = true;
      });
      slideController.forward();
      Timer(Duration(milliseconds: 250), () {
        setState(() {
          visible = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height / 4) - 50),
          child: Column(
            children: [
              SlideTransition(
                position: slideAnimation,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 700),
                  opacity: logoVisible ? 1 : 0,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Image(
                      image: AssetImage('assets/pictures/icon.png'),
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                opacity: visible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 750),
                onEnd: () {
                  setState(() {
                    visible2 = true;
                  });
                },
                child: Container(
                  width: 171,
                  child: Text(
                    "Gönüllü",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 43,
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                opacity: visible2 ? 1.0 : 0.0,
                duration: Duration(milliseconds: 700),
                onEnd: () {
                  setState(() {
                    visible3 = true;
                  });
                },
                child: Container(
                  width: 171,
                  child: Text(
                    "Eşit",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 43,
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                opacity: visible3 ? 1.0 : 0.0,
                duration: Duration(milliseconds: 700),
                onEnd: () {
                  Timer(Duration(seconds: 1), () {
                    if (appPrefences.containsKey("mail")) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    }
                  });
                },
                child: Container(
                  width: 171,
                  child: Text(
                    "Eğitim",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 43,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
