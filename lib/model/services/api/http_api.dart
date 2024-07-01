import 'dart:async';
import 'package:onyx_delivery/model/services/api/app_failure.dart';
import 'package:onyx_delivery/model/services/api/either.dart';
import 'package:onyx_delivery/model/services/api/end_points.dart';
import 'package:onyx_delivery/model/services/api/headers.dart';
import 'package:onyx_delivery/model/services/api/http_service.dart';

class HttpApi {
  Future<Either<AppFailure, dynamic>> getUsers() async {
    final res = await HttpService.request(
      endPoint: EndPoints.login,
      requestType: RequestType.get,
      header: Headers.userHeader,
    );
    if (res.right != null) {
      return Either(right: res.right);
    } else {
      return Either(left: res.left);
    }
  }
}
