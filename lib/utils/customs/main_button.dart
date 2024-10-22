import 'package:flutter/material.dart';

enum ButtonType { elevated, text }

class MainButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String title;
  final Widget? child;
  final double? radius;
  final double? elevation;
  final Color? color;
  final ButtonType type;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry padding;
  final Function()? onPressed;

  const MainButton({
    Key? key,
    this.height,
    this.width,
    this.child,
    this.title = "",
    this.radius = 0,
    this.elevation = 0,
    this.color,
    this.type = ButtonType.elevated,
    this.textStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    this.padding = const EdgeInsets.all(0),
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color butColor = color == null ? Theme.of(context).primaryColor : color!;
    switch (type) {
      case ButtonType.elevated:
        {
          return SizedBox(
            height: height,
            width: width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: butColor,
                elevation: elevation,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!)),
              ),
              onPressed: onPressed,
              child: Padding(
                padding: padding,
                child: child ??
                    Text(
                      title,
                      style: textStyle,
                      textAlign: TextAlign.center,
                    ),
              ),
            ),
          );
        }
      case ButtonType.text:
        {
          return SizedBox(
            height: height,
            width: width,
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: butColor,
                elevation: elevation,
                textStyle: textStyle,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!)),
              ),
              onPressed: onPressed,
              child: Padding(
                padding: padding,
                child: child ??
                    Text(
                      title,
                      textAlign: TextAlign.center,
                    ),
              ),
            ),
          );
        }
    }
  }
}
