import 'package:flutter/material.dart';

class IconLabel extends StatelessWidget {
  IconLabel(this.icon, this.text, {this.iconColor, this.textColor});

  final IconData icon;
  final String text;
  Color iconColor = Color.fromRGBO(100, 100, 100, 1);
  Color textColor = Color.fromRGBO(100, 100, 100, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 15, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            this.icon,
            color: this.iconColor,
            size: 14,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, bottom: 1),
            child: Text(
              this.text,
              style: TextStyle(
                color: this.textColor,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
