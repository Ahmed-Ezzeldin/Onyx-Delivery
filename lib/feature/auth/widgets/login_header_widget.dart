import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onyx_delivery/feature/auth/view_model/login_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(builder: (context, viewModel, _) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: SvgPicture.asset("assets/svgs/login_logo.svg"),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Transform.flip(
                flipX: viewModel.appLanguage.isLTR(context) ? false : true,
                flipY: viewModel.appLanguage.isLTR(context) ? false : false,
                child: SvgPicture.asset("assets/svgs/circle_red.svg"),
              ),
              IconButton(
                icon: SvgPicture.asset("assets/svgs/ic_language_white.svg"),
                onPressed: () => viewModel.changeLanguage(context),
              )
            ],
          ),
        ],
      );
    });
  }
}
