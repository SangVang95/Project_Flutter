import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const Loading({Key key, this.isLoading, @required this.child})
      : assert(child != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return child;
  }
}
