/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rezervasyon/models/news_category.dart';
import 'package:rezervasyon/utils/constants.dart';

class TokenManager {
  static String? token;

  static final FirebaseFirestore _fs = FirebaseFirestore.instance;

  static Future<void> setToken(String? value, {List<String>? categories}) async {
    if (categories == null) {
      for (NewsCategory category in Constants.categories) {
        await _fs.collection('tokens').doc('${category.code}').set({'$value': true}, SetOptions(merge: true));
      }
    } else {
      for (String code in categories) {
        await _fs.collection('tokens').doc('$code').set({'$value': true}, SetOptions(merge: true));
      }
    }
  }

  static Future<void> removeToken(String? value, {required List<String> categories}) async {
    for (String code in categories) {
      await _fs.collection('tokens').doc('$code').set({'$value': false}, SetOptions(merge: true));
    }
  }
}
*/