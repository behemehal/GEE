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

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var state = CrossFadeState.showFirst;
  var viewGrid = 0;
  var index = 0;

  @override
  void initState() {
    super.initState();
    //Sayfa açıldıkdan sonra bura çalışır
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
      active: true,
      icon: Icons.support,
      onPressed: () {},
    ),
    ToolbarActionChipDart(
      tooltip: "Popüler Kampüs",
      text: "Popüler Kampüs Soruları",
      active: true,
      icon: Icons.ac_unit,
      onPressed: () {},
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ProfileButton(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilPage(),
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
                      firstChild: Category(kategoriler),
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
                            //trailing: ,
                            subtitle: Text(
                              'Secondary Text',
                              style: TextStyle(color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
