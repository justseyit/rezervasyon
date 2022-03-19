import 'dart:convert';
import 'dart:math';

import 'package:rezervasyon/models/user.dart';
import 'package:rezervasyon/services/auth/auth_base.dart';

class FakeAuthService implements AuthBase {
  static FakeAuthService? _instance;

  static FakeAuthService get instance {
    _instance ??= FakeAuthService._init();
    return _instance!;
  }

  FakeAuthService._init();

  @override
  Future<bool> checkIfEmailAvailable({required String email}) {
    // TODO: implement checkIfEmailAvailable
    throw UnimplementedError();
  }

  @override
  Future<bool> checkIfUsernameAvailable({required String username}) {
    // TODO: implement checkIfUsernameAvailable
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> login({required String username, required String password}) {
    return Future.delayed(Duration(seconds: 1), () => AppUser.fromJson(jsonDecode(r'{ "id": 1, "name": "ercan aş", "ad_soyad": "ercan tekin", "dogum_tarihi": "1992-06-02", "cinsiyet": 1, "is_tanimi": "16", "email": "ercan.t@kreatifmerkezi.com", "username": "ercantekin", "phone": "0554", "address": "yeşilova mah.", "county": "34", "town": "beyoğlu", "website": "www.ercantekin.com", "instagram_link": "instagram.com/", "facebook_link": "facebook.com/", "twitter_link": "twitter.com/", "cat": "30", "bio": "lisans mezunuyum", "email_verified_at": null, "type": "admin", "current_team_id": null, "profile_photo_path": "profile-photos/DQejjTjjadyH1Q5bXpMtyuP2qf2a3CN7ym9WybrD.jpg", "created_at": "2021-09-08T10:52:46.000000Z", "updated_at": "2022-02-21T09:17:33.000000Z", "app_token": "Cc2BA7qNmQ37cC6C0nsR97DfEFRGAZt7PFibwP67", "profile_photo_url": "https://www.pavilionweb.com/wp-content/uploads/2017/03/man-300x300.png" }')));
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> register({required String username, required String email, required String password, required String fullName}) {
    return Future.delayed(Duration(seconds: 1), () => AppUser.fromJson(jsonDecode(r'{ "id": 1, "name": "ercan aş", "ad_soyad": "ercan tekin", "dogum_tarihi": "1992-06-02", "cinsiyet": 1, "is_tanimi": "16", "email": "ercan.t@kreatifmerkezi.com", "username": "ercantekin", "phone": "0554", "address": "yeşilova mah.", "county": "34", "town": "beyoğlu", "website": "www.ercantekin.com", "instagram_link": "instagram.com/", "facebook_link": "facebook.com/", "twitter_link": "twitter.com/", "cat": "30", "bio": "lisans mezunuyum", "email_verified_at": null, "type": "admin", "current_team_id": null, "profile_photo_path": "profile-photos/DQejjTjjadyH1Q5bXpMtyuP2qf2a3CN7ym9WybrD.jpg", "created_at": "2021-09-08T10:52:46.000000Z", "updated_at": "2022-02-21T09:17:33.000000Z", "app_token": "Cc2BA7qNmQ37cC6C0nsR97DfEFRGAZt7PFibwP67", "profile_photo_url": "https://www.pavilionweb.com/wp-content/uploads/2017/03/man-300x300.png" }')));
  }

  @override
  Future<bool> sendResetPasswordEmail({required String email}) {
    return Future.delayed(Duration(seconds: 1), () => Random().nextBool());
  }

  @override
  Future<bool> sendVerificationEmail({required String email}) {
    // TODO: implement sendVerificationEmail
    throw UnimplementedError();
  }
}
