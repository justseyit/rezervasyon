import 'package:rezervasyon/models/property.dart';
import 'package:rezervasyon/services/property/property_base.dart';

class FakePropertyService implements PropertyBase{

  static FakePropertyService? _instance;

  static FakePropertyService get instance {
    _instance ??= FakePropertyService._init();
    return _instance!;
  }

  FakePropertyService._init();

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