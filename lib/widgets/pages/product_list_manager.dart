import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/domain/entity/product.dart';

class ProductListManager extends ChangeNotifier{
  final _products =  <ShoppingList>[];

  List<ShoppingList> get products => _products;

  void deleteProduct(int index){
    _products.removeAt(index);
    notifyListeners();
  }

  void addProduct(ShoppingList product){
    _products.add(product);
    notifyListeners();
  }

  void editProduct(ShoppingList product, int index){
    _products[index] = product;
    notifyListeners();
  }

  void completeProduct(int index, bool isTaken){
    final product = _products[index];
    _products[index] = product.copyWith(isTaken: isTaken);
    notifyListeners();
  }

}