import 'package:flutter/material.dart';
import 'package:gee/components/home_page_components/ProfileButton.dart';
import 'package:gee/pages/post_page1.dart';
import 'package:gee/utils/markdown_formatter.dart';

class PostPage extends StatefulWidget {
  PostPage(this.id);
  String id;
  @override
  PostPageState createState() => PostPageState(this.id);
}

class PostPageState extends State<PostPage> {
  PostPageState(this.id);
  String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gönderi"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/pictures/question.png"),
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
                            "Başlık",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 30, fontFamily: "MontSerrat"),
                          ),
                        ),
                        MarkdownFormatter(
                            "Arkadaşlar bilgisayar programcılığı böülümüne bu yıl girdim, sıraya yazarken kampüsün yerini yazmamışım. Acaba bilgisayar programcılığı bölümünün yeri nerede bilen varsa çok iyi olur"),
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
                              "9",
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                            InkWell(
                              child: Icon(
                                Icons.arrow_upward,
                                color: Colors.green,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "5",
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            InkWell(
                              child: Icon(
                                Icons.arrow_downward,
                                color: Colors.red,
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
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
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
                          ),
                        ],
                      ),
                    )
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
