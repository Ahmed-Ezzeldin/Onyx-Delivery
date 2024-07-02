import 'package:get_it/get_it.dart';
import 'package:onyx_delivery/data/local/auth_local_data_source.dart';
import 'package:onyx_delivery/services/localization/app_language.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final GetIt getIt = GetIt.instance;

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => AppLanguage()),
  ChangeNotifierProvider(create: (_) => AuthLocalDataSource(), lazy: false),
];

void setupProviders() {
  getIt.registerLazySingleton(() => AuthLocalDataSource());
}
