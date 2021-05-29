import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String title;

  const ScreenTitle(this.title);
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: Curves.easeInQuart,
      duration: Duration(milliseconds: 1000),
      tween: Tween<double>(begin: 0, end: 1),
      child: Text(title,
          style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white)),
      builder: (BuildContext context, double value, child) =>
          Opacity(opacity: value, child: child),
    );
  }
}
