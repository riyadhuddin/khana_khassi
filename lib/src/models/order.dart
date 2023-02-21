import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  static const ID = "id";
  static const DESCRIPTION = "description";
  static const CART = "cart";
  static const USER_ID = "userId";
  static const TOTAL = "total";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";
  static const BRAND_ID = "brandId";

  //private var
  String _id;
  String _brandId;
  String _userId;
  String _description;
  String _status;
  int _createdAt;
  int _total;

  //getter
  String get id => _id;

  String get brandId => _brandId;

  String get userId => _userId;

  String get description => _description;

  String get status => _status;

  int get createdAt => _createdAt;

  int get total => _total;

  //public variable
  List cart;

  OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String,dynamic>;
    _id = data[ID];
    _description = data[DESCRIPTION];
    _total = data[TOTAL];
    _status = data[STATUS];
    _userId = data[USER_ID];
    _createdAt = data[CREATED_AT];
    _brandId = data[BRAND_ID];
    cart = data[CART];
  }
}
