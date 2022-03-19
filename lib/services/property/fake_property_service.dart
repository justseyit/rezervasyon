import 'package:rezervasyon/models/property.dart';
import 'package:rezervasyon/services/property/property_base.dart';

class FakePropertyService implements PropertyBase {
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
    return Future.delayed(
      Duration(seconds: 1),
      () => [
        AppProperty(
            id: 18,
            title: "kreatif merkezi",
            description: "firma acıklaması burada",
            slug: "kreatif-merkezi",
            images: "1645175943.jpg",
            il: "İstanbul",
            ilce: "Beyoğlu",
            address: "Asmalımescit",
            map: "https://g.page/sedatbiga?share",
            status: 1,
            createdAt: "2022-02-18T09:19:03.000000Z",
            updatedAt: "2022-02-19T13:17:42.000000Z",
            profilePhotoUrl:
                "https://ui-avatars.com/api/?name=&color=7F9CF5&background=EBF4FF&format=png"),
        AppProperty(
            id: 18,
            title: "kreatif merkezi",
            description: "firma acıklaması burada",
            slug: "kreatif-merkezi",
            images: "1645175943.jpg",
            il: "İstanbul",
            ilce: "Beyoğlu",
            address: "Asmalımescit",
            map: "https://g.page/sedatbiga?share",
            status: 1,
            createdAt: "2022-02-18T09:19:03.000000Z",
            updatedAt: "2022-02-19T13:17:42.000000Z",
            profilePhotoUrl:
                "https://ui-avatars.com/api/?name=&color=7F9CF5&background=EBF4FF&format=png"),
        AppProperty(
            id: 18,
            title: "kreatif merkezi",
            description: "firma acıklaması burada",
            slug: "kreatif-merkezi",
            images: "1645175943.jpg",
            il: "İstanbul",
            ilce: "Beyoğlu",
            address: "Asmalımescit",
            map: "https://g.page/sedatbiga?share",
            status: 1,
            createdAt: "2022-02-18T09:19:03.000000Z",
            updatedAt: "2022-02-19T13:17:42.000000Z",
            profilePhotoUrl:
                "https://ui-avatars.com/api/?name=&color=7F9CF5&background=EBF4FF&format=png"),
        AppProperty(
            id: 18,
            title: "kreatif merkezi",
            description: "firma acıklaması burada",
            slug: "kreatif-merkezi",
            images: "1645175943.jpg",
            il: "İstanbul",
            ilce: "Beyoğlu",
            address: "Asmalımescit",
            map: "https://g.page/sedatbiga?share",
            status: 1,
            createdAt: "2022-02-18T09:19:03.000000Z",
            updatedAt: "2022-02-19T13:17:42.000000Z",
            profilePhotoUrl:
                "https://ui-avatars.com/api/?name=&color=7F9CF5&background=EBF4FF&format=png"),
        AppProperty(
            id: 18,
            title: "kreatif merkezi",
            description: "firma acıklaması burada",
            slug: "kreatif-merkezi",
            images: "1645175943.jpg",
            il: "İstanbul",
            ilce: "Beyoğlu",
            address: "Asmalımescit",
            map: "https://g.page/sedatbiga?share",
            status: 1,
            createdAt: "2022-02-18T09:19:03.000000Z",
            updatedAt: "2022-02-19T13:17:42.000000Z",
            profilePhotoUrl:
                "https://ui-avatars.com/api/?name=&color=7F9CF5&background=EBF4FF&format=png"),
        AppProperty(
            id: 18,
            title: "kreatif merkezi",
            description: "firma acıklaması burada",
            slug: "kreatif-merkezi",
            images: "1645175943.jpg",
            il: "İstanbul",
            ilce: "Beyoğlu",
            address: "Asmalımescit",
            map: "https://g.page/sedatbiga?share",
            status: 1,
            createdAt: "2022-02-18T09:19:03.000000Z",
            updatedAt: "2022-02-19T13:17:42.000000Z",
            profilePhotoUrl:
                "https://ui-avatars.com/api/?name=&color=7F9CF5&background=EBF4FF&format=png"),
        AppProperty(
            id: 18,
            title: "kreatif merkezi",
            description: "firma acıklaması burada",
            slug: "kreatif-merkezi",
            images: "1645175943.jpg",
            il: "İstanbul",
            ilce: "Beyoğlu",
            address: "Asmalımescit",
            map: "https://g.page/sedatbiga?share",
            status: 1,
            createdAt: "2022-02-18T09:19:03.000000Z",
            updatedAt: "2022-02-19T13:17:42.000000Z",
            profilePhotoUrl:
                "https://ui-avatars.com/api/?name=&color=7F9CF5&background=EBF4FF&format=png"),
        AppProperty(
            id: 18,
            title: "kreatif merkezi",
            description: "firma acıklaması burada",
            slug: "kreatif-merkezi",
            images: "1645175943.jpg",
            il: "İstanbul",
            ilce: "Beyoğlu",
            address: "Asmalımescit",
            map: "https://g.page/sedatbiga?share",
            status: 1,
            createdAt: "2022-02-18T09:19:03.000000Z",
            updatedAt: "2022-02-19T13:17:42.000000Z",
            profilePhotoUrl:
                "https://ui-avatars.com/api/?name=&color=7F9CF5&background=EBF4FF&format=png"),
        AppProperty(
            id: 18,
            title: "kreatif merkezi",
            description: "firma acıklaması burada",
            slug: "kreatif-merkezi",
            images: "1645175943.jpg",
            il: "İstanbul",
            ilce: "Beyoğlu",
            address: "Asmalımescit",
            map: "https://g.page/sedatbiga?share",
            status: 1,
            createdAt: "2022-02-18T09:19:03.000000Z",
            updatedAt: "2022-02-19T13:17:42.000000Z",
            profilePhotoUrl:
                "https://ui-avatars.com/api/?name=&color=7F9CF5&background=EBF4FF&format=png"),
        AppProperty(
            id: 18,
            title: "kreatif merkezi",
            description: "firma acıklaması burada",
            slug: "kreatif-merkezi",
            images: "1645175943.jpg",
            il: "İstanbul",
            ilce: "Beyoğlu",
            address: "Asmalımescit",
            map: "https://g.page/sedatbiga?share",
            status: 1,
            createdAt: "2022-02-18T09:19:03.000000Z",
            updatedAt: "2022-02-19T13:17:42.000000Z",
            profilePhotoUrl:
                "https://ui-avatars.com/api/?name=&color=7F9CF5&background=EBF4FF&format=png"),
        AppProperty(
            id: 18,
            title: "kreatif merkezi",
            description: "firma acıklaması burada",
            slug: "kreatif-merkezi",
            images: "1645175943.jpg",
            il: "İstanbul",
            ilce: "Beyoğlu",
            address: "Asmalımescit",
            map: "https://g.page/sedatbiga?share",
            status: 1,
            createdAt: "2022-02-18T09:19:03.000000Z",
            updatedAt: "2022-02-19T13:17:42.000000Z",
            profilePhotoUrl:
                "https://ui-avatars.com/api/?name=&color=7F9CF5&background=EBF4FF&format=png"),
      ],
    );
  }

  @override
  Future<List<AppProperty>?> getPropertiesByPropertyName(
      {required String query}) {
    // TODO: implement getPropertiesByPropertyName
    throw UnimplementedError();
  }

  @override
  Future<AppProperty?> getPropertyByPropertyID({required int propertyID}) {
    // TODO: implement getPropertyByPropertyID
    throw UnimplementedError();
  }
}
