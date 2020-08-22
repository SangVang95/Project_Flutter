

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  final ThemeData theme;
  final MaterialColor color;

  ThemeState({@required this.color, @required this.theme});
  @override
  // TODO: implement props
  List<Object> get props => [theme, color];
}

