import 'package:flutter/material.dart';

class CurvedPage extends StatelessWidget {
  CurvedPage(this.content);

  final Widget content;

  @override
  Widget build(BuildContext context) => Container(
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
