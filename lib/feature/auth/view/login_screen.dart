import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onyx_delivery/data/local/auth_local_data_source.dart';
import 'package:onyx_delivery/feature/auth/view_model/login_viewmodel.dart';
import 'package:onyx_delivery/feature/auth/widgets/floating_animated_widget.dart';
import 'package:onyx_delivery/feature/auth/widgets/login_header_widget.dart';
import 'package:onyx_delivery/utils/base/base_widget.dart';
import 'package:onyx_delivery/utils/customs/main_progress.dart';
import 'package:onyx_delivery/utils/customs/main_textfield.dart';
import 'package:onyx_delivery/utils/size_config.dart';
import 'package:onyx_delivery/services/localization/app_language.dart';
import 'package:onyx_delivery/services/theme/app_colors.dart';
import 'package:onyx_delivery/utils/customs/main_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      model: LoginViewModel(
        authService: Provider.of<AuthLocalDataSource>(context),
      ),
      builder: (_, viewModel, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const LoginHeaderWidget(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: viewModel.formKey,
                    autovalidateMode: viewModel.autovalidateMode,
                    child: Column(
                      children: [
                        SizedBox(height: 0.025.sh),
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
                          controller: viewModel.userIdController,
                          hint: "User ID",
                          validator: Validator.userId,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          isFilled: true,
                          borderRadius: 22,
                          borderWidth: 0.01,
                          fillColor: AppColors.fillColor,
                        ),
                        MainTextField(
                          controller: viewModel.passwordController,
                          hint: "Password",
                          validator: Validator.password,
                          keyboardType: TextInputType.visiblePassword,
                          textAlign: TextAlign.center,
                          isFilled: true,
                          borderRadius: 22,
                          borderWidth: 0.01,
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
                        viewModel.isBusy
                            ? const MainProgress()
                            : MainButton(
                                radius: 22,
                                height: 44,
                                width: double.infinity,
                                title: "Log in",
                                onPressed: viewModel.submitForm,
                              ),
                        const SizedBox(height: 30),
                        FloatingAnimatedWidget(
                          end: const Offset(0.0, 0.05),
                          milliseconds: 2000,
                          child: SvgPicture.asset("assets/svgs/delivery_car.svg"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
