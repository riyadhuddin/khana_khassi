import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  static const ID = "id";
  static const NAME = "name";
  static const AVG_PRICE = "avgPrice";
  static const RATING = "rating";
  static const RATES = "rates";
  static const IMAGE = "image";
  static const POPULAR = "popular";
  static const USER_LIKES = "userLikes";

  //private var
  String _id;
  String _name;
  String _image;
  List<String> _userLikes;
  double _rating;
  double _avgPrice;
  bool _popular;
  int _rates;

  // getters
  String get id => _id;

  String get name => _name;

  String get image => _image;

  List<String> get userLikes => _userLikes;

  double get rating => _rating;

  double get avgPrice => _avgPrice;

  bool get popular => _popular;

  int get rates => _rates;

  //private variable
  bool liked = false;

  BrandModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String,dynamic>;
    _id = data[ID];
    _name = data[NAME];
    _image = data[IMAGE];
    _userLikes = data[USER_LIKES];
    _rating = data[RATING];
    _avgPrice = data[AVG_PRICE];
    _popular = data[POPULAR];
    _rates = data[RATES];
  }
}
