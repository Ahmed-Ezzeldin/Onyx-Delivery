import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:onyx_delivery/data/local/shared_preference.dart';
import 'package:onyx_delivery/model/config/logger.dart';
import 'package:onyx_delivery/model/models/user_model.dart';
import 'package:onyx_delivery/model/services/api/app_failure.dart';
import 'package:onyx_delivery/model/services/api/either.dart';
import 'package:onyx_delivery/model/services/api/end_points.dart';
import 'package:onyx_delivery/model/services/api/headers.dart';
import 'package:onyx_delivery/model/services/api/http_service.dart';

class AuthService extends ChangeNotifier {
  UserModel? _userModel;
  UserModel? get userModel => _userModel;
  // bool get isLogged => SharedPref.getBool(SharedPrefKeys.isUserLoggedIn) ?? false == true;
  bool get isLogged => userModel != null;

  ///============================================================================== Save User
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

  ///============================================================================== Load User
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

  ///============================================================================== Remove User
  Future<bool> removeUser() async {
    try {
      await Future.wait([
        SharedPref.remove(SharedPrefKeys.user),
        SharedPref.remove(SharedPrefKeys.isUserLoggedIn),
      ]);
      _userModel = null;
      notifyListeners();
      return true;
    } catch (error) {
      Logger.printt("removeUser error ---> ${error.toString()}");
      return false;
    }
  }

  ///============================================================================== SignOut
  Future<bool> signOut() async {
    try {
      await removeUser();
      return true;
    } catch (error) {
      Logger.printt("signOut error ---> ${error.toString()}");
      return false;
    }
  }

  ///============================================================================== SignIn
  Future<Either<AppFailure, dynamic>> signIn({required Map<String, dynamic> body}) async {
    try {
      final res = await HttpService.request(
        endPoint: EndPoints.login,
        requestType: RequestType.post,
        header: Headers.guestHeader,
        body: body,
      );
      if (res.right != null) {
        await saveUser(UserModel.fromJson(res.right));
        return Either(right: true);
      } else {
        return Either(left: res.left);
      }
    } catch (error) {
      return Either(left: AppFailure(message: error.toString()));
    }
  }

  ///============================================================================================================
  ///============================================================================================================
}
