import 'package:flutter/material.dart';
import 'package:onyx_delivery/feature/home/view_model/home_viewmodel.dart';
import 'package:onyx_delivery/utils/base/base_widget.dart';
import 'package:onyx_delivery/services/localization/app_language.dart';
import 'package:onyx_delivery/feature/home/widgets/home_header_widget.dart';
import 'package:onyx_delivery/feature/home/widgets/order_item_widget.dart';
import 'package:onyx_delivery/feature/home/widgets/orders_switcher_button_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeScreenViewModel>(
      model: HomeScreenViewModel(
        appLanguage: Provider.of<AppLanguage>(context),
      ),
      builder: (_, viewModel, child) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const HomeHeaderWidget(),
              const SizedBox(height: 20),
              const OrdersSwitcherButtonWidget(),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (ctx, index) {
                    return const OrderItemWidget();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
