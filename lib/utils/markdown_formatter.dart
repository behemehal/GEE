import 'package:flutter/material.dart';

class MarkdownFormatter extends StatelessWidget {
  MarkdownFormatter(this.unformatted);
  String unformatted;

  bool onBold = false;
  bool onItalic = false;

  @override
  RichText build(BuildContext context) {
    List<TextSpan> elements = [];

    for (var word in this.unformatted.split(" ")) {
      if (word.startsWith("**")) {
        this.onBold = true;
      } else if (word.startsWith("_")) {
        this.onItalic = true;
      }

      var element = TextSpan(
        text: word.replaceAll("*", "").replaceAll("_", "") + " ",
        style: TextStyle(
          color: Colors.black,
          fontStyle: this.onItalic ? FontStyle.italic : FontStyle.normal,
          fontWeight: this.onBold ? FontWeight.bold : FontWeight.normal,
        ),
      );

      elements.add(element);

      if (word.endsWith("**")) {
        this.onBold = false;
      } else if (word.endsWith("_")) {
        this.onItalic = false;
      }
    }

    return RichText(
      text: TextSpan(children: elements),
    );
  }
}
