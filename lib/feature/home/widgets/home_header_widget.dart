import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onyx_delivery/feature/home/view_model/home_viewmodel.dart';
import 'package:onyx_delivery/services/theme/app_colors.dart';
import 'package:provider/provider.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final authLocal2 = Provider.of<AuthService>(context);
    return Consumer<HomeScreenViewModel>(
      builder: (context, viewModel, _) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              color: AppColors.redColor,
              alignment: AlignmentDirectional.topEnd,
              child: Transform.flip(
                flipX: viewModel.appLanguage.isLTR(context) ? false : true,
                flipY: viewModel.appLanguage.isLTR(context) ? false : false,
                child: SvgPicture.asset("assets/svgs/ic_circle.svg"),
              ),
            ),
            SizedBox(
              height: 127,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                        child: Text(
                          // "Ahmed othman",
                          "${viewModel.authService.userModel?.deliveryName}",
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      "assets/images/deliveryman.png",
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: IconButton(
                        icon: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 0),
                              )
                            ],
                          ),
                          child: SvgPicture.asset(
                            "assets/svgs/ic_language.svg",
                            height: 20,
                            width: 20,
                          ),
                        ),
                        onPressed: () => viewModel.changeLanguage(context),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
