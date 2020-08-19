import 'package:flutter/cupertino.dart';

enum SearchBy { PRODUCTS, BRANDS }

class AppProvider with ChangeNotifier {
  bool isLoading = false;
  SearchBy search = SearchBy.PRODUCTS;
  String filterBy = "Products";
  int totalPrice = 0;
  int priceSum = 0;
  int quantitySum = 0;

  void changeLoaading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void changeSearchBy({SearchBy newSearchBy}) {
    search = newSearchBy;
    if (newSearchBy == SearchBy.PRODUCTS) {
      filterBy = "Products";
    } else {
      filterBy = "Brands";
    }
    newSearchBy;
  }

  addPrice({int newPrice}) {
    priceSum += newPrice;
    notifyListeners();
  }

  addQuantity({int newQuantity}) {
    quantitySum += newQuantity;
    notifyListeners();
  }

  getTotalPrice() {
    print("THE TOTAL SUM IS: $priceSum");
    print("THE QUANTITY SUM IS: $quantitySum");
    totalPrice = priceSum * quantitySum;
    print("THE TOTAL AMOUNT IS: $totalPrice");
    notifyListeners();
  }
}
