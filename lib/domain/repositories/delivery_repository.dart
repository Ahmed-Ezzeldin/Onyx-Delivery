import 'package:onyx_delivery/data/remote/delivery_data_source.dart';
import 'package:onyx_delivery/feature/home/models/delivery_bill_model.dart';
import 'package:onyx_delivery/services/api/app_failure.dart';
import 'package:onyx_delivery/services/api/either.dart';

class DeliveryRepository {
  Future<Either<AppFailure, List<DeliveryBillModel>>> getDeliveryBills({required Map<String, dynamic> body}) async {
    try {
      var res = await DeliveryDataSource.getDeliveryBills(body: body);
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
