import 'package:flutter/material.dart';
import 'package:khana_khassi/src/widgets/CustomText.dart';

class BottomNavIcon extends StatelessWidget {
  final String name;
  final String image;

  BottomNavIcon({ this.name, this.image});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Image.network("https://cdn.pixabay.com/$image",height: 26,width: 26,),
          SizedBox(height: 5,),
          CustomText(text: name),
        ],
      ),
    );
  }
}
