import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gee/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String statusText = " ";

  TextEditingController kullaniciMailKontrolcusu = TextEditingController();
  TextEditingController kullaniciSifreKontrolcusu = TextEditingController();
  @override
  void initState() {
    super.initState();
  } //Sayfa açıldıkdan sonra bura çalışır

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20, right: 15, left: 15), //Sağdan, soldan ve üstden 10 pixel boşluk bırak
            child: Column(
              children: [
                Text(
                  "Hoşgeldin",
                  style: TextStyle(fontSize: 36, fontFamily: "Montserrat"),
                ),

                Padding(
                  child: Text(
                    "Devam Etmek İçin Giriş Yap",
                    style: TextStyle(fontSize: 14, fontFamily: "Montserrat"),
                  ),
                  padding: EdgeInsets.only(top: 22),
                ),
                Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 6),
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: kullaniciMailKontrolcusu, //Kullanıcının yazdığı şifreyi kontrol etmek için bunu kullanıyoruz
                    decoration: InputDecoration(labelText: "Kullanıcı Mail"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    obscureText: true, //Yazı gizlensin mi
                    obscuringCharacter: "*", //şifreyi gizleyecek karakter *****
                    controller: kullaniciSifreKontrolcusu, //Kullanıcının yazdığı şifreyi kontrol etmek için bunu kullanıyoruz
                    decoration: InputDecoration(labelText: "Kullanıcı Şifresi"),
                  ),
                ),

                Text(statusText), //Kullanıcının Mail ve ya şifre hakkında bilgi aldığı element
                TextButton(
                    //Giriş Butonu

                    onPressed: () async {
                      if (kullaniciMailKontrolcusu.text.trim() == "") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Mail Boş Olamaz!."),
                        ));
                      } else if (kullaniciSifreKontrolcusu.text.trim() == "") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Sifre Boş Olamaz!."),
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Giriş Başarılı."),
                        ));
                      }
                    },
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                      child: Text(
                        "Giriş Yap",
                        style: TextStyle(fontSize: 12.0, color: Color.fromRGBO(158, 1, 49, 1)),
                      ),
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Kayıt Ol",
                    style: TextStyle(fontSize: 12.0, color: Color.fromRGBO(158, 1, 49, 1)),
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
