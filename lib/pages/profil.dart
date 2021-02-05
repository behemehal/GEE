import 'dart:html';

import 'package:flutter/material.dart';
import 'package:gee/pages/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilPage extends StatefulWidget {
  @override
  ProfilPageState createState() => ProfilPageState();
}

class ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: EdgeInsets.only(top: 10, right: 15, left: 15),
        child: Column(
          children: [
            Text(
              "Bir Şeyler Yazın",
              style: TextStyle(fontSize: 36, fontFamily: "Montserrat"),
            )
          ],
        ),
      ),
    ));
  }
}
