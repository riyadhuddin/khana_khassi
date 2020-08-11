import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const NAME = "name";
  static const Email = "email";
  static const ID = "id";

  //private variable
  String _name;
  String _email;
  String _id;

  //getter

  String get name => _name;

  String get email => _email;

  String get id => _id;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data[NAME];
    _email = snapshot.data[Email];
    _id = snapshot.data[ID];
  }
}
