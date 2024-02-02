import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:api_testing/product/model/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<ProductModel> products = <ProductModel>[].obs;

  Future<void> fetchProducts(int currentPage, int pageSize) async {
    try {
      final response = await http.get(
        Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?page=$currentPage&limit=$pageSize'),
      );
      print('API Response: ${response.body}');

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);

        if (data is List) {
          products.assignAll(data.map((item) => ProductModel.fromJson(item)).toList());
        } else {
          throw Exception('Invalid response format. Expected a List.');
        }
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
