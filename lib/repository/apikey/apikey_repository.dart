import 'package:rezervasyon/services/apikey/real_apikey_service.dart';

class APIKeyRepository{

  static APIKeyRepository? _instance;

  static APIKeyRepository get instance {
    _instance ??= APIKeyRepository._init();
    return _instance!;
  }

  APIKeyRepository._init();

  final RealAPIKeyService _apiKeyService = RealAPIKeyService.instance;
  late final String apiKey;

  Future<void> fetchAPIKey() async{
    try{
      apiKey = (await _apiKeyService.fetchAPIKey())!;
    }catch(ex){
      rethrow;
    }
  }
}