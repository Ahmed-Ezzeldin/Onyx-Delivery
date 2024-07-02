import 'package:onyx_delivery/utils/shared_preference.dart';

class Headers {
  static Map<String, String> get guestHeader => {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Accept-Language": SharedPref.getString(SharedPrefKeys.languageCode) ?? "en",
      };

  static Map<String, String> get userHeader => {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Accept-Language": SharedPref.getString(SharedPrefKeys.languageCode) ?? "en",
      };
}
