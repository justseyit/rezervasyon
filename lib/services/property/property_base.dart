import 'package:rezervasyon/models/property.dart';

abstract class PropertyBase{
  Future<List<AppProperty>?> getAllProperties();
  Future<List<AppProperty>?> getPropertiesByPropertyName({required String query});
  Future<AppProperty?> getPropertyByPropertyID({required int propertyID});
  Future<bool> addProperty({required AppProperty property});
  Future<bool> deletePropertyByPropertyID({required int propertyID});
}