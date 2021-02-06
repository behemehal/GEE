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
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "Gönüllü Eşit Eğitim",
                    style: TextStyle(fontSize: 30, fontFamily: "Montserrat"),
                  ),
                ),
                Text(
                  "Oğuzhan Saday",
                  style: TextStyle(fontSize: 14, fontFamily: "Montserrat"),
                ),
                Text(
                  "Besim Mert Aydar",
                  style: TextStyle(fontSize: 14, fontFamily: "Montserrat"),
                ),
                Text(
                  "Ahmetcan Aksu",
                  style: TextStyle(fontSize: 14, fontFamily: "Montserrat"),
                ),
                Text(
                  "Tuna Durmaz",
                  style: TextStyle(fontSize: 14, fontFamily: "Montserrat"),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        subtitle: Text(
                            " Bu uygululama öğrencilerin aynı bilgiyi eşit imkanlarla ücretsiz olarak ulaşabilmeleri ve gerektiğinde uzman kişiler ile bağlantı kurabilecekleri bir platfor kurmayı amaçlamaktadır."),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
