import 'package:rezervasyon/models/user.dart';

abstract class AuthBase{
  Future<AppUser?> login({required String username, required String password});
  Future<AppUser?> register({required String username, required String email, required String password, required String fullName});
  Future<bool> sendResetPasswordEmail({required String email});
  Future<bool> sendVerificationEmail({required String email});
  Future<bool> checkIfEmailAvailable({required String email});
  Future<bool> checkIfUsernameAvailable({required String username});
  Future<bool> logout();

}