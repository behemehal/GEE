import 'package:flutter/material.dart';

class ToolbarActionChipDart {
  ToolbarActionChipDart(
      {@required this.onPressed,
      @required this.tooltip,
      @required this.text,
      this.active,
      @required this.icon});

  void Function() onPressed;
  final String tooltip;
  final String text;
  bool active;
  final IconData icon;

  ActionChip generate() {
    return ActionChip(
      shadowColor: Colors.transparent,
      tooltip: this.tooltip,
      onPressed: this.onPressed,
      backgroundColor: this.active ? Colors.grey[900] : Colors.white,
      avatar: CircleAvatar(
        backgroundColor:
            this.active ? Colors.white : Color.fromRGBO(130, 8, 41, 1.0),
        child: Icon(this.icon,
            size: 16.0, color: this.active ? Colors.red : Colors.white),
      ),
      label: Text(
        this.text,
        style: TextStyle(color: this.active ? Colors.white : Colors.black),
      ),
    );
  }
}
