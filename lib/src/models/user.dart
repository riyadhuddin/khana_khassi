import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:khana_khassi/src/models/cart_item.dart';

class UserModel {
  static const NAME = "name";
  static const Email = "email";
  static const ID = "id";
  static const BKASH_ID = "bkashId";
  static const CART = "cart";

  //private variable
  String _name;
  String _email;
  String _id;
  String _bkashId;

  int _priceSum = 0;
  int _quantitySum = 0;

  //getter

  String get name => _name;

  String get email => _email;

  String get id => _id;

  String get bkashId => _bkashId;

  //public variable
  List<CartItemModel> cart;
  int totalCartPrice;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data[NAME];
    _email = snapshot.data[Email];
    _id = snapshot.data[ID];
    _bkashId = snapshot.data[BKASH_ID];
    cart = _convertCartItems(snapshot.data[cart]) ?? [];
    totalCartPrice = snapshot.data[CART] == null
        ? 0
        : getTotalPrice(cart: snapshot.data[CART]);
  }

  int getTotalPrice({List cart}) {
    if (cart == null) {
      return 0;
    }
    for (Map cartItem in cart) {
      _priceSum += cartItem["price"] * cartItem["quantity"];
    }
    int total = _priceSum;
    print("The Total Is $total");
    return total;
  }

  List<CartItemModel> _convertCartItems(List cart) {
    List<CartItemModel> convertedCart = [];
    for (Map cartItem in cart) {
      convertedCart.add(CartItemModel.fromMap(cartItem));
    }
    return convertedCart;
  }
}
