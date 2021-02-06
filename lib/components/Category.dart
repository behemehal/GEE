import 'package:flutter/material.dart';
import './ActionChip.dart';

class Category extends StatefulWidget {
  Category(this.kategoriler);
  List<ToolbarActionChipDart> kategoriler;

  @override
  CategoryState createState() => CategoryState(this.kategoriler);
}

class CategoryState extends State<Category> {
  CategoryState(this.kategoriler);
  List<ToolbarActionChipDart> kategoriler;
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
              itemCount: kategoriler.length,
              itemBuilder: (BuildContext bcontext, int index) {
                kategoriler[index].onPressed = () {
                  for (var kategori in kategoriler) {
                    setState(() {
                      if (kategoriler[index] != kategori) {
                        kategori.active = false;
                      } else {
                        kategori.active = true;
                      }
                    });
                  }
                };
                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 0 : 5),
                  child: kategoriler[index].generate(),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
