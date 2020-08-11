import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:khana_khassi/src/helpers/common_colors.dart';
import 'package:khana_khassi/src/models/products.dart';
import 'package:khana_khassi/src/widgets/CustomText.dart';

class Details extends StatefulWidget {
  final Product product;

  Details({@required this.product});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            /*Image.network("https://cdn.pixabay.com/${widget.product.image}"),
            Text(widget.product.name),
            Text(widget.product.vendor),
            Text(widget.product.rating.toString()),
            Text(widget.product.price.toString()),*/
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Stack(
                children: <Widget>[
                  Carousel(
                    //wrap with column - stack
                    images: [
                      NetworkImage(
                          "https://cdn.pixabay.com/${widget.product.image}"),
                      //Image.network("https://cdn.pixabay.com/${widget.product.image}"),
                      NetworkImage(
                          "https://cdn.pixabay.com/${widget.product.image}"),
                      NetworkImage(
                          "https://cdn.pixabay.com/${widget.product.image}"),
                    ],
                    dotBgColor: white,
                    dotColor: grey,
                    dotIncreasedColor: red,
                    dotIncreaseSize: 1.2,
                    autoplay: false,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Stack(
                          //add pading
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: <Widget>[
                                  Image.network(
                                    "https://cdn.pixabay.com/photo/2013/07/13/10/13/carryout-bag-156779_1280.png",
                                    //wrap inside stack
                                    width: 30, height: 30,
                                  ),
                                  //positioned moved from here
                                ],
                              ),
                            ),
                            Positioned(
                              right: 5,
                              bottom: 0,
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
                                    padding: const EdgeInsets.only(
                                        left: 4, right: 4),
                                    child: CustomText(
                                      text: "0",
                                      color: white,
                                      size: 18,
                                      weight: FontWeight.bold,
                                    ),
                                  )),
                            ), //put it into container
                          ],
                        ),
                      ),
                    ],
                  ), //wrap inside a row
                  Positioned(
                    right: 15,
                    bottom: 55,
                    child: Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: grey[400],
                            offset: Offset(2, 3),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Icon(
                          Icons.favorite,
                          size: 22,
                          color: red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomText(
              text: widget.product.name,
              size: 24,
              weight: FontWeight.bold,
            ),
            CustomText(
              text: "\$ " + widget.product.price.toString(),
              size: 24,
              weight: FontWeight.w600,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(
                        Icons.remove,
                        size: 28,
                      ),
                      onPressed: () {}),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: red,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(28, 12, 28, 12),
                      child: CustomText(
                        text: "Add To Bag",
                        size: 22,
                        color: white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 28,
                      ),
                      onPressed: () {}),
                ),
              ],
            ),
          ],
        ),
        /*Column(
          children: <Widget>[
            IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){Navigator.pop(context);}),
            Text(widget.product.name,style: TextStyle(color: black,),),
          ],
        ),*/
      ),
    );
  }
}
