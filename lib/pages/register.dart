import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  String statusText = "Lütfen mail ve şifre girin";

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
                style: TextStyle(fontSize: 20),
              ),
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
              TextField(
                //Kullanıcı şifre girişi
                obscureText: true, //Yazı gizlensin mi
                obscuringCharacter: "*", //şifreyi gizleyecek karakter *****
                controller:
                    kullaniciSifreDogrulayici, //Kullanıcının yazdığı şifreyi kontrol etmek için bunu kullanıyoruz
                decoration:
                    InputDecoration(labelText: "Kullanıcı Şifresini Doğrula"),
              ),
              Text(
                  statusText), //Kullanıcının Mail ve ya şifre hakkında bilgi aldığı element
              TextButton(
                //Giriş Butonu
                onPressed: () async {
                  var appPrefences = await SharedPreferences.getInstance();

                  if (kullaniciSifreKontrolcusu.text ==
                      kullaniciSifreDogrulayici.text) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Kayıt Başarılı."),
                    ));
                    appPrefences.setString(kullaniciMailKontrolcusu.text,
                        kullaniciSifreKontrolcusu.text);
                    Navigator.of(context, rootNavigator: true)
                        .pop(); //Geri gitme
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Şifreniz Doğrulanamadı."),
                    ));
                  }
                },
                child: Text("Kayıt Ol"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
