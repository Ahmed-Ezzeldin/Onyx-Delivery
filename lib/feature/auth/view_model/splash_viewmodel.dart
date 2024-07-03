import 'package:onyx_delivery/data/local/auth_local_data_source.dart';
import 'package:onyx_delivery/feature/home/view/home_screen.dart';
import 'package:onyx_delivery/services/router/nav_service.dart';
import 'package:onyx_delivery/utils/base/base_notifier.dart';
import 'package:onyx_delivery/feature/auth/view/login_screen.dart';

class SplashScreenViewModel extends BaseNotifier {
  SplashScreenViewModel({required this.authLocal});
  final AuthLocalDataSource authLocal;

  void delayFun() {
    Future.delayed(const Duration(milliseconds: 1500), () async {
      await authLocal.loadUser();
      if (authLocal.isLogged) {
        NavService().pushAndRemoveUntilKey(const HomeScreen());
      } else {
        NavService().pushAndRemoveUntilKey(const LoginScreen());
      }
    });
  }
}
