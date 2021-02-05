import 'package:flutter/material.dart';

//Sayfalar
import './pages/main_splash.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    ),
  );
}
