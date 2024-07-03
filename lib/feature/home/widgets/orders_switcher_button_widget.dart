import 'package:flutter/material.dart';
import 'package:onyx_delivery/feature/home/view_model/home_viewmodel.dart';
import 'package:onyx_delivery/services/theme/app_colors.dart';
import 'package:onyx_delivery/utils/size_config.dart';
import 'package:provider/provider.dart';

class OrdersSwitcherButtonWidget extends StatelessWidget {
  const OrdersSwitcherButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenViewModel>(
      builder: (context, viewModel, _) {
        return Container(
          width: 0.60.sw,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(18),
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
            mainAxisSize: MainAxisSize.min,
            children: [
              SwitchButton(
                isActive: viewModel.isNew,
                title: "New",
                onTap: () {
                  if (viewModel.isNew == false) {
                    viewModel.isNew = true;
                    viewModel.setState();
                  }
                },
              ),
              SwitchButton(
                isActive: !viewModel.isNew,
                title: "Others",
                onTap: () {
                  if (viewModel.isNew == true) {
                    viewModel.isNew = false;
                    viewModel.setState();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class SwitchButton extends StatelessWidget {
  const SwitchButton({
    required this.isActive,
    required this.title,
    this.onTap,
    super.key,
  });
  final bool isActive;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          height: 36,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isActive ? AppColors.primaryColor : AppColors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w600,
              color: isActive ? AppColors.white : AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
