import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gee/pages/home_page.dart';
import 'package:gee/utils/markdown_formatter.dart';

import '../components/home_page_components/ActionChip.dart';
import '../components/home_page_components/Category.dart';

import 'package:http/http.dart' as http;
import '../utils/appPrefences.dart';

class CreatePost extends StatefulWidget {
  CreatePost(
    this.edit,
    this.postID,
  );
  bool edit;
  String postID;

  @override
  CreatePostState createState() => CreatePostState(
        this.edit,
        this.postID,
      );
}

class CreatePostState extends State<CreatePost> {
  CreatePostState(this.edit, this.postID);
  bool edit;
  String postID;
  var activeCategory = 0;

  TextEditingController title = TextEditingController();
  TextEditingController detail = TextEditingController();
  TextEditingController kapakUrl = TextEditingController();
  TextEditingController tag = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<ToolbarActionChipDart> kategoriler = [
    ToolbarActionChipDart(
      tooltip: "Ödev Yardım",
      text: "Ödev Yardım",
      active: false,
      icon: Icons.support,
      onPressed: () {},
    ),
    ToolbarActionChipDart(
      tooltip: "Kampüs Hakkında",
      text: "Kampüs Hakkında",
      active: false,
      icon: Icons.home,
      onPressed: () {},
    ),
    ToolbarActionChipDart(
      tooltip: "Bölüm Hakkında",
      text: "Bölüm Hakkında",
      active: false,
      icon: Icons.question_answer,
      onPressed: () {},
    ),
    ToolbarActionChipDart(
      tooltip: "Sohbet",
      text: "Sohbet",
      active: false,
      icon: Icons.mail,
      onPressed: () {},
    ),
    ToolbarActionChipDart(
      tooltip: "Klüp Etkinlikleri",
      text: "Klüp Etkinlikleri",
      active: false,
      icon: Icons.group,
      onPressed: () {},
    )
  ];

  @override
  void initState() {
    super.initState();
    detail.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.edit ? "Postu Düzenle" : "Post Oluştur"),
        backgroundColor: Color.fromRGBO(130, 8, 41, 1.0),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Container(
                    width: 300,
                    height: 150,
                    color: Color.fromRGBO(100, 100, 100, 1),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 66,
                            color: Colors.white,
                          ),
                          Text(
                            "Resim Eklemek İçin Tıkla",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: TextFormField(
                    controller: kapakUrl,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Kapak fotoğrafı URL',
                    ),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Burası boş bırakılamaz';
                    }
                    return null;
                  },
                  controller: title,
                  decoration: InputDecoration(
                    labelText: "Başlık",
                  ),
                  maxLength: 26,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Burası boş bırakılamaz';
                      }
                      return null;
                    },
                    controller: detail,
                    maxLines: 8,
                    maxLength: 300,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Detay gir',
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text("Kategori"),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Category(
                      kategoriler
                          .asMap()
                          .map((index, element) {
                            element.onPressed = () {
                              setState(() {
                                activeCategory = index;
                              });
                            };
                            element.active = index == activeCategory;
                            return MapEntry(index, element.build(context));
                          })
                          .values
                          .toList(),
                      30),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Ön izleme",
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromRGBO(100, 100, 100, .3),
                  height: 250,
                  child: MarkdownFormatter(detail.text),
                ),
                Container(
                  padding: EdgeInsets.only(top: 50, bottom: 20),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(primary: Color.fromRGBO(158, 1, 49, 1)),
                    onPressed: () async {
                      final response = await http.post('https://gonulluesit.herokuapp.com/createPost',
                          body: jsonEncode(
                            <String, dynamic>{
                              'mail': appPrefences.getString("mail"),
                              'password': appPrefences.getString("pass"),
                              "picUrl": kapakUrl.text.trim(),
                              'title': title.text.trim(),
                              'detail': detail.text.trim(),
                              'category': activeCategory,
                              'edit': this.edit ? this.postID : "",
                            },
                          ),
                          headers: {
                            'Content-type': 'application/json',
                            'Accept': 'application/json',
                          });
                      if (_formKey.currentState.validate()) {
                        try {
                          var data = jsonDecode(response.body);
                          if (response.statusCode == 200) {
                            if (data["status"] == "ok") {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Post gönderildi"),
                              ));
                              Navigator.of(context).pop();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Post gönderimi başarısız"),
                              ));
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Post gönderimi başarısız"),
                            ));
                          }
                        } catch (_) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Post gönderimi başarısız"),
                          ));
                        }
                      }
                    },
                    icon: Icon(Icons.send, size: 12),
                    label: Text(
                      "Gönder",
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
