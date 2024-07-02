import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:onyx_delivery/utils/shared_preference.dart';
import 'package:onyx_delivery/feature/auth/models/user_model.dart';
import 'package:onyx_delivery/utils/logger.dart';

class AuthLocalDataSource extends ChangeNotifier {
  UserModel? _userModel;
  UserModel? get userModel => _userModel;
  // bool get isLogged => SharedPref.getBool(SharedPrefKeys.isUserLoggedIn) ?? false == true;
  bool get isLogged => userModel != null;

  Future<bool> saveUser(UserModel user) async {
    try {
      await Future.wait([
        SharedPref.setString(SharedPrefKeys.user, json.encode(user.toJson())),
        SharedPref.setBool(SharedPrefKeys.isUserLoggedIn, true),
      ]);
      _userModel = user;
      Logger.printObject(user, title: "saveUser 👤👤");
      notifyListeners();
      return true;
    } catch (error) {
      Logger.printt("saveUser error ---> ${error.toString()}");
      return false;
    }
  }

  Future<bool> loadUser() async {
    try {
      final userString = SharedPref.getString(SharedPrefKeys.user);
      if (userString != null) {
        Map<String, dynamic> userMap = json.decode(userString);
        _userModel = UserModel.fromJson(userMap);
        Logger.printObject(_userModel, title: "loadUser 👤👤");
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (error) {
      Logger.printt("loadUser error ---> ${error.toString()}");
      await SharedPref.clear();
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      await Future.wait([
        SharedPref.remove(SharedPrefKeys.user),
        SharedPref.remove(SharedPrefKeys.isUserLoggedIn),
      ]);
      _userModel = null;
      notifyListeners();
      return true;
    } catch (error) {
      Logger.printt("signOut error ---> ${error.toString()}");
      return false;
    }
  }
}
