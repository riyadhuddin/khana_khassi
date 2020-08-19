import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khana_khassi/src/utils/common_colors.dart';
import 'package:khana_khassi/src/utils/screen_navigation.dart';
import 'package:khana_khassi/src/models/products.dart';
import 'package:khana_khassi/src/screens/details.dart';
import 'package:khana_khassi/src/widgets/CustomText.dart';

List<Product> prouductsList = [
  //Product(name: "Noodles",price: 15.3,rating: 4.5,vendor: "Kala Mama",wishList: true,image: "5661/22551893421_2e9e3734ea_h.jpg"),
  Product(
      name: "Meatball Ravoli",
      price: 5.1,
      rating: 4.2,
      vendor: "Pasta",
      wishList: false,
      image: "photo/2015/09/30/06/26/meatball-ravioli-964959_1280.jpg"),
  Product(
      name: "Ravoli",
      price: 5.9,
      rating: 4.5,
      vendor: "Indian",
      wishList: false,
      image: "photo/2015/01/17/10/49/ravioli-602087_1280.jpg"),
  Product(
      name: "Pasta",
      price: 10.3,
      rating: 4.7,
      vendor: "Kala Mama",
      wishList: true,
      image: "photo/2018/07/18/19/12/spaghetti-3547078_1280.jpg"),
  // Product(name: "Samosa",price: 5.9,rating: 4.2,vendor: "Kala Mama",wishList: false,image: "hsxc6P1.jpeg"),
];

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: prouductsList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(12, 14, 16, 12),
              child: GestureDetector(
                onTap: () {
                  changeScreen(
                      _,
                      Details(
                        product: prouductsList[index],
                      ));
                },
                child: Container(
                  //wraping container in gesture detector to open details
                  height: 240,
                  width: 200,

                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: red[50],
                        offset: Offset(15, 5),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        // "https://i.imgur.com/${prouductsList[index].image}",
                        "https://cdn.pixabay.com/${prouductsList[index].image}",
                        // "https://live.staticflickr.com/${prouductsList[index].image}",
                        fit: BoxFit.fill,
                        height: 140,
                        width: 140,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(text: prouductsList[index].name),
                          ), //wraping custom text with row and add pading
                          SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                    color: grey,
                                    offset: Offset(1, 1),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: Padding(
                                //wrap with container
                                padding: const EdgeInsets.all(4.0),
                                child: prouductsList[index].wishList
                                    ? Icon(
                                        Icons.favorite,
                                        color: red,
                                        size: 18,
                                      )
                                    : Icon(
                                        Icons.favorite_border,
                                        color: red,
                                        size: 18,
                                      ), //add pading
                              ),
                            ),
                          ),
                        ],
                      ),
                      //SizedBox(height: 1,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: CustomText(
                                  text: prouductsList[index].rating.toString(),
                                  color: grey,
                                  size: 14,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                Icons.star,
                                color: red,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: red,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: red,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: red,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: grey,
                                size: 16,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CustomText(
                              text: "\$${prouductsList[index].price}",
                              weight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
