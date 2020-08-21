import 'package:flutter/material.dart';
import 'package:khana_khassi/src/providers/app.dart';
import 'package:khana_khassi/src/providers/brand.dart';
import 'package:khana_khassi/src/providers/product.dart';
import 'package:khana_khassi/src/screens/brand.dart';
import 'package:khana_khassi/src/screens/cart.dart';
import 'package:khana_khassi/src/utils/common_colors.dart';
import 'package:khana_khassi/src/utils/screen_navigation.dart';
import 'package:khana_khassi/src/widgets/CustomText.dart';
import 'package:khana_khassi/src/widgets/brand.dart';
import 'package:khana_khassi/src/widgets/loading.dart';
import 'package:provider/provider.dart';

class BrandsSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppProvider>(context);
    final brandProvider = Provider.of<BrandProvider>(context);
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
          text: "Restaurants",
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
      body: app.isLoading
          ? Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Loading(),
                ],
              ),
            )
          : brandProvider.searchedBrands.length < 1
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: grey,
                          size: 30,
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
                          text: "No Restaurants Found",
                          color: grey,
                          weight: FontWeight.w300,
                          size: 22,
                        )
                      ],
                    ),
                  ],
                )
              : ListView.builder(
                  itemCount: brandProvider.searchedBrands.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        app.changeLoaading();
                        await productProvider.loadProductsByBrand(
                            brandId: brandProvider.searchedBrands[index].id);
                        app.changeLoaading();
                        changeScreen(
                            context,
                            BrandScreen(
                              brandModel: brandProvider.searchedBrands[index],
                            ));
                      },
                      child: BrandWidget(
                        brand: brandProvider.searchedBrands[index],
                      ),
                    );
                  }),
    );
  }
}
