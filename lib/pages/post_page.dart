import 'package:flutter/material.dart';
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
    var title = "Hawag-dd";
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.favorite),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Image.network("https://c4.wallpaperflare.com/wallpaper/480/423/714/nissan-black-gtr34-wallpaper-preview.jpg"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Column(
                  children: [
                    Text(
                      "Başlık",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 24, fontFamily: "MontSerrat"),
                    ),
                    MarkdownFormatter(
                        "Arkadaşlar bilgisayar programcılığı böülümüne bu yıl girdim, sıraya yazarken kampüsün yerini yazmamışım. Acaba bilgisayar programcılığı bölümünün yeri nerede bilen varsa çok iyi olur"),
                  ],
                ),
              ),
              Container(
                width: 20,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("9"),
                        InkWell(
                          child: Icon(Icons.arrow_upward),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text("5"),
                        InkWell(
                          child: Icon(Icons.arrow_downward),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.account_box),
                    title: Text('Selamın Aleyküm'),
                    subtitle: Text("Aleyküm Selam"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('+'),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('-'),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
