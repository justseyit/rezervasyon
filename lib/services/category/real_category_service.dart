import '../../models/category.dart';
import 'category_base.dart';

class RealCategoryService implements CategoryBase{
  static RealCategoryService? _instance;

  static RealCategoryService get instance {
    _instance ??= RealCategoryService._init();
    return _instance!;
  }

  RealCategoryService._init();

  @override
  Future<List<AppCategory?>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
}