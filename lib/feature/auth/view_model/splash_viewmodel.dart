import 'package:onyx_delivery/data/local/auth_local_data_source.dart';
import 'package:onyx_delivery/services/router/nav_service.dart';
import 'package:onyx_delivery/utils/base/base_notifier.dart';
import 'package:onyx_delivery/feature/auth/view/login_screen.dart';

class SplashScreenViewModel extends BaseNotifier {
  SplashScreenViewModel({required this.auth});
  final AuthLocalDataSource auth;

  void delayFun() {
    Future.delayed(const Duration(milliseconds: 1500), () async {
      if (auth.isLogged) {
        await auth.loadUser();
        NavService().pushAndRemoveUntilKey(const LoginScreen());
      } else {
        NavService().pushAndRemoveUntilKey(const LoginScreen());
      }
    });
  }
}
