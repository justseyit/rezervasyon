import 'package:rezervasyon/services/category/fake_category_service.dart';
import 'package:rezervasyon/services/category/real_category_service.dart';

import '../../models/category.dart';

enum CategoryBackendSource{
  Fake,
  Real
}

class CategoryRepository{
  static CategoryRepository? _instance;

  static CategoryRepository get instance {
    _instance ??= CategoryRepository._init();
    return _instance!;
  }

  CategoryRepository._init();

  final CategoryBackendSource _categoryBackendSource = CategoryBackendSource.Fake;
  final FakeCategoryService _fakeCategoryService = FakeCategoryService.instance;
  final RealCategoryService _realCategoryService = RealCategoryService.instance;


  Future<List<AppCategory?>> getCategories() async{
    switch(_categoryBackendSource){
      case CategoryBackendSource.Fake:
        return await _fakeCategoryService.getCategories();

      case CategoryBackendSource.Real:
        return await _realCategoryService.getCategories();
    }
  }
}