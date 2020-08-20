import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:khana_khassi/src/models/cart_item.dart';
import 'package:khana_khassi/src/models/order.dart';
import 'package:khana_khassi/src/models/products.dart';
import 'package:khana_khassi/src/models/user.dart';
import 'package:khana_khassi/src/services/order.dart';
import 'package:khana_khassi/src/services/user.dart';
import 'package:uuid/uuid.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  Firestore _firestore = Firestore.instance;
  UserServices _userServices = UserServices();
  OrderServices _orderServices = OrderServices();
  UserModel _userModel;

  //getters
  UserModel get userModel => _userModel;

  Status get status => _status;

  FirebaseUser get user => _user;

  //public var
  List<OrderModel> orders = [];

  final formkey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  //constructor auth initialize
  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }

  //signin
  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      return true;
    } catch (e) {
      return _onError(e.toString());
    }
  }

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        _firestore.collection('users').document(result.user.uid).setData({
          "name": name.text,
          "email": email.text,
          "uid": result.user.uid,
          "likedProduct": [],
          "likedBrands": [],
        });
      });
      /* .then((user) {
        Map<String, dynamic> values = {

        };
        _userServices.createUser(values);
      });*/
      return true;
    } catch (e) {
      /*_status = Status.Unauthenticated;
      notifyListeners();*/
      return _onError(e.toString());
    }
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero); //duration.zero
  }

  Future<void> reloadUserModel() async {
    _userModel = await _userServices.getUserById(user.uid);
    notifyListeners();
  }

  Future<void> _onStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userModel = await _userServices.getUserById(user.uid);
    }
    notifyListeners(); // notify that user is changed
  }

  //add to cart
  Future<bool> addToCart({ProductModel product, int quantity}) async {
    print("The product is: ${product.toString()}");
    print("The qty is: ${quantity.toString()}");
    try {
      var uuid = Uuid();
      String cartItemId = uuid.v4();
      List cart = _userModel.cart;
      //bool itemExists = false
      Map cartItem = {
        "id": cartItemId,
        "name": product.name,
        "image": product.image,
        "brandId": product.brandId,
        "totalBrandSale": product.price * quantity,
        "productId": product.id,
        "price": product.price,
        "quantity": quantity,
      };
      CartItemModel item = CartItemModel.fromMap(cartItem);
      //if itemexists
      print("Cart Items are: ${cart.toString()}");
      _userServices.addToCart(userId: _user.uid, cartItem: item);
      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  //get order method
  getOrders() async {
    orders = await _orderServices.getUserOrders(userId: _user.uid);
    notifyListeners();
  }

  //remove from cart

  Future<bool> removeFromCart({CartItemModel cartItem}) async {
    print("The product is: ${cartItem.toString()}");
    try {
      _userServices.removeFromCart(userId: _user.uid, cartItem: cartItem);
      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  //Extra Methods
  bool _onError(String error) {
    _status = Status.Unauthenticated;
    notifyListeners();
    print("We get an error: $error");
    return false;
  }

  void cleanControllers() {
    name.text = "";
    password.text = "";
    email.text = "";
  }
}
