import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gee/pages/login.dart';

class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  String statusText = " ";

  TextEditingController kullaniciMailKontrolcusu = TextEditingController();
  TextEditingController kullaniciSifreKontrolcusu = TextEditingController();
  TextEditingController kullaniciSifreDogrulayici = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 10, right: 15, left: 15), //Sağdan, soldan ve üstden 10 pixel boşluk bırak
          child: Column(
            children: [
              Text(
                "Kayıt Ol",
                style: TextStyle(fontSize: 36, fontFamily: "Montserrat"),
              ),

              Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                "Aramıza Katıl",
                style: TextStyle(fontSize: 14, fontFamily: "Montserrat"),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 100,
                ),
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: kullaniciMailKontrolcusu, //Kullanıcının yazdığı şifreyi kontrol etmek için bunu kullanıyoruz
                  decoration: InputDecoration(labelText: "Kullanıcı Maili"),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true, //Yazı gizlensin mi
                  obscuringCharacter: "*", //şifreyi gizleyecek karakter *****
                  controller: kullaniciSifreKontrolcusu, //Kullanıcının yazdığı şifreyi kontrol etmek için bunu kullanıyoruz
                  decoration: InputDecoration(labelText: "Şifre Giriniz"),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true, //Yazı gizlensin mi
                  obscuringCharacter: "*", //şifreyi gizleyecek karakter *****
                  controller: kullaniciSifreDogrulayici, //Kullanıcının yazdığı şifreyi kontrol etmek için bunu kullanıyoruz
                  decoration: InputDecoration(labelText: "Şifre Doğrulama"),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(statusText),
              ), //Kullanıcının Mail ve ya şifre hakkında bilgi aldığı element
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextButton(
                  //Giriş Butonu
                  onPressed: () async {},
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(primary: Color.fromRGBO(158, 1, 49, 1)),
                    onPressed: () {
                      if (kullaniciMailKontrolcusu.text.trim() == "") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Mail Boş Olamaz!"),
                        ));
                      } else if (kullaniciSifreDogrulayici.text.trim() == "") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Şifre Boş Olamaz!"),
                        ));
                      } else if (kullaniciSifreDogrulayici.text.trim() != kullaniciSifreKontrolcusu.text.trim()) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Şifreler Eşleşmedi!"),
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Giriş Başarılı"),
                        ));
                      }
                    },
                    icon: Icon(Icons.app_registration, size: 10),
                    label: Text("Kayıt ol"),
                  ),
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
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(primary: Color.fromRGBO(158, 1, 49, 1)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    icon: Icon(Icons.backspace, size: 10),
                    label: Text("Mevcut Hesaba Giriş Yap"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
