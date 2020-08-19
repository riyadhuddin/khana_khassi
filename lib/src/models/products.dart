import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const ID = "id";
  static const NAME = "name";
  static const RATING = "rating";
  static const IMAGE = "image";
  static const PRICE = "price";
  static const BRAND_ID = "brandId";
  static const BRAND = "brand";
  static const DESCRIPTION = "description";
  static const CATEGORY = "category";
  static const FEATURED = "featured";
  static const RATES = "rates";
  static const USER_LIKES = "userLikes";

  //private var
  String _id;
  String _name;
  String _brandId;
  String _brand;
  String _category;
  String _image;
  String _description;

  double _rating;
  int _price;
  int _rates;
  bool _featured;

  //getter
  String get id => _id;

  String get name => _name;

  String get brandId => _brandId;

  String get brand => _brand;

  String get category => _category;

  String get image => _image;

  String get description => _description;

  double get rating => _rating;

  int get price => _price;

  int get rates => _rates;

  bool get featured => _featured;

  //public variable
  bool liked = false;

  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _image = snapshot.data[IMAGE];
    _brand = snapshot.data[BRAND];
    _brandId = snapshot.data[BRAND_ID].toString();
    _description = snapshot.data[DESCRIPTION];
    _category = snapshot.data[CATEGORY];
    _rating = snapshot.data[RATING];
    _price = snapshot.data[PRICE].floor();
    _rates = snapshot.data[rates];
    _featured = snapshot.data[FEATURED];
    //liked = snapshot.data[USER_LIKES];
  }
}
