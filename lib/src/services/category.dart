import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:khana_khassi/src/models/category.dart';

class CategoryServices {
  String collection = "categories";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  
  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> categories = [];
    QuerySnapshot snapshot = await _firestore.collection(collection).get();
    snapshot.docs.forEach((doc) {
      categories.add(CategoryModel.fromSnapshot(doc));
    });
    return categories;
  }
}
