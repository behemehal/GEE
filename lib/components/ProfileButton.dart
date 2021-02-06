import 'package:flutter/material.dart';

class ProfileButton {
  ProfileButton();

  Widget generate(void Function() onPressed) {
    return InkWell(
      splashColor: Color.fromRGBO(130, 8, 41, 1.0),
      borderRadius: BorderRadius.circular(
        360,
      ),
      onTap: onPressed,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage('assets/pictures/user.png'), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
