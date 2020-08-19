import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:khana_khassi/src/models/cart_item.dart';
import 'package:khana_khassi/src/models/user.dart';

class UserServices {
  String collection = "users";
  Firestore _firestore = Firestore.instance;

  void createUser(Map<String, dynamic> values) {
    String id = values["id"];
    _firestore.collection(collection).document("id").setData(values);
  }

  void updateUser(Map<String, dynamic> values) {
    _firestore.collection(collection).document(values['id']).updateData(values);
  }

  void addToCart({String userId, CartItemModel cartItem}) {
    print("The user id is: $userId");
    print("cart items are: ${cartItem.toString()}");
    _firestore.collection(collection).document(userId).updateData({
      "cart": FieldValue.arrayUnion([cartItem.toMap()])
    });
  }

  void removeFromCart({String userId, CartItemModel cartItem}) {
    print("The user id is: $userId");
    print("cart items are: ${cartItem.toString()}");
    _firestore.collection(collection).document(userId).updateData({
      "cart": FieldValue.arrayRemove([cartItem.toMap()])
    });
  }

  Future<UserModel> getUserById(String id) =>
      _firestore.collection(collection).document(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });
}
