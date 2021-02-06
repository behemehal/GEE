import 'package:flutter/material.dart';

class CurvedPage extends StatelessWidget {
  CurvedPage(this.content);

  final Widget content;

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: 20,
          left: 15,
          right: 15,
        ),
        height: MediaQuery.of(context).size.height - 96,
        width: MediaQuery.of(context).size.width,
        child: this.content,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
      );
}
