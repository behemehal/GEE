import 'package:flutter/material.dart';
import 'package:gee/utils/appPrefences.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/markdown_formatter.dart';

class ProfilPage extends StatefulWidget {
  ProfilPage(this.edit, this.id);
  final bool edit;
  final String id;

  @override
  ProfilPageState createState() => ProfilPageState(
        this.edit,
        this.id,
      );
}

class ProfilPageState extends State<ProfilPage> {
  ProfilPageState(this.edit, this.id);
  final bool edit;
  final String id;

  String detail;
  bool following = false;

  TextEditingController userDetail = TextEditingController();

  Future<Map<String, dynamic>> loadUserData() {
    return Future.sync(() async {
      final response = await http.post('https://gonulluesit.herokuapp.com/getUser',
          body: jsonEncode(
            <String, dynamic>{'mail': this.id},
          ),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          });
      try {
        var data = jsonDecode(response.body);
        if (response.statusCode == 200) {
          if (!this.edit) {
            setState(() {
              following = data["data"]["followers"].contains(appPrefences.getString("mail"));
            });
          }
          userDetail.text = data["data"]["detail"];
          return data;
        } else {
          return data;
        }
      } catch (_) {
        return {'status': 'fail'};
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        actions: [
          if (!this.edit)
            TextButton(
              onPressed: () async {
                final response = await http.post('http://gonulluesit.herokuapp.com/followProfile',
                    body: jsonEncode(
                      <String, dynamic>{
                        "target": this.id,
                        "mail": appPrefences.getString("mail"),
                        "password": appPrefences.getString("pass"),
                      },
                    ),
                    headers: {
                      'Content-type': 'application/json',
                      'Accept': 'application/json',
                    });
                try {
                  var data = jsonDecode(response.body);
                  if (response.statusCode != 200) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Takip etme başarısız"),
                    ));
                    setState(() {
                      following = !following;
                    });
                  }
                } catch (_) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Takip etme başarısız"),
                  ));
                }
              },
              child: Text(following ? "Takibi Bırak" : "Takip Et"),
            )
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
          future: loadUserData(),
          builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data["status"] == "fail") {
                return Center(
                  child: Text("Fail"),
                );
              } else {
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/pictures/user_background.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            child: Container(
                              alignment: Alignment(0.0, 2.5),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  snapshot.data["data"]["accountPhoto"],
                                ),
                                radius: 60.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          snapshot.data["data"]["nameSurname"],
                          style: TextStyle(fontSize: 25.0, color: Colors.blueGrey, letterSpacing: 2.0, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          snapshot.data["data"]["school"],
                          style: TextStyle(fontSize: 18.0, color: Colors.black45, letterSpacing: 2.0, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 10,
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
                              snapshot.data["data"]["accountType"] == 0 ? "Öğrenci" : "Öğretmen",
                              style: TextStyle(letterSpacing: 2.0, fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
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
                                        snapshot.data["data"]["comments"].length.toString(),
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
                                        snapshot.data["data"]["followers"].length.toString(),
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
                                controller: userDetail,
                                minLines: 10,
                                maxLines: 15,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  labelText: 'Bizlere Biraz Kendinden Bahset.',
                                ),
                              ),
                            ),
                          )
                        else
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: MarkdownFormatter(snapshot.data["data"]["detail"]),
                            ),
                          ),
                        if (this.edit)
                          Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 20),
                            child: Center(
                              child: TextButton(
                                onPressed: () async {
                                  final response = await http.post('https://gonulluesit.herokuapp.com/updateDetail',
                                      body: jsonEncode(
                                        <String, dynamic>{'mail': this.id, 'password': appPrefences.getString("pass"), 'detail': userDetail.text},
                                      ),
                                      headers: {
                                        'Content-type': 'application/json',
                                        'Accept': 'application/json',
                                      });
                                  try {
                                    var data = jsonDecode(response.body);
                                    if (response.statusCode == 200) {
                                      if (data["status"] == "ok") {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("Açıklama güncellendi"),
                                        ));
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("Açıklama güncelleme başarısız"),
                                        ));
                                      }
                                    } else {
                                      return data;
                                    }
                                  } catch (_) {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text("Açıklama güncelleme başarısız"),
                                    ));
                                  }
                                },
                                child: Text("Açıklamayı Kaydet"),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                );
              }
            } else {
              return Center(
                child: Text("Loading"),
              );
            }
          }),
      /*
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      */
    );
  }
}
