import 'package:rezervasyon/models/user.dart';
import 'package:rezervasyon/services/user/user_base.dart';

class RealUserService implements UserBase{

  static RealUserService? _instance;

  static RealUserService get instance {
    _instance ??= RealUserService._init();
    return _instance!;
  }

  RealUserService._init();

  static const String _baseURL = "https://mekan.kreatifmerkezi.com";
  static const String _baseGET = "/users-json";
  static const String _basePOST = "/api/users";
  static const String _basePUT = "/api/users";
  static const String _baseDELETE = "/api/users-delete";

  @override
  Future<List<AppUser>> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> getUserById({required String id}) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<AppUser> getUserByUsername({required String query}) {
    // TODO: implement getUserByUsername
    throw UnimplementedError();
  }

  @override
  Future<List<AppUser>> getUsersByListUserIds({required List<String> ids}) {
    // TODO: implement getUsersByListUserIds
    throw UnimplementedError();
  }

  @override
  Future<List<AppUser>> getUsersByUsername({required String query}) {
    // TODO: implement getUsersByUsername
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getUsersIdsByUsername({required String query}) {
    // TODO: implement getUsersIdsByUsername
    throw UnimplementedError();
  }

  @override
  Future<bool> updateUser({required AppUser appUser}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

}