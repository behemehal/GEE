import 'package:flutter/material.dart';

class StateChanger {
  StateChanger();

  Widget generate(void Function() onPressed) {
    return Padding(
      padding: EdgeInsets.only(
        right: 10.0,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(
          360,
        ),
        color: Colors.white,
        child: InkWell(
          splashColor: Color.fromRGBO(130, 8, 41, 1.0),
          borderRadius: BorderRadius.circular(
            360,
          ),
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.all(
              3.0,
            ),
            child: const Icon(
              Icons.search,
              size: 25,
              color: Color.fromRGBO(130, 8, 41, 1.0),
            ),
          ),
        ),
      ),
    );
  }
}
