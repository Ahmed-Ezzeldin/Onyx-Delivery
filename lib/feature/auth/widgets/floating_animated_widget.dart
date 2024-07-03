import 'package:flutter/material.dart';

class FloatingAnimatedWidget extends StatefulWidget {
  const FloatingAnimatedWidget({
    required this.child,
    this.begin = const Offset(0.0, 0.0),
    this.end = const Offset(0.0, 0.1),
    this.milliseconds = 3000,
    Key? key,
  }) : super(key: key);
  final Offset end;
  final Offset begin;
  final Widget child;
  final int milliseconds;

  @override
  FloatingAnimatedWidgetState createState() => FloatingAnimatedWidgetState();
}

class FloatingAnimatedWidgetState extends State<FloatingAnimatedWidget> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(milliseconds: widget.milliseconds),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    animation = Tween<Offset>(begin: widget.begin, end: widget.end)
        .animate(CurvedAnimation(parent: animationController, curve: Curves.ease));
    animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: widget.child,
    );
  }
}