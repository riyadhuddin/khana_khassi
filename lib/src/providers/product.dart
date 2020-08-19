import 'package:flutter/cupertino.dart';
import 'package:khana_khassi/src/models/products.dart';
import 'package:khana_khassi/src/services/products.dart';

class ProductProvider with ChangeNotifier {
  ProductServices _productServices = ProductServices();
  List<ProductModel> products = [];
  List<ProductModel> productsByCategory = [];
  List<ProductModel> productsByBrand = [];
  List<ProductModel> productsSearched = [];

  ProductProvider.initialize() {
    loadProducts();
  }

  loadProducts() async {
    products = await _productServices.getProducts();
    notifyListeners();
  }

  Future loadProductsByCategory({String categoryName}) async {
    productsByCategory =
        await _productServices.getProductsByCategory(category: categoryName);
    notifyListeners();
  }

  Future loadProductsByBrand({String brandId}) async {
    productsByBrand = await _productServices.getProductsByBrand(id: brandId);
    notifyListeners();
  }

  Future search({String productName}) async {
    productsSearched =
        await _productServices.searchProducts(productName: productName);
    print("Number of items found: ${productsSearched.length}");
    notifyListeners();
  }
}
