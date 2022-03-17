import 'package:rezervasyon/models/user.dart';
import 'package:rezervasyon/services/auth/auth_base.dart';
import 'package:http/http.dart' as http;

class RealAuthService implements AuthBase{

  static RealAuthService? _instance;

  static RealAuthService get instance {
    _instance ??= RealAuthService._init();
    return _instance!;
  }

  RealAuthService._init();

  @override
  Future<bool> checkIfEmailAvailable({required String email}) {
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> login({required String username, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> register({required String username, required String email, required String password, required String fullName}) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<bool> sendResetPasswordEmail({required String email}) {
    // TODO: implement sendResetPasswordEmail
    throw UnimplementedError();
  }

  @override
  Future<bool> sendVerificationEmail({required String email}) {
    // TODO: implement sendVerificationEmail
    throw UnimplementedError();
  }

  @override
  Future<bool> checkIfUsernameAvailable({required String username}) {
    // TODO: implement checkIfUsernameAvailable
    throw UnimplementedError();
  }

}