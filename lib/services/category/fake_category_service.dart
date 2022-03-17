import 'dart:convert';

import 'package:rezervasyon/models/category.dart';
import 'package:rezervasyon/services/category/category_base.dart';

class FakeCategoryService implements CategoryBase{
  static FakeCategoryService? _instance;

  static FakeCategoryService get instance {
    _instance ??= FakeCategoryService._init();
    return _instance!;
  }

  FakeCategoryService._init();

  @override
  Future<List<AppCategory?>> getCategories() {
    List<AppCategory?> cats = [];
    cats.add(
        AppCategory.fromJson(jsonDecode(r'{ "id": 30, "cat_name": "Restaurant", "slug": "restaurant", "description": "", "row": 1, "status": 1, "created_at": "2022-02-04T11:38:16.000000Z", "updated_at": "2022-02-04T11:38:16.000000Z", "profile_photo_url": "https://ui-avatars.com/api/?name=&color=7F9CF5&background=EBF4FF" }'))
    );
    cats.add(
      AppCategory.fromJson(jsonDecode(r'{ "id": 32, "cat_name": "Temizlik", "slug": "temizlik", "description": null, "row": null, "status": 1, "created_at": "2022-02-21T08:41:57.000000Z", "updated_at": "2022-02-21T08:41:57.000000Z", "profile_photo_url": "https://ui-avatars.com/api/?name=&color=7F9CF5&background=EBF4FF" }'))
    );
    return Future.delayed(const Duration(seconds: 1),
        ()=> cats);
  }
}