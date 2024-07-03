import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onyx_delivery/feature/auth/view_model/splash_viewmodel.dart';
import 'package:onyx_delivery/data/local/auth_local_data_source.dart';
import 'package:onyx_delivery/utils/base/base_widget.dart';
import 'package:onyx_delivery/utils/size_config.dart';
import 'package:onyx_delivery/services/theme/app_colors.dart';
import 'package:onyx_delivery/feature/auth/widgets/scale_transition_widget.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BaseWidget<SplashScreenViewModel>(
      model: SplashScreenViewModel(
        authLocal: Provider.of<AuthLocalDataSource>(context),
      ),
      initState: (model) => model.delayFun(),
      builder: (context, model, child) {
        return Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.splashBackground,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                const SizedBox(),
                const SizedBox(),
                ScaleTransitionWidget(
                  milliseconds: 1000,
                  child: SvgPicture.asset(
                    "assets/svgs/splash_logo.svg",
                    width: 0.70.sw,
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SvgPicture.asset(
                      "assets/svgs/splash_bg.svg",
                      width: SizeConfig.width,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SvgPicture.asset(
                        "assets/svgs/delivery_man.svg",
                        height: 0.45.sw,
                        width: 0.45.sw,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
