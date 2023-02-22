import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:khana_khassi/src/models/cart_item.dart';
import 'package:khana_khassi/src/models/order.dart';

class OrderServices {
  String collection = "orders";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createOrder(
      {String userId,
      String id,
      String description,
      String status,
      List<CartItemModel> cart,
      int totalPrice}) {
    List<Map> convertedCart = [];
    List<String> brandIds = [];
    for (CartItemModel item in cart) {
      convertedCart.add(item.toMap());
      brandIds.add(item.brandId);
    }
    _firestore.collection(collection).doc(id).set({
      "userId": userId,
      "id": id,
      "brandIds": brandIds,
      "cart": convertedCart,
      "total": totalPrice,
      "createdAt": DateTime.now().millisecondsSinceEpoch,
      "description": description,
      "status": status,
    });
    
  }

  Future<List<OrderModel>> getUserOrders({String userId}) async {
    List<OrderModel> orders = [];
    QuerySnapshot snapshot = await _firestore
        .collection(collection)
        .where("userId", isEqualTo: userId)
        .get();
    snapshot.docs.forEach((doc) {
      orders.add(OrderModel.fromSnapshot(doc));
    });
    return orders;
  }
}
