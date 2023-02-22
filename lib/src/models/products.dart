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
        Map<String, dynamic> data = snapshot.data() as Map<String,dynamic>;
    _id = data[ID];
    _name = data[NAME];
    _image = data[IMAGE];
    _brand = data[BRAND];
    _brandId = data[BRAND_ID].toString();
    _description = data[DESCRIPTION];
    _category = data[CATEGORY];
    _rating = data[RATING];
    _price = data[PRICE].floor();
    _rates = data[rates];
    _featured = data[FEATURED];
    liked = data[USER_LIKES];
  }
}
