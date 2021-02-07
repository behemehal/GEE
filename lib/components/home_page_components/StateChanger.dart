import 'package:flutter/material.dart';

class StateChanger extends StatelessWidget {
  StateChanger(this.state, this.onPressed);

  bool state;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
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
          onTap: this.onPressed,
          child: Padding(
            padding: EdgeInsets.all(
              3.0,
            ),
            child: Icon(
              this.state ? Icons.search : Icons.clear,
              size: 25,
              color: Color.fromRGBO(130, 8, 41, 1.0),
            ),
          ),
        ),
      ),
    );
  }
}
