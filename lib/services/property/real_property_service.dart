import 'dart:convert';

import 'package:rezervasyon/models/property.dart';
import 'package:rezervasyon/services/property/property_base.dart';
import 'package:http/http.dart' as http;

import '../../repository/apikey/apikey_repository.dart';

class RealPropertyService implements PropertyBase {
  static RealPropertyService? _instance;

  static RealPropertyService get instance {
    _instance ??= RealPropertyService._init();
    return _instance!;
  }

  RealPropertyService._init();
  static const String baseURL = 'https://mekan.kreatifmerkezi.com/';
  static const String getPropertiesEndpoint = 'api/properties-json';
  static const String addPropertyEndpoint = 'api/properties';
  static const String updatePropertyEndpoint = 'api/properties/';
  static const String deletePropertyEndpoint = 'api/properties-delete/';

  @override
  Future<bool> addProperty({required AppProperty property}) async {
    var result = await http.post(
      Uri.parse('$baseURL$addPropertyEndpoint}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(property.toJson()),
    );
    return result.statusCode == 200 ? true : false;
  }

  @override
  Future<bool> deletePropertyByPropertyID({required int propertyID}) async {
    var result = await http.delete(
      Uri.parse('$baseURL$deletePropertyEndpoint$propertyID}'),
      headers: {'Content-Type': 'application/json'},
    );
    return result.statusCode == 200 ? true : false;
  }

  @override
  Future<List<AppProperty>?> getAllProperties() async {
    List<AppProperty> properties = [];
    var result = await http.get(
      Uri.parse('$baseURL$getPropertiesEndpoint/${APIKeyRepository.instance.apiKey}'),
    );
    if (result.statusCode == 200) {
      var jsonProperties = json.decode(result.body);
      for (var jsonProperty in jsonProperties) {
        properties.add(AppProperty.fromJson(jsonProperty));
      }
    }
    return properties;
  }

  @override
  Future<List<AppProperty>?> getPropertiesByPropertyName({required String query}) async {
    List<AppProperty>? properties = await getAllProperties();
    if (properties != null) {
      return properties.where((property) => property.title!.toLowerCase().contains(query.toLowerCase())).toList();
    }
    return null;
  }

  @override
  Future<AppProperty?> getPropertyByPropertyID({required int propertyID}) {
    // TODO: implement getPropertyByPropertyID
    throw UnimplementedError();
  }
}
