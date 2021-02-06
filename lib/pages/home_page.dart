import 'package:flutter/material.dart';

import '../components/ActionChip.dart';
import '../components/ProfileStatus.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var state = CrossFadeState.showFirst;
  var index = 0;
  @override
  void initState() {
    super.initState();
    //Sayfa açıldıkdan sonra bura çalışır
  }

  var kategoriler = [
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
            InkWell(
              splashColor: Color.fromRGBO(130, 8, 41, 1.0),
              borderRadius: BorderRadius.circular(
                360,
              ),
              onTap: () {},
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/pictures/user.png'),
                      fit: BoxFit.fill),
                ),
              ),
            ),
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
                    Padding(
                      padding: EdgeInsets.only(
                        right: 10.0,
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(
                          360,
                        ),
                        color: Colors.white,
                        child: InkWell(
                          splashColor: Color.fromRGBO(130, 8, 41, 1.0),
                          borderRadius: BorderRadius.circular(
                            360,
                          ),
                          onTap: () {
                            setState(() {
                              if (state == CrossFadeState.showFirst) {
                                state = CrossFadeState.showSecond;
                              } else {
                                state = CrossFadeState.showFirst;
                              }
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.all(
                              3.0,
                            ),
                            child: const Icon(
                              Icons.search,
                              size: 25,
                              color: Color.fromRGBO(130, 8, 41, 1.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimatedCrossFade(
                        firstCurve: Curves.easeInToLinear,
                        secondCurve: Curves.easeInToLinear,
                        duration: Duration(
                          milliseconds: 500,
                        ),
                        crossFadeState: state,
                        firstChild: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                right: 10.0,
                              ),
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width - 71,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: kategoriler.length,
                                  itemBuilder:
                                      (BuildContext bcontext, int index) {
                                    kategoriler[index].onPressed = () {
                                      for (var kategori in kategoriler) {
                                        setState(() {
                                          if (kategoriler[index] != kategori) {
                                            kategori.active = false;
                                          } else {
                                            kategori.active = true;
                                          }
                                        });
                                      }
                                    };
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: index == 0 ? 0 : 5),
                                      child: kategoriler[index].generate(),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        secondChild: Container(
                          height: 30,
                          width: MediaQuery.of(context2).size.width - 61,
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: 3.0,
                            ),
                            child: TextField(
                              enabled: state != CrossFadeState.showFirst,
                              cursorColor: Colors.white,
                              autofocus: false,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                helperStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                border: InputBorder.none,
                                hintText: "Search reports",
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 96,
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
