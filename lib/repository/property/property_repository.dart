import 'package:rezervasyon/services/property/fake_property_service.dart';
import 'package:rezervasyon/services/property/real_property_service.dart';

import '../../models/property.dart';

enum PropertyBackendSource{
  Fake,
  Real
}

class PropertyRepository{
  static PropertyRepository? _instance;

  static PropertyRepository get instance {
    _instance ??= PropertyRepository._init();
    return _instance!;
  }


  /*
  switch(_propertyBackendSource){
      case PropertyBackendSource.Fake:

      case PropertyBackendSource.Real:
    }
  */
  PropertyRepository._init();

  final PropertyBackendSource _propertyBackendSource = PropertyBackendSource.Fake;
  final FakePropertyService _fakePropertyService = FakePropertyService.instance;
  final RealPropertyService _realPropertyService = RealPropertyService.instance;

  Future<List<AppProperty>?> getAllProperties() async{
    switch(_propertyBackendSource){
      case PropertyBackendSource.Fake:
        return await _fakePropertyService.getAllProperties();

      case PropertyBackendSource.Real:
        return await _realPropertyService.getAllProperties();
    }
  }

  Future<List<AppProperty>?> getPropertiesByPropertyName({required String query}) async{
    switch(_propertyBackendSource){
      case PropertyBackendSource.Fake:
        return await _fakePropertyService.getPropertiesByPropertyName(query: query);

      case PropertyBackendSource.Real:
        return await _realPropertyService.getPropertiesByPropertyName(query: query);
    }
  }

  Future<AppProperty?> getPropertyByPropertyID({required int propertyID}) async{
    switch(_propertyBackendSource){
      case PropertyBackendSource.Fake:
        return await _fakePropertyService.getPropertyByPropertyID(propertyID: propertyID);

      case PropertyBackendSource.Real:
        return await _realPropertyService.getPropertyByPropertyID(propertyID: propertyID);
    }
  }

  Future<bool> addProperty({required AppProperty property}) async{
    switch(_propertyBackendSource){
      case PropertyBackendSource.Fake:
        return await _fakePropertyService.addProperty(property: property);

      case PropertyBackendSource.Real:
        return await _realPropertyService.addProperty(property: property);
    }
  }

  Future<bool> deletePropertyByPropertyID({required int propertyID}) async{
    switch(_propertyBackendSource){
      case PropertyBackendSource.Fake:
        return await _fakePropertyService.deletePropertyByPropertyID(propertyID: propertyID);
      case PropertyBackendSource.Real:
        return await _realPropertyService.deletePropertyByPropertyID(propertyID: propertyID);
    }
  }
}