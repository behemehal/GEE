import 'package:flutter/material.dart';
import 'ActionChip.dart';

class Category extends StatelessWidget {
  Category(this.kategoriler, this.cut);
  final List<Widget> kategoriler;
  final int cut;

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
            width: MediaQuery.of(context).size.width - this.cut,
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
