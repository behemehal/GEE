import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    super.initState();
  } //Sayfa açıldıkdan sonra bura çalışır

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hakkında"),
        backgroundColor: Color.fromRGBO(130, 8, 41, 1.0),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20, right: 15, left: 15), //Sağdan, soldan ve üstden 10 pixel boşluk bırak
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/pictures/icon.png'),
                ),
                Text(
                  "Gönüllü Eşit Eğitim",
                  style: TextStyle(fontSize: 30, fontFamily: "Montserrat"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
