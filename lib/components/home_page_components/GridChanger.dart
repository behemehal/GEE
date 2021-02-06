import 'package:flutter/material.dart';

class GridChanger extends StatelessWidget {
  GridChanger(this.pos, this.onPressed);
  int pos;
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
        color: Color.fromRGBO(130, 8, 41, 1.0),
        child: InkWell(
          splashColor: Colors.white,
          borderRadius: BorderRadius.circular(
            360,
          ),
          onTap: this.onPressed,
          child: Padding(
            padding: EdgeInsets.all(
              6.0,
            ),
            child: Icon(
              this.pos == 0 ? Icons.view_agenda : Icons.view_day,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
