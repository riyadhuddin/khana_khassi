import 'package:flutter/material.dart';
import 'package:khana_khassi/src/models/brand.dart';
import 'package:khana_khassi/src/utils/common_colors.dart';
import 'package:khana_khassi/src/widgets/loading.dart';
import 'package:khana_khassi/src/widgets/small_floating_button.dart';
import 'package:transparent_image/transparent_image.dart';

class BrandWidget extends StatelessWidget {
  final BrandModel brand;

  BrandWidget({Key key, this.brand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, left: 2, bottom: 4, right: 2),
      child: Stack(
        children: [
          //back ground image here
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallButton(Icons.favorite),
                Padding(
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
                        Text(
                          brand.rating.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      black.withOpacity(0.8),
                      black.withOpacity(0.7),
                      black.withOpacity(0.6),
                      black.withOpacity(0.4),
                      black.withOpacity(0.1),
                      black.withOpacity(0.05),
                      black.withOpacity(0.025),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${brand.name} \n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          TextSpan(
                            text: "average meal price:",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: "\$${brand.avgPrice} \n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                        style: TextStyle(color: white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //another widget
  Widget _backgroundImage(String image) {
    if (image.isEmpty || image == null) {
      return Container(
        height: 210,
        decoration: BoxDecoration(
          color: grey.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Image.network(
            "https://firebasestorage.googleapis.com/v0/b/foodapp-5dea8.appspot.com/o/kkimg%2Flogo%2Flogo.png?alt=media&token=a2739fb2-d320-4d24-b849-5e93ce7918dc",
            width: 120,
          ),
        ),
      );
    } else {
      Padding(
        padding: const EdgeInsets.all(0.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 120,
                    child: Loading(),
                  ),
                ),
              ),
              Center(
                child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage, image: brand.image),
              ),
            ],
          ),
        ),
      );
    }
  }
}
