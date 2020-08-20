import 'package:flutter/material.dart';
import 'package:khana_khassi/src/utils/common_colors.dart';
import 'package:khana_khassi/src/models/category.dart';
import 'package:khana_khassi/src/widgets/CustomText.dart';
import 'package:khana_khassi/src/widgets/loading.dart';
import 'package:transparent_image/transparent_image.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel category;

  CategoryWidget({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Container(
            width: 140,
            height: 160,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Loading(),
                    ),
                  ),
                  Center(
                    child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage, image: category.image),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 140,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.05),
                  Colors.black.withOpacity(0.025),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: CustomText(
                text: category.name,
                color: white,
                size: 26,
                weight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
    /*return Container(
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
                  //height: 140,
                  // width: 160,
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        "https://i.imgur.com/${categoriesList[index].image}",
                        fit: BoxFit.fill,
                        height: 80,
                        width: 160,
                      ),
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
    );*/
  }
}
