import 'package:flutter/material.dart';
import 'package:khana_khassi/src/utils/common_colors.dart';
import 'package:khana_khassi/src/models/products.dart';
import 'package:khana_khassi/src/widgets/CustomText.dart';

class ShoppingBag extends StatefulWidget {
  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
  Product product = Product(
      name: "Meatball Ravoli",
      price: 5.1,
      rating: 4.2,
      vendor: "Pasta",
      wishList: false,
      image: "photo/2015/09/30/06/26/meatball-ravioli-964959_1280.jpg");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        //leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: black,), onPressed: null),
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: "Shopping Bag",
          weight: FontWeight.bold,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.network(
                    "https://cdn.pixabay.com/photo/2013/07/13/10/13/carryout-bag-156779_1280.png",
                    //wrap inside stack
                    width: 30, height: 30,
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 2,
                  child: Container(
                      //wrap into positioned
                      decoration: BoxDecoration(
                        color: red[200],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: grey,
                            offset: Offset(2, 1),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: CustomText(
                          text: "0",
                          color: white,
                          size: 18,
                          weight: FontWeight.bold,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width - 10,
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: red[100],
                    offset: Offset(3, 5),
                    blurRadius: 30,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.network(
                    "https://cdn.pixabay.com/${product.image}",
                    fit: BoxFit.fill,
                    height: 120,
                    width: 120,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            //wrap with row
                            children: [
                              TextSpan(
                                text: product.name + "\n",
                                style: TextStyle(
                                  color: black,
                                  fontSize: 20,
                                ),
                              ),
                              TextSpan(
                                text: "\$" + product.price.toString() + "\n",
                                style: TextStyle(
                                  color: black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      IconButton(icon: Icon(Icons.delete), onPressed: null)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
