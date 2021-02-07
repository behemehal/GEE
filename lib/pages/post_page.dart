import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gee/utils/appPrefences.dart';
import 'package:http/http.dart' as http;

import '../components/home_page_components/ProfileButton.dart';
import '../utils/markdown_formatter.dart';

import '../pages/create_post.dart';

class PostPage extends StatefulWidget {
  PostPage(this.id, this.mail);
  String id;
  String mail;
  @override
  PostPageState createState() => PostPageState(this.id, this.mail);
}

class PostPageState extends State<PostPage> {
  PostPageState(this.id, this.mail);
  String id;
  String mail;

  TextEditingController commentController = TextEditingController();

  bool upVoted = false;
  bool downVoted = false;
  bool userPost = false;
  int totalUpVote = 0;
  int totalDownVote = 0;

  Future<Map<String, dynamic>> loadUserData() {
    return Future.sync(() async {
      final response = await http.post('https://gonulluesit.herokuapp.com/getPost',
          body: jsonEncode(
            <String, dynamic>{'id': this.id},
          ),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          });
      try {
        var data = jsonDecode(response.body);
        if (response.statusCode == 200) {
          userPost = data["data"]["mail"] == appPrefences.getString("mail");
          upVoted = data["data"]["upvote"].contains(appPrefences.getString("mail"));
          downVoted = data["data"]["downvote"].contains(appPrefences.getString("mail"));
          totalUpVote = data["data"]["upvote"].length;
          totalDownVote = data["data"]["downvote"].length;
          return data;
        } else {
          return data;
        }
      } catch (_) {
        return {'status': 'fail'};
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gönderi"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreatePost(true, this.id),
                ),
              );
            },
            child: Text("Gönderiyi Düzenle"),
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: loadUserData(),
        builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data["status"] == "fail") {
              return Center(
                child: Text(
                  "Yükleme Başarısız",
                  style: TextStyle(fontSize: 19, fontFamily: "Montserrat"),
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    if (snapshot.data["data"]["picUrl"] != null && snapshot.data["data"]["picUrl"] != "")
                      Image.network(
                        snapshot.data["data"]["picUrl"],
                        errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                          return Image.asset("assets/pictures/non_photo.png");
                        },
                      ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 9,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 5, bottom: 10),
                                  child: Text(
                                    snapshot.data["data"]["title"],
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 22, fontFamily: "MontSerrat"),
                                  ),
                                ),
                                MarkdownFormatter(
                                  snapshot.data["data"]["detail"],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 20,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      totalUpVote.toString(),
                                      style: TextStyle(
                                        color: Colors.green,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        final response = await http.post('https://gonulluesit.herokuapp.com/upVote',
                                            body: jsonEncode(
                                              <String, dynamic>{
                                                'id': this.id,
                                                'mail': appPrefences.getString("mail"),
                                                'password': appPrefences.getString("pass")
                                              },
                                            ),
                                            headers: {
                                              'Content-type': 'application/json',
                                              'Accept': 'application/json',
                                            });
                                        try {
                                          var data = jsonDecode(response.body);
                                          if (response.statusCode == 200) {
                                            setState(() {
                                              if (data["message"] == "removed") {
                                                totalUpVote--;
                                                upVoted = false;
                                              } else {
                                                totalUpVote++;
                                                upVoted = true;
                                              }
                                            });

                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                              content: Text(data["code"]),
                                            ));
                                          } else {
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                              content: Text(data["code"]),
                                            ));
                                          }
                                        } catch (_) {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                            content: Text("Oy gönderimi başarısız"),
                                          ));
                                        }
                                      },
                                      child: Icon(
                                        Icons.arrow_upward,
                                        color: upVoted ? Colors.green : Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      totalDownVote.toString(),
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        final response = await http.post('https://gonulluesit.herokuapp.com/downVote',
                                            body: jsonEncode(
                                              <String, dynamic>{
                                                'id': this.id,
                                                'mail': appPrefences.getString("mail"),
                                                'password': appPrefences.getString("pass")
                                              },
                                            ),
                                            headers: {
                                              'Content-type': 'application/json',
                                              'Accept': 'application/json',
                                            });
                                        try {
                                          var data = jsonDecode(response.body);
                                          if (response.statusCode == 200) {
                                            setState(() {
                                              if (data["message"] == "removed") {
                                                totalDownVote--;
                                                downVoted = false;
                                              } else {
                                                totalDownVote++;
                                                downVoted = true;
                                              }
                                            });

                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                              content: Text(data["code"]),
                                            ));
                                          } else {
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                              content: Text(data["code"]),
                                            ));
                                          }
                                        } catch (_) {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                            content: Text("Oy gönderimi başarısız"),
                                          ));
                                        }
                                      },
                                      child: Icon(
                                        Icons.arrow_downward,
                                        color: downVoted ? Colors.red : Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (snapshot.data["data"]["comments"].length == 0)
                                  Card(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text(
                                            'Bu gönderide yorum yok',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                else
                                  for (var comment in snapshot.data["data"]["comments"])
                                    Card(
                                      child: Column(
                                        children: [
                                          ListTile(
                                            leading: ProfileButton(comment["mail"], false),
                                            title: Text(comment["nameSurname"]),
                                            subtitle: Text(comment["content"]),
                                          )
                                        ],
                                      ),
                                    ),
                              ],
                            ),
                            Card(
                              child: Column(
                                children: [
                                  TextField(
                                    controller: commentController,
                                    onSubmitted: (e) async {
                                      final response = await http.post('http://localhost/addComment',
                                          body: jsonEncode(
                                            <String, dynamic>{
                                              'mail': appPrefences.getString("mail"),
                                              'password': appPrefences.getString("pass"),
                                              'content': commentController.text,
                                              'id': this.id,
                                            },
                                          ),
                                          headers: {
                                            'Content-type': 'application/json',
                                            'Accept': 'application/json',
                                          });
                                      try {
                                        var data = jsonDecode(response.body);
                                        if (response.statusCode == 200) {
                                          commentController.text = "";
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                            content: Text(data["code"]),
                                          ));
                                          setState(() {});
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                            content: Text(data["code"]),
                                          ));
                                        }
                                      } catch (_) {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("Yorum gönderilmedi"),
                                        ));
                                      }
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Yorum ekle",
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      border: InputBorder.none,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
