import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  SearchBar(this.enabled);

  bool enabled;

  @override
  Widget build(BuildContext context) => Container(
        height: 30,
        width: MediaQuery.of(context).size.width - 61,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 3.0,
          ),
          child: TextField(
            enabled: this.enabled, // 
            cursorColor: Colors.white,
            autofocus: false,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              helperStyle: TextStyle(
                color: Colors.white,
              ),
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              border: InputBorder.none,
              hintText: "Gönderileri ara",
            ),
          ),
        ),
      );
}
