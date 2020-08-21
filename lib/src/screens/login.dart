import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:khana_khassi/src/providers/brand.dart';
import 'package:khana_khassi/src/providers/category.dart';
import 'package:khana_khassi/src/providers/product.dart';
import 'package:khana_khassi/src/utils/common_colors.dart';
import 'package:khana_khassi/src/utils/screen_navigation.dart';
import 'package:khana_khassi/src/providers/user.dart';
import 'package:khana_khassi/src/screens/home.dart';
import 'package:khana_khassi/src/screens/register.dart';
import 'package:khana_khassi/src/widgets/CustomText.dart';
import 'package:khana_khassi/src/widgets/loading.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final brandProvider = Provider.of<BrandProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      key: _key,
      backgroundColor: white,
      body: userProvider.status == Status.Authenticating
          ? Loading()
          : SingleChildScrollView(
              //authentication added
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                          "https://i.ibb.co/gZHBbq5/logo.png"
                          //  height: 120,
                        // width: 120,
                        /* "https://cdn.pixabay.com/photo/2015/08/19/02/27/restaurant-895427_1280.png",
                        height: 240,
                        width: 240,*/
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 9, 27, 7),
                    child: CustomText(
                      text: "Welcome to Khana Khassi",
                      size: 20,
                      color: orange[600],
                      weight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        /*border: Border.all(color: grey),
                          borderRadius: BorderRadius.circular(15),*/
                        color: orange[100],
                        border: Border.all(color: red[300], width: 4),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.elliptical(17, 50),
                          bottomLeft: Radius.circular(19),
                          topLeft: Radius.elliptical(17, 50),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          controller: userProvider.email,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "E-mail",
                            icon: Icon(Icons.email),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        /*border: Border.all(color: grey),
                          borderRadius: BorderRadius.circular(15),*/
                        color: orange[100],
                        border: Border.all(color: red[300], width: 4),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.elliptical(17, 50),
                          bottomLeft: Radius.circular(19),
                          topLeft: Radius.elliptical(40, 9),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          controller: userProvider.password,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            icon: Icon(Icons.lock),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () async {
                        if (!await userProvider.signIn()) {
                          _key.currentState.showSnackBar(
                              SnackBar(content: Text("Login failed!")));
                          return;
                        }
                        categoryProvider.loadCategories();
                        brandProvider.loadBrands();
                        productProvider.loadProducts();
                        userProvider.cleanControllers();
                        changeScreenReplacement(context, HomePage());
                      },
                      child: Container(
                        //adding gesture for auth
                        decoration: BoxDecoration(
                          color: orange[100],
                          border: Border.all(color: red[300], width: 4),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.elliptical(17, 15),
                            bottomLeft: Radius.circular(30),
                            topLeft: Radius.elliptical(40, 9),
                            topRight: Radius.circular(20),
                          ), //BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: "Login",
                                color: black,
                                size: 22,
                                weight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeScreen(context, RegisterScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Register here",
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      text: "Free khaiya bills na diya chole ja",
                      size: 20,
                      color: red[200],
                      weight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
