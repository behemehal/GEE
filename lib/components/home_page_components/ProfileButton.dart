import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  ProfileButton(this.onPressed);
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color.fromRGBO(130, 8, 41, 1.0),
      borderRadius: BorderRadius.circular(
        360,
      ),
      onTap: this.onPressed,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage('assets/pictures/user.png'), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
