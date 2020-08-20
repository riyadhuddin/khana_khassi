import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khana_khassi/src/providers/product.dart';
import 'package:khana_khassi/src/providers/user.dart';
import 'package:khana_khassi/src/utils/common_colors.dart';
import 'package:khana_khassi/src/utils/screen_navigation.dart';
import 'package:khana_khassi/src/screens/details.dart';
import 'package:khana_khassi/src/widgets/CustomText.dart';
import 'package:khana_khassi/src/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class Featured extends StatefulWidget {
  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final user = Provider.of<UserProvider>(context);
    return Container(
      height: 220,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productProvider.products.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(12, 14, 16, 12),
              child: GestureDetector(
                onTap: () {
                  changeScreen(
                      _,
                      Details(
                        product: productProvider.products[index],
                      ));
                },
                child: Container(
                  //wraping container in gesture detector to open details
                  height: 220,
                  width: 200,

                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: grey[300],
                        offset: Offset(-2, -1),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: Loading(),
                              ),
                            ),
                            Center(
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: productProvider.products[index].image,
                                height: 126,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(
                              text: productProvider.products[index].name ??
                                  "id null",
                            ),
                          ),
                          //wraping custom text with row and add pading
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(),
                            ),
                          ),

                          /* Padding(
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
                          ),*/
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
                                  text: productProvider.products[index].rating
                                      .toString(),
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
                              text:
                                  "\$${productProvider.products[index].price / 100}",
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
