import 'package:flutter/material.dart';
import 'package:khana_khassi/src/providers/auth.dart';
import 'package:khana_khassi/src/screens/home.dart';
import 'package:khana_khassi/src/screens/login.dart';
import 'package:khana_khassi/src/screens/register.dart';
import 'package:khana_khassi/src/widgets/loading.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //init
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider.value(value: AuthProvider.initialize())],
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
    final auth = Provider.of<AuthProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return RegisterScreen();
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
