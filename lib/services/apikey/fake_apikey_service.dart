import 'package:rezervasyon/services/apikey/apikey_base.dart';

class FakeAPIKeyService implements APIKeyBase{
  @override
  Future<String?> fetchAPIKey() {
    return Future.delayed(
      const Duration(seconds: 4),
        () => "fake_app_token"
    );
  }

}