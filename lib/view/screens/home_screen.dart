import 'package:flutter/material.dart';
import 'package:onyx_delivery/model/base/base_notifier.dart';
import 'package:onyx_delivery/model/base/base_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeScreenModel>(
      model: HomeScreenModel(),
      builder: (_, model, child) {
        return Scaffold(
          appBar: AppBar(title: const Text("Home Screen")),
          body: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(0),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Home"),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HomeScreenModel extends BaseNotifier {}
