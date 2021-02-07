import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../pages/profil.dart';

class ProfileButton extends StatelessWidget {
  ProfileButton(this.mail, this.edit);

  String mail;
  bool edit;

  Future<DecorationImage> loadUserPicture() {
    return Future.sync(() async {
      final response = await http.post('https://gonulluesit.herokuapp.com/getUser',
          body: jsonEncode(
            <String, dynamic>{'mail': this.mail},
          ),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          });
      try {
        var data = jsonDecode(response.body);
        if (response.statusCode == 200) {
          return DecorationImage(image: NetworkImage(data["data"]["accountPhoto"]), fit: BoxFit.fill);
        } else {
          return DecorationImage(image: AssetImage('assets/pictures/user.png'), fit: BoxFit.fill);
        }
      } catch (_) {
        return DecorationImage(image: AssetImage('assets/pictures/user.png'), fit: BoxFit.fill);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DecorationImage>(
        future: loadUserPicture(),
        builder: (BuildContext context, AsyncSnapshot<DecorationImage> snapshot) {
          if (snapshot.hasData) {
            return InkWell(
              splashColor: Color.fromRGBO(130, 8, 41, 1.0),
              borderRadius: BorderRadius.circular(
                360,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilPage(this.edit, this.mail),
                  ),
                );
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, image: snapshot.data),
              ),
            );
          } else {
            return InkWell(
              splashColor: Color.fromRGBO(130, 8, 41, 1.0),
              borderRadius: BorderRadius.circular(
                360,
              ),
              onTap: () {},
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
        });
  }
}
