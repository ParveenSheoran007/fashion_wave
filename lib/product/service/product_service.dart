import 'dart:convert';

import 'package:fashion_wave/product/model/product_model.dart';
import 'package:fashion_wave/shared/api_end_point.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(
      Uri.parse(ApiEndpoints.product),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      List<ProductModel> products =
          data.map((item) => ProductModel.fromJson(item)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
