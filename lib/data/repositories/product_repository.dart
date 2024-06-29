import 'package:dio/dio.dart';
import 'package:flutter_mvc_getx/data/models/product_model.dart'; 
import 'package:flutter_mvc_getx/utils/api_routes.dart'; 


class ProductRepository {
  final Dio _dio = Dio();

  Future<List<ProductElement>> fetchProducts() async {
    try {
      final response = await _dio.get(ApiRoutes.getProducts);
      print(response.data);  // Print the response data for debugging
      return (response.data['products'] as List)
          .map((product) => ProductElement.fromJson(product))
          .toList();
    } catch (e) {
       print("eoefoef ${e}");
      print(e);  // Print the error for debugging
      throw Exception('Failed to load products');
    }
  }
}