import 'package:rezervasyon/services/user/fake_user_service.dart';
import 'package:rezervasyon/services/user/real_user_service.dart';

import '../../models/user.dart';

enum UserBackendSource { Fake, Real }

/*
  switch(_userBackendSource){
      case UserBackendSource.Fake:
        return await _fakeUserService.
      case UserBackendSource.Real:
        return await _realUserService.
    }
  */

class UserRepository {
  static UserRepository? _instance;

  static UserRepository get instance {
    _instance ??= UserRepository._init();
    return _instance!;
  }

  UserRepository._init();

  final UserBackendSource _userBackendSource = UserBackendSource.Fake;
  final FakeUserService _fakeUserService = FakeUserService.instance;
  final RealUserService _realUserService = RealUserService.instance;

  Future<AppUser?> getUserById({required String id}) async {
    switch (_userBackendSource) {
      case UserBackendSource.Fake:
        return await _fakeUserService.getUserById(id: id);
      case UserBackendSource.Real:
        return await _realUserService.getUserById(id: id);
    }
  }

  Future<List<AppUser>> getUsersByListUserIds(
      {required List<String> ids}) async {
    switch (_userBackendSource) {
      case UserBackendSource.Fake:
        return await _fakeUserService.getUsersByListUserIds(ids: ids);
      case UserBackendSource.Real:
        return await _realUserService.getUsersByListUserIds(ids: ids);
    }
  }

  Future<List<AppUser>> getAllUsers() async {
    switch (_userBackendSource) {
      case UserBackendSource.Fake:
        return await _fakeUserService.getAllUsers();
      case UserBackendSource.Real:
        return await _realUserService.getAllUsers();
    }
  }

  Future<AppUser> getUserByUsername({required String query}) async {
    switch (_userBackendSource) {
      case UserBackendSource.Fake:
        return await _fakeUserService.getUserByUsername(query: query);
      case UserBackendSource.Real:
        return await _realUserService.getUserByUsername(query: query);
    }
  }

  Future<List<AppUser>> getUsersByUsername({required String query}) async {
    switch (_userBackendSource) {
      case UserBackendSource.Fake:
        return await _fakeUserService.getUsersByUsername(query: query);
      case UserBackendSource.Real:
        return await _realUserService.getUsersByUsername(query: query);
    }
  }

  Future<List<String>> getUsersIdsByUsername({required String query}) async {
    switch (_userBackendSource) {
      case UserBackendSource.Fake:
        return await _fakeUserService.getUsersIdsByUsername(query: query);
      case UserBackendSource.Real:
        return await _realUserService.getUsersIdsByUsername(query: query);
    }
  }

  Future<bool> updateUser({required AppUser appUser}) async {
    switch (_userBackendSource) {
      case UserBackendSource.Fake:
        return await _fakeUserService.updateUser(appUser: appUser);
      case UserBackendSource.Real:
        return await _realUserService.updateUser(appUser: appUser);
    }
  }
}
