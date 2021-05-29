import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation _colorAnimation;
  late Animation _sizeAnimation;
  late Animation _curve;

  var isLike = false;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    _curve = CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);

    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(_controller);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 50), weight: 50),
      // TweenSequenceItem<double>(
      //     tween: Tween<double>(begin: 50, end: 30), weight: 50)
    ]).animate(_controller);
    _controller.addListener(() {
      print(_controller.value);
      print(_colorAnimation.value);
    });

    _controller.addStatusListener((status) {
      print(status);
      if (status == AnimationStatus.completed) {
        // setState(() {
        isLike = true;
        // });
      } else {
        // setState(() {
        isLike = false;
        // });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) => IconButton(
          onPressed: () {
            if (isLike) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
            // isLike = !isLike;
          },
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: _sizeAnimation.value,
          )),
      animation: _controller,
    );
  }
}
