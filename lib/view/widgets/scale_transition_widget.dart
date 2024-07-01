import 'package:flutter/material.dart';

class ScaleTransitionWidget extends StatefulWidget {
  const ScaleTransitionWidget({
    required this.child,
    this.begin = 0.0,
    this.end = 1.0,
    this.milliseconds = 2000,
    this.curve = Curves.fastOutSlowIn,
    this.alignment = Alignment.center,
    Key? key,
  }) : super(key: key);
  final double end;
  final double begin;
  final Widget child;
  final int milliseconds;
  final Curve curve;
  final Alignment alignment;
  @override
  ScaleTransitionWidgetState createState() => ScaleTransitionWidgetState();
}

class ScaleTransitionWidgetState extends State<ScaleTransitionWidget> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(milliseconds: widget.milliseconds),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    animation = Tween<double>(begin: widget.begin, end: widget.end)
        .animate(CurvedAnimation(parent: animationController, curve: widget.curve));
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      alignment: widget.alignment,
      scale: animation,
      child: widget.child,
    );
  }
}
