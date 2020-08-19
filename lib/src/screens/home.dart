import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:khana_khassi/src/utils/common_colors.dart';
import 'package:khana_khassi/src/utils/screen_navigation.dart';
import 'package:khana_khassi/src/providers/user.dart';
import 'package:khana_khassi/src/screens/bag.dart';
import 'package:khana_khassi/src/screens/register.dart';
import 'package:khana_khassi/src/widgets/CustomText.dart';
import 'package:khana_khassi/src/widgets/bottom_navigation_icons.dart';
import 'package:khana_khassi/src/widgets/categories.dart';
import 'package:khana_khassi/src/widgets/feature_product.dart';
import 'package:khana_khassi/src/widgets/popular.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        backgroundColor: primary[200],
        elevation: 0.5,
        title: CustomText(
          text: "Khana Khassi",
          color: white,
        ),
        actions: [
          Stack(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    changeScreen(context, ShoppingBag());
                  }),
              Positioned(
                //positioning red dot on icon
                top: 12,
                right: 12,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: primary[200],
              ),
              currentAccountPicture: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/foodapp-5dea8.appspot.com/o/profile%2Fcanthigaster-cicada-278721_640.jpg?alt=media&token=68f9922e-1a13-46fc-bfce-a5b98be5de84",
                // height lets hope this work for testing
                height: MediaQuery.of(context).size.width,
              ),
              accountName: CustomText(
                text: userProvider.userModel?.name,
                color: white,
                weight: FontWeight.bold,
                size: 18,
              ),
              accountEmail: CustomText(
                text: userProvider.userModel?.email, //it has to be userModel
                color: white,
                weight: FontWeight.bold,
                size: 18,
              ),
            ),
            //This List tile are click and navigation able buttons
            ListTile(
              onTap: () {},
              leading: Icon(Icons.home),
              title: CustomText(text: "Home"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.fastfood),
              title: CustomText(text: "Food I like"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.restaurant),
              title: CustomText(text: "Liked restaurants"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.bookmark_border),
              title: CustomText(text: "My orders"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.shopping_cart),
              title: CustomText(text: "Cart"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.settings),
              title: CustomText(text: "Settings"),
            ),
          ],
        ),
      ),
      backgroundColor: white,
      body: SafeArea(
        //so items do not messed up
        child: ListView(
          children: <Widget>[
            /*Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      text: "What would you like to eat?",
                      size: 20,
                      weight: FontWeight.bold,
                      color: red[200],
                    )
                    //padding to text
                    ),

                //removing stack into app bar action
              ],
            ),
            SizedBox(
              height: 5,
            ),*/
            Container(
              decoration: BoxDecoration(
                color: primary[200],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              //color: red[200],
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 8, right: 8, bottom: 30),
                child: Container(
                  //add padding to container
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: grey[600],
                        offset: Offset(1, 1),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: ListTile(
                    //search box creation
                    leading: Icon(
                      Icons.search,
                      color: primary[200],
                    ), //trailing
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: "Find foods and restaurants",
                        border: InputBorder.none,
                      ),
                    ),
                    trailing: Icon(
                      Icons.filter_list,
                      color: primary[200],
                    ), //trailing
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Categories(), // Categories
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: "Featured",
                size: 20,
                color: grey,
              ),
            ),
            Featured(), //featured products
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: "Popular Products",
                size: 20,
                color: grey,
              ),
            ),
            Popular(), //Popular products here
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
              name: "Home",
              image: "photo/2013/03/29/13/39/home-97609_1280.png",
            ),
            BottomNavIcon(
              onTap: () {
                changeScreen(context, ShoppingBag());
              },
              name: "Bag",
              image: "photo/2013/07/13/10/13/carryout-bag-156779_1280.png",
            ),
            BottomNavIcon(
              onTap: () {
                userProvider.signOut();
                changeScreenReplacement(context, RegisterScreen());
              },
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
