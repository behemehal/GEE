import 'package:flutter/material.dart';
import 'package:gee/components/home_page_components/Category.dart';

import '../pages/profil.dart';

import '../components/home_page_components/StateChanger.dart';
import '../components/home_page_components/ActionChip.dart';
import '../components/home_page_components/ProfileStatus.dart';
import '../components/home_page_components/ProfileButton.dart';
import '../components/home_page_components/CurvedPage.dart';
import '../components/home_page_components/SearchBar.dart';
import '../components/home_page_components/TopicTitle.dart';
import '../components/home_page_components/PostRate.dart';
import '../components/home_page_components/IconLabel.dart';

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
                  builder: (context) => ProfilPage(true),
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
                    Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          ListTile(
                            leading: ProfileButton(() {}),
                            title: const Text('Işık Üniversitesi Hakkında'),
                            trailing: PostRate(7, 3),
                            subtitle: Text(
                              'Arkadaşlar bilgisayar programcılığı böülümüne bu yıl girdim, sıraya yazarken kampüsün yerini yazmamışım. Acaba bilgisayar programcılığı bölümünün yeri nerede bilen varsa çok iyi olur,',
                              style: TextStyle(color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                          IconLabel(Icons.visibility, "100k")
                        ],
                      ),
                    ),
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
