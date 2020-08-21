import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:khana_khassi/src/providers/app.dart';
import 'package:khana_khassi/src/providers/brand.dart';
import 'package:khana_khassi/src/providers/category.dart';
import 'package:khana_khassi/src/providers/product.dart';
import 'package:khana_khassi/src/screens/brand.dart';
import 'package:khana_khassi/src/screens/brand_search.dart';
import 'package:khana_khassi/src/screens/cart.dart';
import 'package:khana_khassi/src/screens/category.dart';
import 'package:khana_khassi/src/screens/login.dart';
import 'package:khana_khassi/src/screens/order.dart';
import 'package:khana_khassi/src/screens/product_search.dart';
import 'package:khana_khassi/src/utils/common_colors.dart';
import 'package:khana_khassi/src/utils/screen_navigation.dart';
import 'package:khana_khassi/src/providers/user.dart';
import 'package:khana_khassi/src/screens/register.dart';
import 'package:khana_khassi/src/views/test_featured.dart';
import 'package:khana_khassi/src/widgets/CustomText.dart';
import 'package:khana_khassi/src/widgets/bottom_navigation_icons.dart';
import 'package:khana_khassi/src/widgets/brand.dart';
import 'package:khana_khassi/src/widgets/categories.dart';
import 'package:khana_khassi/src/widgets/feature_product.dart';
import 'package:khana_khassi/src/widgets/loading.dart';
import 'package:khana_khassi/src/widgets/popular.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final brandProvider = Provider.of<BrandProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    brandProvider.loadsingleBrand();
    return Scaffold(
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
                    changeScreen(context, CartScreen());
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
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: primary[200],
              ),
              /* currentAccountPicture: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/foodapp-5dea8.appspot.com/o/profile%2Fcanthigaster-cicada-278721_640.jpg?alt=media&token=68f9922e-1a13-46fc-bfce-a5b98be5de84",
                // height lets hope this work for testing
                height: MediaQuery.of(context).size.width,
              ),*/
              accountName: CustomText(
                text: user.user?.uid,
                color: white,
                weight: FontWeight.bold,
                size: 18,
              ),
              accountEmail: CustomText(
                text: user.user?.email,
                //it has to be userModel
                color: white,
                weight: FontWeight.bold,
                size: 18,
              ),
            ),
            //This List tile are click and navigation able buttons
            ListTile(
              onTap: () {
                changeScreen(context, HomePage());
              },
              leading: Icon(Icons.home),
              title: CustomText(text: "Home"),
            ),
            ListTile(
              onTap: () async {
                await user.getOrders();
                changeScreen(context, OrdersScreen());
              },
              leading: Icon(Icons.fastfood),
              title: CustomText(text: "My Orders"),
            ),
            ListTile(
              onTap: () {
                changeScreen(context, CartScreen());
              },
              leading: Icon(Icons.shopping_cart),
              title: CustomText(text: "Cart"),
            ),
            ListTile(
              onTap: () {
                user.signOut();
                changeScreenReplacement(context, LoginScreen());
              },
              leading: Icon(Icons.exit_to_app),
              title: CustomText(text: "Log Out"),
            ),
          ],
        ),
      ),
      backgroundColor: white,
      body: app.isLoading
          ? Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Loading(),
                ],
              ),
            )
          : SafeArea(
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
                      textInputAction: TextInputAction.search,
                      onSubmitted: (pattern) async {
                        app.changeLoading();
                              if (app.search == SearchBy.PRODUCTS) {
                                await productProvider.search(
                                    productName: pattern);
                                changeScreen(context, ProductSearchScreen());
                              } else {
                                await brandProvider.search(name: pattern);
                                changeScreen(context, BrandsSearchScreen());
                              }
                              app.changeLoading();
                            },
                      decoration: InputDecoration(
                        hintText: "Find Food and restaurant",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomText(
                  text: "Search by", color: grey, weight: FontWeight.w300,),
                DropdownButton<String>(
                  value: app.filterBy,
                  style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.w300,
                  ),
                  icon: Icon(Icons.filter_list, color: primary,),
                  elevation: 0,
                  onChanged: (value) {
                    if (value == "Products") {
                      app.changeSearchBy(newSearchBy: SearchBy.PRODUCTS);
                    } else {
                      app.changeSearchBy(newSearchBy: SearchBy.BRANDS);
                    }
                  },
                  items: <String>["Products", "Restaurants"].map<
                      DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryProvider.categories.length,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () async {
                              app.changeLoading();
                              await productProvider.loadProductsByCategory(
                                  categoryName: categoryProvider
                                      .categories[index].name
                              );
                              changeScreen(context, CategoryScreen(
                                categoryModel: categoryProvider
                                    .categories[index],
                              ));
                              app.changeLoading();
                            },
                            child: CategoryWidget(
                              category: categoryProvider.categories[index],
                            ),
                          );
                        }
                    ),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Featured",
                          size: 20,
                          color: grey,
                        ),
                      ],
                    ),
                  ),
                  TestFeatured(), //manually featuring
                  //Featured(),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Popular restaurants",
                          size: 20,
                          color: grey,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: brandProvider.brands.map((item) =>
                        GestureDetector(
                          onTap: () async {
                            app.changeLoading();
                            await productProvider.loadProductsByBrand(
                                brandId: item.id
                            );
                            app.changeLoading();
                            changeScreen(context, BrandScreen(
                              brandModel: item,
                            ));
                          },
                          child: BrandWidget(brand: item,),
                        )).toList(),
                  ),
                  // Popular(), //Popular products here
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
//                changeScreen(context, ShoppingBag());
              },
              name: "Bag",
              image: "photo/2013/07/13/10/13/carryout-bag-156779_1280.png",
            ),
            BottomNavIcon(
              onTap: () {
                user.signOut();
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
