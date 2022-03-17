import 'dart:convert';

import 'package:rezervasyon/services/auth/fake_auth_service.dart';
import 'package:rezervasyon/services/auth/real_auth_service.dart';

import '../../models/user.dart';


enum AuthBackendSource{
  Fake,
  Real
}

class AuthRepository{
  static AuthRepository? _instance;

  static AuthRepository get instance {
    _instance ??= AuthRepository._init();
    return _instance!;
  }

  AuthRepository._init();

  final AuthBackendSource _authBackendSource = AuthBackendSource.Fake;
  final FakeAuthService _fakeAuthService = FakeAuthService.instance;
  final RealAuthService _realAuthService = RealAuthService.instance;
  static AppUser? appUser;

  Future<AppUser?> login({required String username, required String password}) async{
    switch(_authBackendSource){
      case AuthBackendSource.Fake:
        appUser ??= await _fakeAuthService.login(username: username, password: password);
        return await _fakeAuthService.login(username: username, password: password);

      case AuthBackendSource.Real:
        appUser ??= await _fakeAuthService.login(username: username, password: password);
        return await _realAuthService.login(username: username, password: password);
    }
  }

  Future<AppUser?> register({required String username, required String email, required String password, required String fullName}) async{
    switch(_authBackendSource){
      case AuthBackendSource.Fake:
        return await _fakeAuthService.register(username: username, email: email, password: password, fullName: fullName);

      case AuthBackendSource.Real:
        return await _realAuthService.register(username: username, email: email, password: password, fullName: fullName);
    }
  }

  Future<bool> sendResetPasswordEmail({required String email}) async{
    switch(_authBackendSource){
      case AuthBackendSource.Fake:
        return await _fakeAuthService.sendResetPasswordEmail(email: email);

      case AuthBackendSource.Real:
        return await _realAuthService.sendResetPasswordEmail(email: email);
    }
  }

  Future<bool> sendVerificationEmail({required String email}) async{
    switch(_authBackendSource){
      case AuthBackendSource.Fake:
        return await _fakeAuthService.sendVerificationEmail(email: email);

      case AuthBackendSource.Real:
        return await _realAuthService.sendVerificationEmail(email: email);
    }
  }

  Future<bool> checkIfEmailAvailable({required String email}) async{
    switch(_authBackendSource){
      case AuthBackendSource.Fake:
        return await _fakeAuthService.checkIfEmailAvailable(email: email);

      case AuthBackendSource.Real:
        return await _realAuthService.checkIfEmailAvailable(email: email);
    }
  }

  Future<bool> checkIfUsernameAvailable({required String username}) async{
    switch(_authBackendSource){
      case AuthBackendSource.Fake:
        return await _fakeAuthService.checkIfUsernameAvailable(username: username);

      case AuthBackendSource.Real:
        return await _realAuthService.checkIfUsernameAvailable(username: username);
    }
  }

  Future<bool> logout() async{
    switch(_authBackendSource){
      case AuthBackendSource.Fake:
        return await _fakeAuthService.logout();

      case AuthBackendSource.Real:
        return await _realAuthService.logout();
    }
  }

}