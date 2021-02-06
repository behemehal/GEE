import 'package:flutter/material.dart';
import 'GridChanger.dart';

class TopicTitle extends StatefulWidget {
  TopicTitle(this.viewGrid);
  int viewGrid;

  @override
  TopicTitleState createState() => TopicTitleState(this.viewGrid);
}

class TopicTitleState extends State<TopicTitle> {
  TopicTitleState(this.viewGrid);
  int viewGrid;
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Popüler Konular",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 20,
            ),
          ),
          GridChanger(this.viewGrid, () {
            setState(() {
              if (this.viewGrid == 0) {
                this.viewGrid = 1;
              } else {
                this.viewGrid = 0;
              }
            });
          })
        ],
      );
}
