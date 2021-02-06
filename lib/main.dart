import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Sayfalar
import 'pages/main_splash.dart';
import 'pages/home_page.dart';
import './components/login_components/imagepicker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //var languageRawJSON = await rootBundle.loadString("assets/pictures/icon.png");
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
      home: MyHomePage(),
    ),
  );
}
//Main red #820829