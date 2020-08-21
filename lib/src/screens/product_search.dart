import 'package:flutter/material.dart';
import 'package:khana_khassi/src/providers/product.dart';
import 'package:khana_khassi/src/screens/cart.dart';
import 'package:khana_khassi/src/screens/details.dart';
import 'package:khana_khassi/src/utils/common_colors.dart';
import 'package:khana_khassi/src/utils/screen_navigation.dart';
import 'package:khana_khassi/src/widgets/CustomText.dart';
import 'package:khana_khassi/src/widgets/product.dart';
import 'package:provider/provider.dart';

class ProductSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: black),
          backgroundColor: white,
          leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: CustomText(
            text: "Products",
            size: 20,
          ),
          elevation: 0.0,
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  changeScreen(context, CartScreen());
                })
          ],
        ),
        body: productProvider.productsSearched.length < 1
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: grey,
                        size: 3,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "No products Found",
                        color: grey,
                        weight: FontWeight.w300,
                      ),
                    ],
                  ),
                ],
              )
            : ListView.builder(
                itemCount: productProvider.productsSearched.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () async {
                      changeScreen(
                          context,
                          Details(
                              product:
                                  productProvider.productsSearched[index]));
                    },
                    child: ProductWidget(
                      product: productProvider.productsSearched[index],
                    ),
                  );
                }));
  }
}
