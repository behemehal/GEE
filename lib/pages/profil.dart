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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://c4.wallpaperflare.com/wallpaper/480/423/714/nissan-black-gtr34-wallpaper-preview.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                width: double.infinity,
                height: 200,
                child: Container(
                  alignment: Alignment(0.0, 2.5),
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage("https://i.hizliresim.com/QCpifz.png"),
                    radius: 60.0,
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
