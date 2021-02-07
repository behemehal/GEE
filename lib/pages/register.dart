import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:gee/pages/login.dart';
import 'package:gee/pages/home_page.dart';
import '../utils/appPrefences.dart';

class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool onRequest = false;

  TextEditingController kullaniciIsimKontrolcusu = TextEditingController();
  TextEditingController kullaniciOkulKontrolcusu = TextEditingController();
  TextEditingController kullaniciMailKontrolcusu = TextEditingController();
  TextEditingController kullaniciSifreKontrolcusu = TextEditingController();
  TextEditingController kullaniciSifreDogrulayici = TextEditingController();
  int accountType = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 10, right: 15, left: 15),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Kayıt Ol",
                    style: TextStyle(fontSize: 36, fontFamily: "Montserrat"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      "Aramıza Katıl",
                      style: TextStyle(fontSize: 14, fontFamily: "Montserrat"),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 50),
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Burası boş bırakılamaz';
                        }
                        return null;
                      },
                      controller: kullaniciIsimKontrolcusu,
                      decoration: InputDecoration(
                        labelText: "İsim Soyisim",
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Burası boş bırakılamaz';
                        }
                        return null;
                      },
                      controller: kullaniciOkulKontrolcusu,
                      decoration: InputDecoration(
                        labelText: "Okul",
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: kullaniciMailKontrolcusu,
                      decoration: InputDecoration(labelText: "Kullanıcı Maili"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Burası boş bırakılamaz';
                        }
                        return null;
                      },
                      obscureText: true,
                      obscuringCharacter: "*",
                      controller: kullaniciSifreKontrolcusu,
                      decoration: InputDecoration(
                        labelText: "Şifre Giriniz",
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Burası boş bırakılamaz';
                        }
                        return null;
                      },
                      obscureText: true,
                      obscuringCharacter: "*",
                      controller: kullaniciSifreDogrulayici,
                      decoration: InputDecoration(
                        labelText: "Şifre Doğrulama",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(primary: Color.fromRGBO(158, 1, 49, 1)),
                      onPressed: onRequest
                          ? null
                          : () async {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  onRequest = true;
                                });
                                final response = await http.post('https://gonulluesit.herokuapp.com/register',
                                    body: jsonEncode(
                                      <String, dynamic>{
                                        'mail': kullaniciMailKontrolcusu.text,
                                        'nameSurname': kullaniciIsimKontrolcusu.text,
                                        'school': kullaniciOkulKontrolcusu.text,
                                        'password': kullaniciSifreDogrulayici.text,
                                        'accountType': accountType
                                      },
                                    ),
                                    headers: {
                                      'Content-type': 'application/json',
                                      'Accept': 'application/json',
                                    });
                                try {
                                  var data = jsonDecode(response.body);
                                  if (response.statusCode == 200) {
                                    appPrefences.setString("mail", kullaniciMailKontrolcusu.text);
                                    appPrefences.setString("pass", kullaniciSifreKontrolcusu.text);
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text(data["code"].toString()),
                                    ));
                                    Timer(Duration(seconds: 1), () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomePage(),
                                        ),
                                      );
                                    });
                                  } else {
                                    Timer(Duration(seconds: 1), () {
                                      setState(() {
                                        onRequest = false;
                                      });
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text(data["code"].toString()),
                                    ));
                                  }
                                } catch (_) {
                                  Timer(Duration(seconds: 1), () {
                                    setState(() {
                                      onRequest = false;
                                    });
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("Sunucu hatası, bağlantı başarısız"),
                                  ));
                                }
                              }
                            },
                      icon: Icon(Icons.app_registration, size: 10),
                      label: Text("Kayıt ol"),
                    ),
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
                    onPressed: onRequest
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                    icon: Icon(Icons.backspace, size: 10),
                    label: Text("Mevcut Hesaba Giriş Yap"),
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
