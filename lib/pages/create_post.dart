import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.edit ? "Postu Düzenle" : "Post Oluştur"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Başlık",
              ),
              maxLength: 26,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10, top: 10),
              child: TextField(
                maxLines: 8,
                maxLength: 300,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: 'Detay gir',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
