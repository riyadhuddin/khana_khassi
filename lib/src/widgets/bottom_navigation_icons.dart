import 'package:flutter/material.dart';
import 'package:khana_khassi/src/widgets/CustomText.dart';

class BottomNavIcon extends StatelessWidget {
  final String name;
  final String image;
  final Function onTap;

  BottomNavIcon({@required this.name, @required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap ?? null,
        child: Column(
          //wrap in gesture detector
          children: <Widget>[
            Image.network(
              "https://cdn.pixabay.com/$image",
              height: 26,
              width: 26,
            ),
            SizedBox(
              height: 5,
            ),
            CustomText(text: name),
          ],
        ),
      ),
    );
  }
}
