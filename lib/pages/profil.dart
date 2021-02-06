import 'package:flutter/material.dart';
import 'package:gee/pages/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilPage extends StatefulWidget {
  ProfilPage(this.edit);
  bool edit;
  @override
  ProfilPageState createState() => ProfilPageState(this.edit);
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    //ToDO
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
            splashColor: Colors.orangeAccent,
            onTap: onTap,
            child: Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(icon),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                        ),
                        Text(
                          text,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_right)
                  ],
                ))),
      ),
    );
  }
}

class ProfilPageState extends State<ProfilPage> {
  ProfilPageState(this.edit);
  bool edit;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Column(
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage("https://i.hizliresim.com/QCpifz.png"),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Oğuzhan Saday",
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  ],
                )),
            ListTile(
              title: Text('Ayarlar'),
              trailing: Icon(Icons.settings),
              onTap: () {},
            ),
            ListTile(
              title: Text('Kaydedilenler'),
              trailing: Icon(Icons.bookmark),
              onTap: () {},
            ),
            ListTile(
              title: Text('Çıkış Yap'),
              trailing: Icon(Icons.logout),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("https://c4.wallpaperflare.com/wallpaper/480/423/714/nissan-black-gtr34-wallpaper-preview.jpg"),
                        fit: BoxFit.cover)),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  child: Container(
                    alignment: Alignment(0.0, 2.5),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("https://i.hizliresim.com/QCpifz.png"),
                      radius: 60.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "Oğuzhan SADAY",
                style: TextStyle(fontSize: 25.0, color: Colors.blueGrey, letterSpacing: 2.0, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "İstanbul,Ataşehir",
                style: TextStyle(fontSize: 18.0, color: Colors.black45, letterSpacing: 2.0, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Işık Universitesi",
                style: TextStyle(fontSize: 15.0, color: Colors.black45, letterSpacing: 2.0, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 6,
              ),
              Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                  elevation: 2.0,
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                      child: Text(
                        "Öğrenci",
                        style: TextStyle(letterSpacing: 2.0, fontWeight: FontWeight.w300),
                      ))),
              SizedBox(
                height: 10,
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Cevaplar",
                              style: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "15",
                              style: TextStyle(color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Takipçi",
                              style: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "5",
                              style: TextStyle(color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (this.edit)
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      minLines: 10,
                      maxLines: 15,
                      autocorrect: false,
                      decoration: InputDecoration(
                          hintText: 'Bizlere Biraz Kendinden Bahset.',
                          filled: true,
                          fillColor: Color(0xFFDBEDFF),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          )),
                    ),
                  ),
                )
              else
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RichText(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
