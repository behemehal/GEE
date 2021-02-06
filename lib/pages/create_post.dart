import 'package:flutter/material.dart';
import 'package:gee/pages/home_page.dart';
import 'package:gee/utils/markdown_formatter.dart';

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

  TextEditingController name = TextEditingController();
  TextEditingController detail = TextEditingController();

  @override
  Widget init() {
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
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                width: 500,
                height: 250,
                color: Color.fromRGBO(100, 100, 100, 1),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Başlık",
                ),
                maxLength: 26,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10, top: 10),
                child: TextField(
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
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
    );
  }
}
