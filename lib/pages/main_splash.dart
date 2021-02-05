import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Text("Gönüllü"),
              Text("Eşit"),
              Text("Eğitim"),
            ],
          ),
        ),
      ),
    );
  }
}
