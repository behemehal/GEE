import 'package:flutter/material.dart';

import './PostRate.dart';
import './IconLabel.dart';
import './ProfileButton.dart';
import '../../utils/markdown_formatter.dart';
import '../../pages/profil.dart';

class HomePost extends StatelessWidget {
  HomePost(
    this.title,
    this.description,
    this.viewCount,
    this.commentCount,
    this.replied,
    this.upVote,
    this.downVote,
    this.userPic, {
    this.postPicURL,
  });

  String title;
  String description;
  String viewCount;
  String commentCount;
  bool replied;
  String upVote;
  String downVote;
  String userPic;
  String postPicURL;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          if (this.postPicURL != null)
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Image.network(this.postPicURL),
            ),
          ListTile(
            leading: ProfileButton(() => ProfilPage(true)),
            title: Text(
              this.title,
              style: TextStyle(fontFamily: "Montserrat"),
            ),
            trailing: PostRate(7, 3),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 5),
              child: MarkdownFormatter(this.description),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconLabel(
                this.replied ? Icons.verified : Icons.history,
                this.replied ? "Yanıtlandı" : "Yanıt Bekliyor",
                iconColor: this.replied ? Colors.green : Colors.red,
              ),
              IconLabel(
                Icons.visibility,
                this.viewCount,
              ),
              IconLabel(
                Icons.comment,
                this.commentCount,
              ),
            ],
          )
        ],
      ),
    );
  }
}
