import 'package:flutter/material.dart';
import 'package:onyx_delivery/data/local/auth_local_data_source.dart';
import 'package:onyx_delivery/domain/repositories/delivery_repository.dart';
import 'package:onyx_delivery/feature/home/models/delivery_bill_model.dart';
import 'package:onyx_delivery/utils/customs/language_dialog.dart';
import 'package:onyx_delivery/utils/base/base_notifier.dart';
import 'package:onyx_delivery/services/localization/app_language.dart';
import 'package:onyx_delivery/utils/dialogs_helper.dart';

class HomeScreenViewModel extends BaseNotifier {
  HomeScreenViewModel({
    required this.appLanguage,
    required this.authService,
    required this.deliveryRepo,
  });

  final AppLanguage appLanguage;
  final AuthLocalDataSource authService;
  final DeliveryRepository deliveryRepo;
  bool isNew = true;
  List<DeliveryBillModel>? deliveryBillList = [];

  Future<void> changeLanguage(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (ctx) {
        return const LanguageDialog();
      },
    );
  }

  Future<void> getDeliveryBills() async {
    setBusy();
    final res = await deliveryRepo.getDeliveryBills(
      body: {
        "Value": {
          "P_DLVRY_NO": "1010",
          "P_LANG_NO": "1",
          "P_BILL_SRL": "",
          "P_PRCSSD_FLG": "",
        }
      },
    );
    if (res.left != null) {
      setError();
      failure = res.left?.message;
      DialogsHelper.messageDialog(message: "${res.left?.message}");
    } else {
      deliveryBillList = res.right;
      // deliveryBillList = [];
      setIdle();
    }
  }
}
