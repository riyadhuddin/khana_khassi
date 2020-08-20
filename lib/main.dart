import 'package:flutter/material.dart';
import 'package:khana_khassi/src/providers/app.dart';
import 'package:khana_khassi/src/providers/brand.dart';
import 'package:khana_khassi/src/providers/category.dart';
import 'package:khana_khassi/src/providers/product.dart';
import 'package:khana_khassi/src/providers/user.dart';
import 'package:khana_khassi/src/screens/home.dart';
import 'package:khana_khassi/src/screens/login.dart';
import 'package:khana_khassi/src/screens/register.dart';
import 'package:khana_khassi/src/widgets/loading.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //init
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: AppProvider()),
      ChangeNotifierProvider.value(value: UserProvider.initialize()),
      ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
      ChangeNotifierProvider.value(value: BrandProvider.initialize()),
      ChangeNotifierProvider.value(value: ProductProvider.initialize()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Khana Khassi',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ScreenController(),
      //LoginScreen(),
    ),
  ));
}

class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return HomePage();
      default:
        return LoginScreen();
    }
  }
}
