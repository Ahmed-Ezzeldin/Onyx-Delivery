import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:onyx_delivery/utils/shared_preference.dart';
import 'package:onyx_delivery/utils/providers/provider_setup.dart';
import 'package:onyx_delivery/services/localization/app_language.dart';
import 'package:onyx_delivery/services/router/nav_service.dart';
import 'package:onyx_delivery/services/theme/app_colors.dart';
import 'package:onyx_delivery/feature/auth/view/splash_screen.dart';
import 'package:onyx_delivery/services/theme/app_theme.dart';
import 'package:onyx_delivery/utils/app_environment.dart';
import 'package:onyx_delivery/utils/logger.dart';
import 'package:provider/provider.dart';

void main() async {
  try {
    AppEnvironment.initialize(EnvironmentType.development);
    WidgetsFlutterBinding.ensureInitialized();
    await SharedPref.initialize();
  } catch (error) {
    Logger.printt(error, isError: true);
  }
  setupProviders();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<AppLanguage>(
        builder: (context, language, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppEnvironment.instance.appName,
            // Theme
            color: AppColors.primaryColor,
            theme: AppTheme.lightTheme,
            themeMode: ThemeMode.light,
            // Navigation
            navigatorKey: NavService().navigationKey,
            home: const SplashScreen(),
            // Localizations
            locale: language.appLocale,
            supportedLocales: language.supportedLocales,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
