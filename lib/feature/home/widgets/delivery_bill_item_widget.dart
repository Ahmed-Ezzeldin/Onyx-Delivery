import 'package:flutter/material.dart';
import 'package:onyx_delivery/feature/home/models/delivery_bill_model.dart';
import 'package:onyx_delivery/services/localization/app_language.dart';
import 'package:onyx_delivery/services/theme/app_colors.dart';
import 'package:provider/provider.dart';

class DeliveryBillItemWidget extends StatelessWidget {
  const DeliveryBillItemWidget({
    required this.deliveryBill,
    super.key,
  });

  final DeliveryBillModel? deliveryBill;

/*
enum DeliveryStatusFlag {
        static let NEW            = "0"
        static let DELIVERED      = "1"
        static let PARTIAL_RETURN = "2"
        static let FULL_RETURN    = "3"
    }

*/

  String getStatus(String statusFlg) {
    switch (statusFlg) {
      case "0":
        return "New";
      case "1":
        return "Delivered";
      case "2":
        return "Partial Return";
      case "3":
        return "Full Return";
      default:
        return "New";
    }
  }

  Color getColor(String statusFlg) {
    switch (statusFlg) {
      case "0":
        return AppColors.statusNew;
      case "1":
        return AppColors.statusDelivered;
      case "2":
        return AppColors.redColor;
      case "3":
        return AppColors.redColor;
      default:
        return AppColors.primaryColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLanguage = Provider.of<AppLanguage>(context);

    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 6),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // "#1569999",
                    "#${deliveryBill?.bILLNO}",
                    style: const TextStyle(
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OrderInfoWidget(
                          color: getColor("${deliveryBill?.dLVRYSTATUSFLG}"),
                          title: "Status",
                          // value: "Delivering",
                          value: getStatus("${deliveryBill?.dLVRYSTATUSFLG}"),
                        ),
                        const VerticalDivider(color: AppColors.grey, thickness: 1),
                        OrderInfoWidget(
                          title: "Total price",
                          // value: "6378 LE",
                          value: "${(double.tryParse("${deliveryBill?.tAXAMT}") ?? 0).toStringAsFixed(2)} LE",
                        ),
                        const VerticalDivider(color: AppColors.grey, thickness: 1),
                        OrderInfoWidget(
                          title: "Date",
                          // value: "11/6/2020",
                          value: "${deliveryBill?.bILLDATE}",
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Container(
            width: 44,
            height: 100,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              // color: AppColors.primaryColor,
              color: getColor("${deliveryBill?.dLVRYSTATUSFLG}"),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(appLanguage.isLTR(context) ? 8 : 0),
                bottomRight: Radius.circular(appLanguage.isLTR(context) ? 8 : 0),
                topLeft: Radius.circular(appLanguage.isLTR(context) ? 0 : 8),
                bottomLeft: Radius.circular(appLanguage.isLTR(context) ? 0 : 8),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Order Details",
                  style: TextStyle(fontSize: 8, color: AppColors.white),
                ).localize(context),
                const SizedBox(height: 5),
                const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderInfoWidget extends StatelessWidget {
  const OrderInfoWidget({
    required this.title,
    required this.value,
    this.color = AppColors.primaryColor,
    super.key,
  });
  final String title;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.greyColor,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ).localize(context),
          const SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
              // color: AppColors.primaryColor,
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
          ).localize(context),
        ],
      ),
    );
  }
}
