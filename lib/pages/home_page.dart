import 'package:flutter/material.dart';

import 'package:gee/pages/about.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../pages/profil.dart';
import '../pages/create_post.dart';

import '../components/home_page_components/StateChanger.dart';
import '../components/home_page_components/ActionChip.dart';
import '../components/home_page_components/ProfileButton.dart';
import '../components/home_page_components/CurvedPage.dart';
import '../components/home_page_components/SearchBar.dart';
import '../components/home_page_components/TopicTitle.dart';
import '../components/home_page_components/HomePost.dart';
import '../components/home_page_components/Category.dart';

import '../utils/appPrefences.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var state = CrossFadeState.showFirst;
  var viewGrid = 0;
  var activeCategory = 0;
  var index = 0;

  @override
  void initState() {
    super.initState();
  }

  List<ToolbarActionChipDart> kategoriler = [
    ToolbarActionChipDart(
      tooltip: "Popüler Konuları Görüntüle",
      text: "Popüler Konular",
      active: true,
      icon: Icons.whatshot,
      onPressed: () {},
    ),
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
    )
  ];

  Future<Widget> loadPosts() {
    return Future.sync(() async {
      final response = await http.post('https://gonulluesit.herokuapp.com/getPosts',
          body: jsonEncode(
            <String, dynamic>{"category": activeCategory == 0 ? 0 : activeCategory - 1, "popular": activeCategory == 0},
          ),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          });
      try {
        var data = jsonDecode(response.body);
        if (response.statusCode == 200) {
          var posts = data["data"];
          return Column(
            children: [
              TopicTitle(kategoriler[activeCategory].text),
              if (posts.length == 0)
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Gösterilecek gönderi bulunamadı"),
                )
              else
                for (var pos in posts)
                  HomePost(
                    pos["mail"].toString(),
                    pos["title"],
                    pos["detail"],
                    pos["viewCount"].toString(),
                    pos["comments"].length.toString(),
                    pos["comments"].length != 0,
                    pos["upvote"].length.toString(),
                    pos["downvote"].length.toString(),
                    "",
                    postPicURL: pos["picUrl"],
                  )
            ],
          );
        } else {
          return Column(
            children: [
              TopicTitle("Yükleme Başarısız"),
            ],
          );
        }
      } catch (_) {
        return Column(
          children: [
            TopicTitle("Yükleme Başarısız"),
          ],
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutPage()),
            ),
            icon: Icon(Icons.info),
          )
        ],
        title: Row(
          children: [
            ProfileButton(appPrefences.getString("mail"), true),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Gönüllü Eşit Eğitim",
                style: TextStyle(
                  fontFamily: "Montserrat",
                ),
              ),
            )
          ],
        ),
        backgroundColor: Color.fromRGBO(130, 8, 41, 1.0),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreatePost(
              false,
              "postID",
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(130, 8, 41, 1.0),
        child: Icon(Icons.add),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: new BoxDecoration(
          color: Color.fromRGBO(130, 8, 41, 1.0),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              height: 30,
              child: Builder(
                builder: (context2) => Row(
                  children: [
                    StateChanger(
                      state == CrossFadeState.showFirst,
                      () {
                        setState(() {
                          if (state == CrossFadeState.showFirst) {
                            state = CrossFadeState.showSecond;
                          } else {
                            state = CrossFadeState.showFirst;
                          }
                        });
                      },
                    ),
                    AnimatedCrossFade(
                      firstCurve: Curves.easeInToLinear,
                      secondCurve: Curves.easeInToLinear,
                      duration: Duration(
                        milliseconds: 1,
                      ),
                      crossFadeState: state,
                      firstChild: Category(
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
                          71),
                      secondChild: SearchBar(state != CrossFadeState.showFirst),
                    )
                  ],
                ),
              ),
            ),
            CurvedPage(
              SingleChildScrollView(
                child: FutureBuilder<Widget>(
                  future: loadPosts(),
                  builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*

*/
