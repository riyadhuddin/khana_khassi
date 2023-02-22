import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:khana_khassi/src/models/brand.dart';

class BrandServices {
  String collection = "brands";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  
  Future<List<BrandModel>> getBrands() async {
    List<BrandModel> brands = [];
    QuerySnapshot snapshot = await _firestore.collection(collection).get();
    snapshot.docs.forEach((doc) {
      brands.add(BrandModel.fromSnapshot(doc));
    });
    return brands;
  }

 
  Future<BrandModel> getBrandById({String id}) async {
    DocumentSnapshot doc = await _firestore.collection(collection).doc(id).get();
    return BrandModel.fromSnapshot(doc);
  }
  
  Future<List<BrandModel>> searchBrand({String brandName}) async {
    String searchKey = brandName[0].toUpperCase() + brandName.substring(1);
    List<BrandModel> brands = [];
    QuerySnapshot snapshot = await _firestore
        .collection(collection)
        .orderBy("name")
        .startAt([searchKey])
        .endAt([searchKey + '\uf8ff'])
        .get();
    snapshot.docs.forEach((doc) {
      brands.add(BrandModel.fromSnapshot(doc));
    });
    return brands;
  }

}
