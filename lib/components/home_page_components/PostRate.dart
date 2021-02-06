import 'package:flutter/material.dart';

class PostRate extends StatelessWidget {
  int upVote;
  int downVote;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "7",
            style: TextStyle(fontSize: 15, color: Colors.green),
          ),
          Icon(
            Icons.arrow_upward,
            size: 15,
            color: Colors.green,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              "2",
              style: TextStyle(fontSize: 15, color: Colors.red),
            ),
          ),
          Icon(
            Icons.arrow_downward,
            size: 15,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
