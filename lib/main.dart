import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Sayfalar
import 'pages/main_splash.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //var languageRawJSON = await rootBundle.loadString("assets/pictures/icon.png");
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    ),
  );
}
