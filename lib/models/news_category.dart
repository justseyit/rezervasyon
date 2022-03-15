import 'package:quiver/core.dart';

enum NCategory{
  Sport,
  Journal,
  Politics,
  Economy,
  World,
  Magazine,
  Technology
}

class NewsCategory{
  late final String _title;
  late final String _code;
  final NCategory category;
  String get title => _title;
  String get code => _code;

  NewsCategory({required this.category}){
    switch(category){
      case NCategory.Sport:
        _title = 'Spor';
        _code = 'spor';
        break;
      case NCategory.Journal:
        _title = 'Gündem';
        _code = 'gundem';
        break;
      case NCategory.Politics:
        _title = 'Siyaset';
        _code = 'siyaset';
        break;
      case NCategory.Economy:
        _title = 'Ekonomi';
        _code = 'ekonomi';
        break;
      case NCategory.World:
        _title = 'Dünya';
        _code = 'dunya';
        break;
      case NCategory.Magazine:
        _title = 'Magazin';
        _code = 'magazin';
        break;
      case NCategory.Technology:
        _title = 'Teknoloji';
        _code = 'teknoloji';
        break;
    }
  }

  bool operator ==(o) => o is NewsCategory && _title == o.title && _code == o.code && category == o.category;
  int get hashCode => hash3(_title.hashCode, _code.hashCode, category.hashCode);


}

