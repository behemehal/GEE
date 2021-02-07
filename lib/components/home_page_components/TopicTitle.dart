import 'package:flutter/material.dart';

class TopicTitle extends StatelessWidget {
  TopicTitle(this.title);
  final String title;
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            this.title,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 20,
            ),
          ),
        ],
      );
}
