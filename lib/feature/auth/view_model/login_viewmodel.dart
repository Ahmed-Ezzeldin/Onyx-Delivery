import 'package:flutter/material.dart';
import 'package:onyx_delivery/data/remote/auth_remote_data_source.dart';
import 'package:onyx_delivery/utils/base/base_notifier.dart';
import 'package:onyx_delivery/services/router/nav_service.dart';
import 'package:onyx_delivery/feature/home/view/home_screen.dart';
import 'package:onyx_delivery/utils/customs/language_dialog.dart';
import 'package:onyx_delivery/utils/dialogs_helper.dart';

class LoginViewModel extends BaseNotifier {
  final AuthRemoteDataSource authRemote;
  LoginViewModel({required this.authRemote}) {
    userIdController.text = "1010";
    passwordController.text = "1";
  }

  final formKey = GlobalKey<FormState>();
  var autovalidateMode = AutovalidateMode.disabled;
  final userIdController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;

  @override
  void dispose() {
    userIdController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> changeLanguage(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (ctx) {
        return const LanguageDialog();
      },
    );
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      login();
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState();
    }
  }

  Future<void> login() async {
    setBusy();
    final res = await authRemote.login(
      body: {
        "Value": {
          "P_LANG_NO": "1",
          "P_DLVRY_NO": userIdController.text,
          "P_PSSWRD": passwordController.text,
        }
      },
    );
    if (res.left != null) {
      setError();
      failure = res.left?.message;
      DialogsHelper.messageDialog(message: "${res.left?.message}");
    } else {
      setIdle();
      NavService().pushKey(const HomeScreen());
    }
  }
}
