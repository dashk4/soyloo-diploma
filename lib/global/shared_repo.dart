import 'package:shared_preferences/shared_preferences.dart';

class SharedRepository {
  static Future<void> setTerms(bool isTrue) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("TERMS", isTrue);
  }

  static Future<bool?> getTerms() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("TERMS");
  }
}
