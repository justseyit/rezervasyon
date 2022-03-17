import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:rezervasyon/services/apikey/apikey_base.dart';

class RealAPIKeyService implements APIKeyBase{
  final FirebaseRemoteConfig _config = FirebaseRemoteConfig.instance;

  static RealAPIKeyService? _instance;

  static RealAPIKeyService get instance {
    _instance ??= RealAPIKeyService._init();
    return _instance!;
  }

  RealAPIKeyService._init();

  @override
  Future<String?> fetchAPIKey() async{
    try{
      return _config.getString("app_token");
    }catch(ex){
      rethrow;
    }
  }

}