import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onyx_delivery/services/localization/app_language.dart';
import 'package:onyx_delivery/utils/size_config.dart';

class EmptyDeliveryBillWidgte extends StatelessWidget {
  const EmptyDeliveryBillWidgte({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        SvgPicture.asset("assets/svgs/ic_emptyorder.svg"),
        const SizedBox(height: 20),
        const Text(
          "No orders yet",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ).localize(context),
        const SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.15.sw),
          child: const Text(
            "You don't have any orders in your history.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ).localize(context),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
