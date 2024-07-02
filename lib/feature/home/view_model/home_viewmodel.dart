import 'package:flutter/material.dart';
import 'package:onyx_delivery/utils/customs/language_dialog.dart';
import 'package:onyx_delivery/utils/base/base_notifier.dart';
import 'package:onyx_delivery/services/localization/app_language.dart';

class HomeScreenViewModel extends BaseNotifier {
  HomeScreenViewModel({required this.appLanguage});
  final AppLanguage appLanguage;
  bool isNew = true;

  Future<void> changeLanguage(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (ctx) {
        return const LanguageDialog();
      },
    );
  }
}
