import 'package:flutter/material.dart';
import 'package:khana_khassi/src/utils/common_colors.dart';

class LikeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: white,
          boxShadow: [
            BoxShadow(
              color: grey[300],
              offset: Offset(1, 1),
              blurRadius: 4,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            Icons.favorite_border,
            color: red,
            size: 18,
          ),
        ),
      ),
    );
  }
}
