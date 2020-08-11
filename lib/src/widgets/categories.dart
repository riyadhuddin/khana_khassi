import 'package:flutter/material.dart';
import 'package:khana_khassi/src/helpers/common_colors.dart';
import 'package:khana_khassi/src/models/category.dart';
import 'package:khana_khassi/src/widgets/CustomText.dart';

List<Category> categoriesList = [
  Category(name: "Steak Deshi", image: "bZSfl8e.jpeg"),
  Category(name: "Steak Local", image: "mOKwD8c.jpeg"),
  Category(name: "Cheesy Chicken", image: "KAXmwlp.jpeg"),
  Category(name: "Burger basic", image: "PAmtcgN.jpeg"),
  Category(name: "Steak Classic", image: "MNzb0UU.jpeg"),
  Category(name: "Steak VIP", image: "OPEikuL.jpeg"),
  Category(name: "Burger Large", image: "eSHV5UT.jpeg"),
  Category(name: "Steak Premium", image: "ClFOQ4Z.jpeg"),
  //Category(name: "Steak", image: "4O4pKuw.jpeg"),
  Category(name: "Burger Premium", image: "xPyiL.jpeg"),
  Category(name: "Burger Large", image: "eSHV5UT.jpeg"),
];

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length, // how many items in our list scroll
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              //add pading into column then wrap padding into Listview builder
              //then copy and return it into item builder
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: red[50],
                        offset: Offset(4, 6),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      "https://i.imgur.com/${categoriesList[index].image}",
                      fit: BoxFit.fill,
                      height: 80,
                      width: 160,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: categoriesList[index].name,
                  size: 16,
                  color: black,
                ),
              ],
            ),
          );
        },
        // child:
      ),
    );
  }
}
