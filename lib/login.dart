import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String statusText = "Lütfen Mail ve Şifre Girin";

  TextEditingController kullaniciMailKontrolcusu = TextEditingController();
  TextEditingController kullaniciSifreKontrolcusu = TextEditingController();
  @override
  void initState() {
    super.initState();
    //Sayfa açıldıkdan sonra bura çalışır
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.8),
        title: Text("Agalar'la kod'a giriş yap"),
      ),
      body: Container(
        color: Color.fromRGBO(112, 107, 139, 1.0),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
                top: 10,
                right: 15,
                left: 15), //Sağdan, soldan ve üstden 10 pixel boşluk bırak
            child: Column(
              children: [
                Text("Giriş Yap"),
                TextField(
                  //Kullanıcı mail girişi
                  controller:
                      kullaniciMailKontrolcusu, //Kullanıcının yazdığı maili kontrol etmek için bunu kullanıyoruz
                  decoration: InputDecoration(labelText: "Kullanıcı Maili"),
                ),
                TextField(
                  //Kullanıcı şifre girişi
                  obscureText: true, //Yazı gizlensin mi
                  obscuringCharacter: "*", //şifreyi gizleyecek karakter *****
                  controller:
                      kullaniciSifreKontrolcusu, //Kullanıcının yazdığı şifreyi kontrol etmek için bunu kullanıyoruz
                  decoration: InputDecoration(labelText: "Kullanıcı Şifresi"),
                ),
                Text(
                    statusText), //Kullanıcının Mail ve ya şifre hakkında bilgi aldığı element
                TextButton(
                  //Giriş Butonu
                  onPressed: () async {
                    var appPrefences = await SharedPreferences.getInstance();
                    if (appPrefences
                        .containsKey(kullaniciMailKontrolcusu.text)) {
                      if (kullaniciSifreKontrolcusu.text ==
                          appPrefences
                              .getString(kullaniciMailKontrolcusu.text)) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Giriş Başarılı."),
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Giriş Başarısız."),
                        ));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text("Geçerli Mail İle Eşleşen Hesap Bulunamadı."),
                      ));
                    }
                  },
                  child: Text("Giriş Yap"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Yeni Hesap Oluştur"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Hesapları Görüntüle."),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
