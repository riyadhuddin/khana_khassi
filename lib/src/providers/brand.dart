import 'package:flutter/cupertino.dart';
import 'package:khana_khassi/src/models/brand.dart';
import 'package:khana_khassi/src/services/brand.dart';

class BrandProvider with ChangeNotifier {
  BrandServices _brandServices = BrandServices();
  List<BrandModel> brands = [];
  List<BrandModel> searchedBrands = [];

  BrandModel brand;

  BrandProvider.initialize() {
    loadBrands();
  }

  loadBrands() async {
    brands = await _brandServices.getBrands();
    notifyListeners();
  }

  loadsingleBrand({String brandId}) async {
    brand = await _brandServices.getBrandById(id: brandId);
    notifyListeners();
  }

  Future search(String name) async {
    searchedBrands = await _brandServices.searchBrand(brandName: name);
    print("Searched items are :${searchedBrands.length}");
    //fututre use case
    notifyListeners();
  }
}
