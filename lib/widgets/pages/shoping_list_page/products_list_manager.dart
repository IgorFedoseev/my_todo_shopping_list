import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/domain/entity/product.dart';

class ProductListManager extends ChangeNotifier {
  final _products = <ShoppingList>[];
  bool _createNewProduct = false;
  int _selectedIndex = -1;

  List<ShoppingList> get products => _products;
  bool get isCreatingNewProduct => _createNewProduct;
  int get selectedIndex => _selectedIndex;
  ShoppingList? get selectedProduct =>
      _selectedIndex != -1 ? _products[_selectedIndex] : null;

  void createNewProduct() {
    _createNewProduct = true;
    notifyListeners();
  }

  void completeCreatingProduct() {
    _createNewProduct = false;
    _selectedIndex = -1;
    notifyListeners();
  }

  void deleteProduct(int index) {
    _products.removeAt(index);
    notifyListeners();
  }

  void setSelectedProduct(String id){
    final index = products.indexWhere((element) => element.id == id);
    _selectedIndex = index;
    _createNewProduct = false;
    notifyListeners();
  }

  void productTapped(int index){
    _selectedIndex = index;
    _createNewProduct = false;
    notifyListeners();
  }

  void addCompleteProduct(ShoppingList product) {
    _products.add(product);
    _createNewProduct = false;
    notifyListeners();
  }

  void addResumeProduct(ShoppingList product) {
    _products.add(product);
    notifyListeners();
  }

  void editProduct(ShoppingList product, int index) {
    _products[index] = product;
    _selectedIndex = -1;
    _createNewProduct = false;
    notifyListeners();
  }

  void completeProduct(int index, bool isTaken) {
    final product = _products[index];
    _products[index] = product.copyWith(isTaken: isTaken);
    notifyListeners();
  }
}
