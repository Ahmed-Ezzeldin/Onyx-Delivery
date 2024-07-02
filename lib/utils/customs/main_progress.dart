import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onyx_delivery/services/theme/app_colors.dart';

class MainProgress extends StatelessWidget {
  final Color color;
  final double diameter;
  final double stroke;
  final double height;

  const MainProgress({
    Key? key,
    this.color = AppColors.primaryColor,
    this.stroke = 4,
    this.diameter = 35,
    this.height = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: diameter,
        width: diameter,
        child: Platform.isAndroid
            ? CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(color),
                strokeWidth: stroke,
              )
            : CupertinoActivityIndicator(radius: diameter * 0.5),
      ),
    );
  }
}
