import 'package:flutter/material.dart';
import 'ActionChip.dart';

class Category extends StatelessWidget {
  Category(this.kategoriler);
  final List<Widget> kategoriler;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: 10.0,
          ),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width - 71,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: this.kategoriler.length,
              itemBuilder: (BuildContext bcontext, int index) {
                return Padding(padding: EdgeInsets.only(left: index == 0 ? 0 : 5), child: kategoriler[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
