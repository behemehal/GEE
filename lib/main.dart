import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gee/pages/post_page.dart';

import './utils/appPrefences.dart';

//Sayfalar
import 'pages/main_splash.dart';
import 'pages/home_page.dart';
import './components/login_components/imagepicker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPrefences().init();

  runApp(
    MaterialApp(
      title: 'GEE',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(130, 8, 41, 1.0),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: Color.fromRGBO(100, 100, 100, 1),
          ),
          focusColor: Color.fromRGBO(100, 100, 100, 1),
          hintStyle: TextStyle(
            color: Color.fromRGBO(100, 100, 100, 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
              color: Color.fromRGBO(100, 100, 100, 1),
              width: 0.8,
            ),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color.fromRGBO(100, 100, 100, 1),
        ),
      ),
      home: SplashScreen(),
    ),
  );
}
//Main red #820829