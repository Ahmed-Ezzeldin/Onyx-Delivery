import 'dart:async';
import 'package:onyx_delivery/feature/home/models/delivery_bill_model.dart';
import 'package:onyx_delivery/services/api/app_failure.dart';
import 'package:onyx_delivery/services/api/either.dart';
import 'package:onyx_delivery/services/api/end_points.dart';
import 'package:onyx_delivery/services/api/headers.dart';
import 'package:onyx_delivery/services/api/http_service.dart';

class DeliveryDataSource {
  static Future<Either<AppFailure, List<DeliveryBillModel>>> getDeliveryBills({required Map<String, dynamic> body}) async {
    try {
      final res = await HttpService.request(
        endPoint: EndPoints.deliveryBillsItems,
        requestType: RequestType.post,
        header: Headers.guestHeader,
        body: body,
      );
      if (res.right != null) {
        List<DeliveryBillModel> deliveryBillList = [];
        deliveryBillList = res.right["Data"]["DeliveryBills"].map<DeliveryBillModel>((e) => DeliveryBillModel.fromJson(e)).toList();
        return Either(right: deliveryBillList);
      } else {
        return Either(left: res.left);
      }
    } catch (error) {
      return Either(left: AppFailure(message: error.toString()));
    }
  }
}
