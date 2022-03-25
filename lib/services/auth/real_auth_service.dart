import 'dart:convert';

import 'package:rezervasyon/models/user.dart';
import 'package:rezervasyon/repository/apikey/apikey_repository.dart';
import 'package:rezervasyon/services/auth/auth_base.dart';
import 'package:http/http.dart' as http;

class RealAuthService implements AuthBase {
  static RealAuthService? _instance;

  static RealAuthService get instance {
    _instance ??= RealAuthService._init();
    return _instance!;
  }

  RealAuthService._init();
  final http.Client _client = http.Client();
  static const String baseUrl = 'https://mekan.kreatifmerkezi.com/';
  static const String checkEmailEndpoint = 'api/emailcontrol';
  static const String checkUsernameEndpoint = 'api/usernamecontrol';
  static const String loginEndpoint = 'api/usercontrol';
  static const String registerEndpoint = 'api/userregister';

  @override
  Future<bool> checkIfEmailAvailable({required String email}) async {
    var result = await http.post(
      Uri.parse('$baseUrl$checkEmailEndpoint/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'app_token': APIKeyRepository.instance.apiKey}),
    );
    return result.body.isEmpty ? false : true;
  }

  @override
  Future<AppUser?> login({required String username, required String password}) async {
    var result = await http.post(
      Uri.parse('$baseUrl$loginEndpoint/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'username': username, 'password': password, 'app_token': APIKeyRepository.instance.apiKey}),
    );
    if (result.statusCode == 200) {
      return AppUser.fromJson(json.decode(result.body));
    } else {
      return null;
    }
  }

  @override
  Future<bool> logout() {
    return Future.value(true);
  }

  @override
  Future<AppUser?> register({required String username, required String email, required String password, required String fullName}) async {
    var result = await http.post(
      Uri.parse('$baseUrl$registerEndpoint/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'username': username, 'email': email, 'password': password, 'full_name': fullName, 'app_token': APIKeyRepository.instance.apiKey}),
    );
    if (result.statusCode == 200) {
      return AppUser.fromJson(json.decode(result.body));
    } else {
      return null;
    }
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
  Future<bool> checkIfUsernameAvailable({required String username}) async {
    var result = await http.post(
      Uri.parse('$baseUrl$checkUsernameEndpoint/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'username': username, 'app_token': APIKeyRepository.instance.apiKey}),
    );
    return result.body.isEmpty ? false : true;
  }
}
