import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:khana_khassi/src/models/user.dart';
import 'package:khana_khassi/src/services/user.dart';

enum Status { Uninitialized, Unauthenticated, Authenticating, Authenticated }

class AuthProvider with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  Firestore _firestore = Firestore.instance;
  UserServices _userServices = UserServices();
  UserModel _userModel;

  //getters
  UserModel get userModel => _userModel;

  Status get status => _status;

  FirebaseUser get user => _user;

  final formkey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  //constructor auth initialize
  AuthProvider.initialize() : _auth = FirebaseAuth.instance {
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
    return Future.delayed(Duration(microseconds: 1)); //duration.zero
  }

  Future<void> _onStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userModel = await _userServices.getUserById(firebaseUser.uid);
    }
    notifyListeners(); // notify that user is changed
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
