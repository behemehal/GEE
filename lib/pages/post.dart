import 'package:flutter/material.dart';
import 'package:gee/components/home_page_components/Category.dart';

import '../pages/profil.dart';
import '../pages/create_post.dart';

import '../components/home_page_components/StateChanger.dart';
import '../components/home_page_components/ActionChip.dart';
import '../components/home_page_components/ProfileStatus.dart';
import '../components/home_page_components/ProfileButton.dart';
import '../components/home_page_components/CurvedPage.dart';
import '../components/home_page_components/SearchBar.dart';
import '../components/home_page_components/TopicTitle.dart';
import '../components/home_page_components/HomePost.dart';

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
      tooltip: "Popüler Ödevler",
      text: "Ödev konularını görüntüle",
      active: false,
      icon: Icons.support,
      onPressed: () {},
    ),
    ToolbarActionChipDart(
      tooltip: "Popüler Kampüs",
      text: "Popüler Kampüs Soruları",
      active: false,
      icon: Icons.ac_unit,
      onPressed: () {},
    )
  ];

  @override
  Widget build(BuildContext context) {
    var onEdit = (ind) {
      setState(() {
        for (var kategori in kategoriler) {
          kategori.active = false;
        }
        kategoriler[ind].active = true;
      });
      setState(() {});
    };

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ProfileButton(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilPage(true, "test"),
                ),
              );
            }),
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
        actions: [],
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
                      ),
                      secondChild: SearchBar(state != CrossFadeState.showFirst),
                    )
                  ],
                ),
              ),
            ),
            CurvedPage(
              SingleChildScrollView(
                child: Column(
                  children: [
                    TopicTitle(viewGrid),
                    HomePost(
                      "Işık Üniversitesi Hakkında",
                      "**Arkadaşlar** bilgisayar _programcılığı_ böülümüne bu yıl girdim, sıraya yazarken kampüsün yerini yazmamışım. Acaba bilgisayar programcılığı bölümünün yeri nerede bilen varsa çok iyi olur",
                      "100K",
                      "39",
                      true,
                      "7",
                      "3",
                      "",
                      postPicURL: "https://i.ytimg.com/vi/sLlY_iVWXlA/maxresdefault.jpg",
                    ),
                    HomePost(
                      "Bilgisayar Programcılığı Bölümü",
                      "Merhaba hangi **derslerin** olduğu hakkında bilgi almak _isterim_?",
                      "97K",
                      "134",
                      false,
                      "9",
                      "1",
                      "",
                    ),
                    HomePost(
                      "Bilgisayar Programcılığı Bölümü",
                      "Merhaba hangi **derslerin** olduğu hakkında bilgi almak _isterim_?",
                      "100K",
                      "39",
                      false,
                      "9",
                      "1",
                      "",
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
