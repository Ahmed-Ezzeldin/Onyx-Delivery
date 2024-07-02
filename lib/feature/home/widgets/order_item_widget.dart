import 'package:flutter/material.dart';
import 'package:onyx_delivery/services/theme/app_colors.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "#1569999",
                    style: TextStyle(
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
                          title: "Status",
                          value: "Delivering",
                        ),
                        VerticalDivider(color: AppColors.grey, thickness: 1),
                        OrderInfoWidget(
                          title: "Total price",
                          value: "6378 LE",
                        ),
                        VerticalDivider(color: AppColors.grey, thickness: 1),
                        OrderInfoWidget(
                          title: "Date",
                          value: "11/6/2020",
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
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Order Details",
                  style: TextStyle(fontSize: 8, color: AppColors.white),
                ),
                SizedBox(height: 5),
                Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.white),
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
    super.key,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const Text("#1569999"),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.greyColor,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
