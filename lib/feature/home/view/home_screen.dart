import 'package:flutter/material.dart';
import 'package:onyx_delivery/data/local/auth_local_data_source.dart';
import 'package:onyx_delivery/domain/repositories/delivery_repository.dart';
import 'package:onyx_delivery/feature/auth/view/login_screen.dart';
import 'package:onyx_delivery/feature/home/view_model/home_viewmodel.dart';
import 'package:onyx_delivery/feature/home/widgets/empty_delivery_bill_widgte.dart';
import 'package:onyx_delivery/services/router/nav_service.dart';
import 'package:onyx_delivery/utils/base/base_widget.dart';
import 'package:onyx_delivery/services/localization/app_language.dart';
import 'package:onyx_delivery/feature/home/widgets/home_header_widget.dart';
import 'package:onyx_delivery/feature/home/widgets/delivery_bill_item_widget.dart';
import 'package:onyx_delivery/feature/home/widgets/orders_switcher_button_widget.dart';
import 'package:onyx_delivery/utils/customs/main_progress.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeScreenViewModel>(
      model: HomeScreenViewModel(
        appLanguage: Provider.of<AppLanguage>(context),
        authLocal: Provider.of<AuthLocalDataSource>(context),
        deliveryRepo: DeliveryRepository(),
      ),
      initState: (vireModel) => vireModel.getDeliveryBills(),
      builder: (_, viewModel, child) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const HomeHeaderWidget(),
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  viewModel.authLocal.signOut().then((value) {
                    NavService().pushAndRemoveUntilKey(const LoginScreen());
                  });
                },
              ),
              const SizedBox(height: 20),
              const OrdersSwitcherButtonWidget(),
              const SizedBox(height: 20),
              viewModel.isBusy
                  ? const MainProgress()
                  : Expanded(
                      child: RefreshIndicator(
                        onRefresh: viewModel.getDeliveryBills,
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                          child: (viewModel.deliveryBillList ?? []).isEmpty
                              ? const EmptyDeliveryBillWidgte()
                              // : ListView.builder(
                              //     shrinkWrap: true,
                              //     itemCount: viewModel.deliveryBillList?.length ?? 0,
                              //     itemBuilder: (ctx, index) {
                              //       final item = viewModel.deliveryBillList?[index];
                              //       return OrderItemWidget(deliveryBill: item);
                              //     },
                              //   ),
                              : Column(
                                  children: List.generate(viewModel.deliveryBillList?.length ?? 0, (index) {
                                    final item = viewModel.deliveryBillList?[index];
                                    return DeliveryBillItemWidget(deliveryBill: item);
                                  }),
                                ),
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
