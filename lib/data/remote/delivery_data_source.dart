import 'dart:async';
import 'package:onyx_delivery/data/local/auth_local_data_source.dart';
import 'package:onyx_delivery/feature/auth/models/user_model.dart';
import 'package:onyx_delivery/services/api/app_failure.dart';
import 'package:onyx_delivery/services/api/either.dart';
import 'package:onyx_delivery/services/api/end_points.dart';
import 'package:onyx_delivery/services/api/headers.dart';
import 'package:onyx_delivery/services/api/http_service.dart';

class DeliveryDataSource {
  static Future<Either<AppFailure, UserModel>> getDeliveryBills({required Map<String, dynamic> body}) async {
    try {
      final res = await HttpService.request(
        endPoint: EndPoints.checkDeliveryLogin,
        requestType: RequestType.post,
        header: Headers.guestHeader,
        body: body,
      );
      if (res.right != null) {
        await AuthLocalDataSource().saveUser(UserModel.fromJson(res.right));
        return Either(right: res.right);
      } else {
        return Either(left: res.left);
      }
    } catch (error) {
      return Either(left: AppFailure(message: error.toString()));
    }
  }
}
