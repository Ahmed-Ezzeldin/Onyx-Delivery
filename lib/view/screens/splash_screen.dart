import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onyx_delivery/model/base/base_notifier.dart';
import 'package:onyx_delivery/model/base/base_widget.dart';
import 'package:onyx_delivery/model/config/size_config.dart';
import 'package:onyx_delivery/model/services/auth/auth_service.dart';
import 'package:onyx_delivery/model/services/router/nav_service.dart';
import 'package:onyx_delivery/model/services/theme/app_colors.dart';
import 'package:onyx_delivery/view/screens/login_screen.dart';
import 'package:onyx_delivery/view/widgets/scale_transition_widget.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BaseWidget<SplashScreenViewModel>(
      model: SplashScreenViewModel(auth: Provider.of<AuthService>(context)),
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
                    width: SizeConfig.width * 0.70,
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
                        height: SizeConfig.width * 0.45,
                        width: SizeConfig.width * 0.45,
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

class SplashScreenViewModel extends BaseNotifier {
  SplashScreenViewModel({required this.auth});
  final AuthService auth;

  void delayFun() {
    Future.delayed(const Duration(milliseconds: 1500), () async {
      if (auth.isLogged) {
        await auth.loadUser();
        NavService().pushAndRemoveUntilKey(const LogininScreen());
      } else {
        NavService().pushAndRemoveUntilKey(const LogininScreen());
      }
    });
  }
}
