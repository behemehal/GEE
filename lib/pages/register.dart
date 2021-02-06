import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          padding: EdgeInsets.only(
              top: 10,
              right: 15,
              left: 15), //Sağdan, soldan ve üstden 10 pixel boşluk bırak
          child: Column(
            children: [
              Text(
                "Kayıt Ol",
                style: TextStyle(fontSize: 36, fontFamily: "Montserrat"),
              ),

              Text(
                "Aramıza Katıl",
                style: TextStyle(fontSize: 14, fontFamily: "Montserrat"),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller:
                      kullaniciMailKontrolcusu, //Kullanıcının yazdığı şifreyi kontrol etmek için bunu kullanıyoruz
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.redAccent[700], width: 0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(1.0)),
                        borderSide: BorderSide(color: Colors.red, width: 0.8),
                      ),
                      labelText: "Kullanıcı Maili"),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true, //Yazı gizlensin mi
                  obscuringCharacter: "*", //şifreyi gizleyecek karakter *****
                  controller:
                      kullaniciSifreKontrolcusu, //Kullanıcının yazdığı şifreyi kontrol etmek için bunu kullanıyoruz
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.redAccent[700], width: 0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(1.0)),
                        borderSide: BorderSide(color: Colors.red, width: 0.8),
                      ),
                      labelText: "Şifre Giriniz"),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true, //Yazı gizlensin mi
                  obscuringCharacter: "*", //şifreyi gizleyecek karakter *****
                  controller:
                      kullaniciSifreDogrulayici, //Kullanıcının yazdığı şifreyi kontrol etmek için bunu kullanıyoruz
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.redAccent[700], width: 0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(1.0)),
                        borderSide: BorderSide(color: Colors.red, width: 0.8),
                      ),
                      labelText: "Şifre Doğrulama"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(statusText),
              ), //Kullanıcının Mail ve ya şifre hakkında bilgi aldığı element
              TextButton(
                  //Giriş Butonu
                  onPressed: () async {
                    if (kullaniciMailKontrolcusu.text.trim() == "") {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Mail Boş Olamaz!"),
                      ));
                    } else if (kullaniciSifreDogrulayici.text.trim() == "") {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Şifre Boş Olamaz!"),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Giriş Başarılı"),
                      ));
                    }
                  },
                  child: Text(
                    "Kayıt Ol",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(158, 1, 49, 1)),
                  )),

              Text("veya"),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Mevcut Hesaba Giriş Yap",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(158, 1, 49, 1)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
