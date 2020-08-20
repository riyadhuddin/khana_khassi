import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:khana_khassi/src/models/brand.dart';
import 'package:khana_khassi/src/providers/product.dart';
import 'package:khana_khassi/src/screens/details.dart';
import 'package:khana_khassi/src/utils/common_colors.dart';
import 'package:khana_khassi/src/utils/screen_navigation.dart';
import 'package:khana_khassi/src/widgets/CustomText.dart';
import 'package:khana_khassi/src/widgets/loading.dart';
import 'package:khana_khassi/src/widgets/product.dart';
import 'package:khana_khassi/src/widgets/small_floating_button.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class BrandScreen extends StatelessWidget {
  final BrandModel brandModel;

  const BrandScreen({Key key, this.brandModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Loading(),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: brandModel.image,
                    height: 160,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                ),
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        black.withOpacity(0.6),
                        black.withOpacity(0.6),
                        black.withOpacity(0.6),
                        black.withOpacity(0.4),
                        black.withOpacity(0.1),
                        black.withOpacity(0.05),
                        black.withOpacity(0.025),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  //brand name
                  bottom: 60,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomText(
                      text: brandModel.name,
                      color: white,
                      size: 26,
                      weight: FontWeight.w300,
                    ),
                  ),
                ),
                Positioned.fill(
                  //price
                  bottom: 40,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomText(
                      text:
                          "Average Price: \$" + brandModel.avgPrice.toString(),
                      color: white,
                      size: 26,
                      weight: FontWeight.w300,
                    ),
                  ),
                ),
                Positioned.fill(
                  //brand name
                  bottom: 2,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.star,
                                color: yellow[900],
                                size: 20,
                              ),
                            ),
                            Text(brandModel.rating.toString()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  //brand
                  top: 5,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: black.withOpacity(0.2),
                          ),
                          child: Icon(
                            Icons.close,
                            color: white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  //brand
                  top: 5,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: SmallButton(Icons.favorite),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  text: "Open",
                  color: green,
                  weight: FontWeight.w400,
                  size: 18,
                ),
                Container(
                  child: FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.restaurant_menu),
                    label: CustomText(text: "Book now"),
                  ),
                ),
              ],
            ),
            Column(
              children: productProvider.productsByBrand
                  .map((item) => GestureDetector(
                        onTap: () {
                          changeScreen(
                              context,
                              Details(
                                product: item,
                              ));
                        },
                        child: ProductWidget(
                          product: item,
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
