import 'package:flutter/material.dart';
import 'package:onyx_delivery/data/remote/delivery_data_source.dart';
import 'package:onyx_delivery/feature/auth/models/user_model.dart';
import 'package:onyx_delivery/services/api/app_failure.dart';
import 'package:onyx_delivery/services/api/either.dart';

class DeliveryRepository extends ChangeNotifier {
  Future<Either<AppFailure, UserModel>> getNotifications() async {
    try {
      var res = await DeliveryDataSource.getDeliveryBills(
        body: {
          "offset": "_pageOffset",
          "limit": "_pageLimit",
        },
      );
      if (res.left != null) {
        return Either(left: res.left);
      } else {
        return Either(right: res.right);
      }
    } catch (e) {
      return Either(left: AppFailure(message: e.toString()));
    }
  }
}
