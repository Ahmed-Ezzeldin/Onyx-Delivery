import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:onyx_delivery/utils/shared_preference.dart';
import 'package:onyx_delivery/feature/auth/models/user_model.dart';
import 'package:onyx_delivery/utils/logger.dart';
import 'package:onyx_delivery/services/api/app_failure.dart';
import 'package:onyx_delivery/services/api/either.dart';
import 'package:onyx_delivery/services/api/end_points.dart';
import 'package:onyx_delivery/services/api/headers.dart';
import 'package:onyx_delivery/services/api/http_service.dart';

class AuthLocalDataSource extends ChangeNotifier {
  UserModel? _userModel;
  UserModel? get userModel => _userModel;
  bool get isLogged => userModel != null;

  Future<bool> saveUser(UserModel user) async {
    try {
      await Future.wait([
        SharedPref.setString(SharedPrefKeys.user, json.encode(user.toJson())),
        SharedPref.setBool(SharedPrefKeys.isUserLoggedIn, true),
      ]);
      _userModel = user;
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
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (error) {
      await SharedPref.clear();
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      await Future.wait([
        SharedPref.remove(SharedPrefKeys.user),
        SharedPref.remove(SharedPrefKeys.deliveryNo),
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

  Future<Either<AppFailure, dynamic>> login({required Map<String, dynamic> body}) async {
    try {
      final res = await HttpService.request(
        endPoint: EndPoints.checkDeliveryLogin,
        requestType: RequestType.post,
        header: Headers.guestHeader,
        body: body,
      );
      if (res.right != null) {
        await SharedPref.setString(SharedPrefKeys.deliveryNo, body["Value"]["P_DLVRY_NO"]);
        await saveUser(UserModel.fromJson(res.right["Data"]));
        // await AuthLocalDataSource().saveUser(UserModel.fromJson(res.right["Data"]));
        return Either(right: true);
      } else {
        return Either(left: res.left);
      }
    } catch (error) {
      return Either(left: AppFailure(message: error.toString()));
    }
  }
}
