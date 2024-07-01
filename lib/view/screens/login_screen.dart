import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onyx_delivery/model/base/base_notifier.dart';
import 'package:onyx_delivery/model/base/base_widget.dart';
import 'package:onyx_delivery/model/config/logger.dart';
import 'package:onyx_delivery/model/config/size_config.dart';
import 'package:onyx_delivery/model/services/localization/app_language.dart';
import 'package:onyx_delivery/model/services/theme/app_colors.dart';
import 'package:onyx_delivery/view/widgets/language_dialog.dart';
import 'package:onyx_delivery/view/widgets/main_button.dart';
import 'package:onyx_delivery/view/widgets/main_textfield.dart';
import 'package:provider/provider.dart';

class LogininScreen extends StatelessWidget {
  const LogininScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLanguage = Provider.of<AppLanguage>(context);
    return BaseWidget<LogininScreenViewModel>(
      model: LogininScreenViewModel(context: context),
      builder: (_, model, child) {
        return Scaffold(
          // appBar: AppBar(title: const Text("Log in")),
          body: SingleChildScrollView(
            child: Form(
              key: model.formKey,
              autovalidateMode: model.autovalidateMode,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
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
                            flipX: appLanguage.isLTR() ? false : true,
                            flipY: appLanguage.isLTR() ? false : false,
                            child: SvgPicture.asset("assets/svgs/circle_red.svg"),
                          ),
                          IconButton(
                            icon: SvgPicture.asset("assets/svgs/ic_language_white.svg"),
                            onPressed: () => model.changeLanguage(context),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(height: 0.025.h),
                        const Text(
                          "Welcome Back!",
                          style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                          ),
                        ).localize(context),
                        const Text(
                          "Log back into your account",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.primaryColor,
                          ),
                        ).localize(context),
                        const SizedBox(height: 30),
                        MainTextField(
                          controller: model.userIdController,
                          hint: "User ID",
                          validator: Validator.username,
                          keyboardType: TextInputType.name,
                          textAlign: TextAlign.center,
                          isFilled: true,
                          borderRadius: 22,
                          borderWidth: 0.01,
                          borderType: BorderType.outline,
                          fillColor: AppColors.fillColor,
                        ),
                        MainTextField(
                          controller: model.passwordController,
                          hint: "Password",
                          validator: Validator.username,
                          keyboardType: TextInputType.name,
                          textAlign: TextAlign.center,
                          isFilled: true,
                          borderRadius: 22,
                          borderWidth: 0.01,
                          borderType: BorderType.outline,
                          fillColor: AppColors.fillColor,
                        ),
                        Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: MainButton(
                            type: ButtonType.text,
                            radius: 22,
                            textStyle: const TextStyle(fontWeight: FontWeight.bold),
                            title: "Show More",
                            onPressed: () {},
                          ),
                        ),
                        MainButton(
                          radius: 22,
                          height: 44,
                          width: double.infinity,
                          title: "Log in",
                          onPressed: model.submitFun,
                        ),
                        const SizedBox(height: 30),
                        SvgPicture.asset("assets/svgs/delivery_car.svg"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class LogininScreenViewModel extends BaseNotifier {
  final BuildContext context;
  LogininScreenViewModel({required this.context});

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

  Future<void> changeLanguage(
    BuildContext context,
  ) async {
    return await showDialog(
      context: context,
      builder: (ctx) {
        return const LanguageDialog();
      },
    );
  }

  void submitFun() {
    if (formKey.currentState!.validate()) {
      Logger.printt("Email: ${userIdController.text} \nPassword: ${passwordController.text}");
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState();
    }
  }
}
