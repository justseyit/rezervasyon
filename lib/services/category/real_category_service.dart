import 'dart:convert';

import '../../models/category.dart';
import '../../repository/apikey/apikey_repository.dart';
import 'category_base.dart';
import 'package:http/http.dart' as http;

class RealCategoryService implements CategoryBase {
  static RealCategoryService? _instance;

  static RealCategoryService get instance {
    _instance ??= RealCategoryService._init();
    return _instance!;
  }

  RealCategoryService._init();
  static const String baseUrl = 'https://mekan.kreatifmerkezi.com/';
  static const String getCategoriesEndpoint = 'api/categories-json';

  @override
  Future<List<AppCategory?>> getCategories() async {
    List<AppCategory?> categories = [];
    var result = await http.get(
      Uri.parse('$baseUrl$getCategoriesEndpoint/${APIKeyRepository.instance.apiKey}'),
      headers: {'Content-Type': 'application/json'},
    );
    if (result.statusCode == 200) {
      var jsonCategories = json.decode(result.body);
      for (var jsonCategory in jsonCategories) {
        categories.add(AppCategory.fromJson(jsonCategory));
      }
    }
    return categories;
  }
}
