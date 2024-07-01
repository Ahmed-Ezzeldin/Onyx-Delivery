import 'dart:developer';
import 'package:onyx_delivery/model/config/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefKeys {
  static const String isUserLoggedIn = "isUserLoggedIn";
  static const String user = "user";
  static const String languageCode = "languageCode";
  static const String theme = "theme";
}

class SharedPref {
  static SharedPreferences? sharedPref;
  static Future<void> initialize() async {
    if (sharedPref == null) {
      sharedPref = await SharedPreferences.getInstance();
      setDefaultValues(getString(SharedPrefKeys.theme) == null);
    }
  }

  ///==================================================================================
  ///=============================================================== Set Default Values
  static void setDefaultValues(bool isNullValue) {
    if (isNullValue) {
      setString(SharedPrefKeys.theme, "Light");
      setString(SharedPrefKeys.languageCode, "en");
      setBool(SharedPrefKeys.isUserLoggedIn, false);
      log("*** setDefaultValues is called ***");
    }
  }

  ///==================================================================================
  ///=============================================================================  Get
  static String? getString(String key) {
    try {
      return sharedPref!.getString(key);
    } catch (error) {
      Logger.printt(error, isError: true);
      return null;
    }
  }

  static bool? getBool(String key) {
    try {
      return sharedPref!.getBool(key);
    } catch (error) {
      Logger.printt(error, isError: true);
      return null;
    }
  }

  static int? getInt(String key) {
    try {
      return sharedPref!.getInt(key);
    } catch (error) {
      Logger.printt(error, isError: true);
      return null;
    }
  }

  ///==================================================================================
  ///=============================================================================  Set
  static Future<bool> setString(String key, String value) async {
    try {
      return await sharedPref!.setString(key, value);
    } catch (error) {
      Logger.printt(error, isError: true);
      return false;
    }
  }

  static Future<bool> setBool(String key, bool value) async {
    try {
      return await sharedPref!.setBool(key, value);
    } catch (error) {
      Logger.printt(error, isError: true);
      return false;
    }
  }

  static Future<bool> setInt(String key, int value) async {
    try {
      return await sharedPref!.setInt(key, value);
    } catch (error) {
      Logger.printt(error, isError: true);
      return false;
    }
  }

  ///==================================================================================
  ///=========================================================================== Reload
  static Future<void> reload() async {
    try {
      await sharedPref!.reload();
    } catch (error) {
      Logger.printt(error, isError: true);
    }
  }

  ///==================================================================================
  ///=========================================================================== Remove
  static Future<bool> remove(String key) async {
    try {
      return await sharedPref!.remove(key);
    } catch (error) {
      Logger.printt(error, isError: true);
      return false;
    }
  }

  ///==================================================================================
  ///============================================================================ Clear
  static Future<bool> clear() async {
    try {
      return await sharedPref!.clear();
    } catch (error) {
      Logger.printt(error, isError: true);
      return false;
    }
  }
}
