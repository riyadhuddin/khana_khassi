import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:khana_khassi/src/models/brand.dart';

class BrandServices {
  String collection = "brands";
  Firestore _firestore = Firestore.instance;

  Future<List<BrandModel>> getBrands() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<BrandModel> brands = [];
        for (DocumentSnapshot brand in result.documents) {
          brands.add(BrandModel.fromSnapshot(brand));
        }
        return brands;
      });

  Future<BrandModel> getBrandById({String id}) => _firestore
          .collection(collection)
          .document(id.toString())
          .get()
          .then((doc) {
        return BrandModel.fromSnapshot(doc);
      });

  Future<List<BrandModel>> searchBrand({String brandName}) {
    String searchKey = brandName[0].toUpperCase() + brandName.substring(1);
    return _firestore
        .collection(collection)
        .orderBy("name")
        .startAt([searchKey])
        .endAt([searchKey + '\uf8ff'])
        .getDocuments()
        .then((result) {
          List<BrandModel> brands = [];
          for (DocumentSnapshot product in result.documents) {
            brands.add(BrandModel.fromSnapshot(product));
          }
          return brands;
        });
  }
}
