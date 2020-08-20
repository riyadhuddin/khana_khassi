import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khana_khassi/src/providers/app.dart';
import 'package:khana_khassi/src/providers/user.dart';
import 'package:khana_khassi/src/screens/cart.dart';
import 'package:khana_khassi/src/utils/common_colors.dart';
import 'package:khana_khassi/src/models/products.dart';
import 'package:khana_khassi/src/utils/screen_navigation.dart';
import 'package:khana_khassi/src/widgets/CustomText.dart';
import 'package:khana_khassi/src/widgets/loading.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  final ProductModel product;

  Details({@required this.product});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int quantity = 1;
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);
    return Scaffold(
      key: _key,
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              changeScreen(context, CartScreen());
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: white,
      body: SafeArea(
        child: app.isLoading
            ? Loading()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 120,
                    backgroundImage: NetworkImage(widget.product.image),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomText(
                    text: widget.product.name,
                    size: 26,
                    weight: FontWeight.bold,
                  ),
                  CustomText(
                    text: "\$${widget.product.price}",
                    size: 20,
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: "Description",
                    size: 16,
                    weight: FontWeight.w400,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.product.description,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: grey, fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.remove,
                            size: 36,
                          ),
                          onPressed: () {
                            if (quantity != 1) {
                              setState(() {
                                quantity -= 1;
                              });
                            }
                          }),
                      GestureDetector(
                        onTap: () async {
                          app.changeLoaading();
                          print("All set loading");
                          bool value = await user.addToCart(
                              product: widget.product, quantity: quantity);
                          if (value) {
                            print("Item in cart");
                            _key.currentState.showSnackBar(
                              SnackBar(
                                content: Text("add to cart!"),
                              ),
                            );
                            user.reloadUserModel();
                            app.changeLoaading();
                            return;
                          } else {
                            print("item is not added");
                          }
                          print("loading set to false");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: app.isLoading
                              ? Loading()
                              : Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(28, 12, 28, 12),
                                  child: CustomText(
                                    text: "Add $quantity to cart",
                                    color: white,
                                    size: 22,
                                    weight: FontWeight.w300,
                                  ),
                                ),
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.add,
                            size: 36,
                            color: red,
                          ),
                          onPressed: () {
                            setState(() {
                              quantity += 1;
                            });
                          })
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
