import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_to_do_shopping_list/domain/entity/product.dart';

enum ApiClientExceptionType {
  network, // ошибка сети
  auth, // ошибка авторизации
  other, // прочее
}

class ApiClientException implements Exception {
  final ApiClientExceptionType type;
  ApiClientException(this.type);
}

class ApiClient {
  Future<T> _get<T>(String path) async {
    try {
      final dataString = await _loadAsset(path);
      final T json = jsonDecode(dataString);
      return json;
    } catch (e) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }

  Future<ProductMock> getProductsList() async {
    await Future.delayed(const Duration(milliseconds: 300));
    // TODO: remove delay simulation
    final json = await _get('assets/json_mock/products_example_mock.json');
    final jsonMap = json as Map<String, dynamic>;
    if (jsonMap["shopping_list"] != null){
      final response = ProductMock.fromJson(jsonMap);
      return response;
    } else {
      return ProductMock(shoppingList: []);
    }
  }

  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
