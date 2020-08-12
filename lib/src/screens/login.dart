import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:khana_khassi/src/helpers/common_colors.dart';
import 'package:khana_khassi/src/helpers/screen_navigation.dart';
import 'package:khana_khassi/src/providers/auth.dart';
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
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      key: _key,
      backgroundColor: white,
      body: authProvider.status == Status.Authenticating
          ? Loading()
          : SingleChildScrollView(
              //authentication added
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                          "https://firebasestorage.googleapis.com/v0/b/foodapp-5dea8.appspot.com/o/kkimg%2Flogo%2Flogo.png?alt=media&token=6edb5258-640f-40a5-a17e-366bc8968ee9"
                          /* "https://cdn.pixabay.com/photo/2015/08/19/02/27/restaurant-895427_1280.png",
                        height: 240,
                        width: 240,*/
                          ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15,9,27,7),
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
                          border: Border.all(color: red[300],width: 4),
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
                          controller: authProvider.email,
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
                          border: Border.all(color: red[300],width: 4),
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
                          controller: authProvider.password,
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
                        if (!await authProvider.signIn()) {
                          _key.currentState.showSnackBar(
                              SnackBar(content: Text("Login failed!")));
                          return;
                        }
                        authProvider.cleanControllers();
                        changeScreenReplacement(context, HomePage());
                      },
                      child: Container(
                        //adding gesture for auth
                        decoration: BoxDecoration(
                          color: orange[100],
                          border: Border.all(color: red[300],width: 4),
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
