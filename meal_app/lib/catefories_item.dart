

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesItem extends StatelessWidget {

  final String title;
  final Color color;

  CategoriesItem({@required this.title, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      // ignore: deprecated_member_use
      child: Text(title, style: Theme.of(context).textTheme.title,),
      decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
            color.withOpacity(0.7),
            color,],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,),
        borderRadius: BorderRadius.circular(15)
      ),
    );
  }
}
