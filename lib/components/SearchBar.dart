import 'package:flutter/material.dart';

class SearchBar {
  SearchBar();

  Widget generate(void Function() onPressed) {
    return Container(
      height: 30,
      width: MediaQuery.of(context2).size.width - 61,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 3.0,
        ),
        child: TextField(
          enabled: state != CrossFadeState.showFirst,
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
            hintText: "Search reports",
          ),
        ),
      ),
    );
  }
}
