import 'package:rezervasyon/models/user.dart';
import 'package:rezervasyon/services/user/user_base.dart';

class FakeUserService implements UserBase{
  static FakeUserService? _instance;

  static FakeUserService get instance {
    _instance ??= FakeUserService._init();
    return _instance!;
  }

  FakeUserService._init();

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