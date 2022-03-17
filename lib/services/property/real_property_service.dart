import 'package:rezervasyon/models/property.dart';
import 'package:rezervasyon/services/property/property_base.dart';

class RealPropertyService implements PropertyBase{
  static RealPropertyService? _instance;

  static RealPropertyService get instance {
    _instance ??= RealPropertyService._init();
    return _instance!;
  }

  RealPropertyService._init();

  @override
  Future<bool> addProperty({required AppProperty property}) {
    // TODO: implement addProperty
    throw UnimplementedError();
  }

  @override
  Future<bool> deletePropertyByPropertyID({required int propertyID}) {
    // TODO: implement deletePropertyByPropertyID
    throw UnimplementedError();
  }

  @override
  Future<List<AppProperty>?> getAllProperties() {
    // TODO: implement getAllProperties
    throw UnimplementedError();
  }

  @override
  Future<List<AppProperty>?> getPropertiesByPropertyName({required String query}) {
    // TODO: implement getPropertiesByPropertyName
    throw UnimplementedError();
  }

  @override
  Future<AppProperty?> getPropertyByPropertyID({required int propertyID}) {
    // TODO: implement getPropertyByPropertyID
    throw UnimplementedError();
  }
}