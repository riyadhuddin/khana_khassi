class CartItemModel {
  static const ID = "id";
  static const NAME = "name";
  static const IMAGE = "image";
  static const PRODUCT_ID = "productId";
  static const QUANTITY = "quantity";
  static const PRICE = "price";
  static const BRAND_ID = "brandId";
  static const TOTAL_BRAND_SALE = "totalBrandSales";

  //private var
  String _id;
  String _name;
  String _image;
  String _productId;
  String _brandId;
  int _price;
  int _totalBrandSales;
  int _quantity;

  //getters
  String get id => _id;

  String get name => _name;

  String get image => _image;

  String get productId => _productId;

  String get brandId => _brandId;

  int get price => _price;

  int get totalBrandSales => _totalBrandSales;

  int get quantity => _quantity;

  CartItemModel.fromMap(Map data) {
    _id = data[ID];
    _name = data[NAME];
    _image = data[IMAGE];
    _productId = data[PRODUCT_ID];
    _brandId = data[BRAND_ID];
    _price = data[PRICE];
    _totalBrandSales = data[TOTAL_BRAND_SALE];
    _quantity = data[QUANTITY];
  }

  Map toMap() => {
        ID: _id,
        NAME: _name,
        IMAGE: _image,
        PRODUCT_ID: _productId,
        BRAND_ID: _brandId,
        PRICE: _price,
        TOTAL_BRAND_SALE: _totalBrandSales,
        QUANTITY: _quantity,
      };
}
