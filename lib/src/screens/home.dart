import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khana_khassi/src/helpers/common_colors.dart';
import 'package:khana_khassi/src/widgets/CustomText.dart';
import 'package:khana_khassi/src/widgets/bottom_navigation_icons.dart';
import 'package:khana_khassi/src/widgets/categories.dart';
import 'package:khana_khassi/src/widgets/feature_product.dart';
import 'package:khana_khassi/src/widgets/popular.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(//so items do not messed up
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: "What would you like to eat?",
                    size: 20,
                    weight: FontWeight.bold,
                    color: orange[300],
                  )
                  //padding to text
                ),
                Stack(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.notifications_none), onPressed: (){}),
                    Positioned(//positioning red dot on notification icon
                      top: 12,
                      right: 12,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(//add padding to container
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: grey,
                      offset: Offset(1, 1),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: ListTile(//search box creation
                  leading: Icon(Icons.search,color: red,),//trailing
                  title: TextField(
                    decoration: InputDecoration(
                      hintText: "Find foods and restaurants",
                      border: InputBorder.none,
                    ),
                  ),
                  trailing: Icon(Icons.filter_list,color: red,),//trailing
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Categories(),// Categories
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(text: "Featured", size: 20,color: grey,),
            ),
            Featured(),//featured products
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(text: "Popular Products", size: 20,color: grey,),
            ),
            Popular(),//Popular products here
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 73,
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BottomNavIcon(
              name:"Home",
              image: "photo/2013/03/29/13/39/home-97609_1280.png",
            ),
            BottomNavIcon(
              name: "Bag",
              image: "photo/2013/07/13/10/13/carryout-bag-156779_1280.png",
            ),
            BottomNavIcon(
              name: "Account",
              image: "photo/2016/08/31/11/54/user-1633249_1280.png",
            ),
            /***
             * Padding(
             * padding: const EdgeInsets.all(8.0),
             * child: Column(children: <Widget>[
             * Image.network("https://cdn.pixabay.com/photo/2013/07/13/10/13/carryout-bag-156779_1280.png",height: 26,width: 26,),
             * SizedBox(height: 5,),
             * CustomText(text: "Bag")],),),
             ***/
          ],
        ),
      ),
    );
  }
}
