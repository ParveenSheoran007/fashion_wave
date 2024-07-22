import 'dart:convert';

import 'package:fashion_wave/category/model/category_model.dart';
import 'package:fashion_wave/shared/api_end_point.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  Future<List<CategoryModel>> fetchCategories() async {
    final response = await http.get(
      Uri.parse(ApiEndpoints.category),

    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      List<CategoryModel> categories = data.map((item) => CategoryModel.fromJson(item)).toList();
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}