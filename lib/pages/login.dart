import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gee/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register.dart';
import 'package:http/http.dart' as http;
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

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
            child: Form(
              key: _formKey,
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
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Burası boş bırakılamaz';
                        }
                        return null;
                      },
                      controller: kullaniciMailKontrolcusu, //Kullanıcının yazdığı şifreyi kontrol etmek için bunu kullanıyoruz
                      decoration: InputDecoration(labelText: "Kullanıcı Mail"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Burası boş bırakılamaz';
                        }
                        return null;
                      },
                      obscureText: true, //Yazı gizlensin mi
                      obscuringCharacter: "*", //şifreyi gizleyecek karakter *****
                      controller: kullaniciSifreKontrolcusu, //Kullanıcının yazdığı şifreyi kontrol etmek için bunu kullanıyoruz
                      decoration: InputDecoration(labelText: "Kullanıcı Şifresi"),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(primary: Color.fromRGBO(158, 1, 49, 1)),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        final response = await http.post(
                          'http://localhost/login',
                          body: jsonEncode(
                            <String, dynamic>{
                              'mail': kullaniciMailKontrolcusu.text,
                              'password': kullaniciSifreKontrolcusu.text,
                            },
                          ),
                        );
                        try {
                          var data = jsonDecode(response.body);
                          if (response.statusCode == 200) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(data["code"].toString()),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(data["code"].toString()),
                            ));
                          }
                        } catch (_) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Sunucu hatası, bağlantı başarısız"),
                          ));
                        }
                      }
                      /*
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                      */
                    },
                    icon: Icon(Icons.login, size: 12),
                    label: Text("Giriş Yap", style: TextStyle(fontSize: 12.0, color: Colors.white)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Veya",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: Color.fromRGBO(100, 100, 100, 1),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(primary: Color.fromRGBO(158, 1, 49, 1)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    },
                    icon: Icon(Icons.app_registration, size: 12),
                    label: Text("Kayıt ol", style: TextStyle(fontSize: 12.0, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
