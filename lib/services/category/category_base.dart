import 'package:rezervasyon/models/category.dart';

abstract class CategoryBase{
  Future<List<AppCategory?>> getCategories();
}