import 'package:flutter/material.dart';
import 'package:khana_khassi/src/screens/home.dart';
import 'package:khana_khassi/src/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
      //HomePage(),
    );
  }
}
