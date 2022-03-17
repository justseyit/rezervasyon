import 'package:rezervasyon/models/user.dart';

abstract class UserBase{
  Future<AppUser?> getUserById({required String id});
  Future<List<AppUser>> getUsersByListUserIds({required List<String> ids});
  Future<List<AppUser>> getAllUsers();
  Future<AppUser> getUserByUsername({required String query});
  Future<List<AppUser>> getUsersByUsername({required String query});
  Future<List<String>> getUsersIdsByUsername({required String query});
  Future<bool> updateUser({required AppUser appUser});
}