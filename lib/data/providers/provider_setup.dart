import 'package:get_it/get_it.dart';
import 'package:onyx_delivery/model/services/api/http_api.dart';
import 'package:onyx_delivery/model/services/auth/auth_service.dart';
import 'package:onyx_delivery/model/services/localization/app_language.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final GetIt getIt = GetIt.instance;

HttpApi api = getIt<HttpApi>();

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => AppLanguage()),
  ChangeNotifierProvider(create: (_) => AuthService(), lazy: false),
];

void setupProviders() {
  getIt.registerLazySingleton(() => HttpApi());
  getIt.registerLazySingleton(() => AuthService());
}
