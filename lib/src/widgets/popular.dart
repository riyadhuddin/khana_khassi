import 'package:flutter/material.dart';
import 'package:khana_khassi/src/helpers/common_colors.dart';
import 'package:khana_khassi/src/widgets/small_floating_button.dart';

class Popular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                "https://cdn.pixabay.com/photo/2017/12/04/15/49/salmon-2997240_1280.jpg",
              ),
              //wrap with clipRRect and padding then stack
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              //add pading into row to move icon in gd location
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
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
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.star,
                            color: yellow[900],
                            size: 20,
                          ),
                        ), //add pading
                        Text("4.5"),
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
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
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
          //new alignment
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Fish Steak \n",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text: "by ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w300)),
                          TextSpan(
                              text: "Tawhid \n",
                              style: TextStyle(fontSize: 16)),
                        ],
                        style: TextStyle(color: white),
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "\₵25.00 \n",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                      ],
                      style: TextStyle(color: white),
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
}
