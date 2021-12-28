// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../main.dart' as _i1;
import '../screens/second_page.dart' as _i2;
import '../screens/third_page.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MyHomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.MyHomePage());
    },
    SecondRoute.name: (routeData) {
      final args = routeData.argsAs<SecondRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.SecondPage(key: args.key, name: args.name));
    },
    ThirdRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.ThirdPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(MyHomeRoute.name, path: '/'),
        _i4.RouteConfig(SecondRoute.name, path: '/second-page'),
        _i4.RouteConfig(ThirdRoute.name, path: '/third-page')
      ];
}

/// generated route for
/// [_i1.MyHomePage]
class MyHomeRoute extends _i4.PageRouteInfo<void> {
  const MyHomeRoute() : super(MyHomeRoute.name, path: '/');

  static const String name = 'MyHomeRoute';
}

/// generated route for
/// [_i2.SecondPage]
class SecondRoute extends _i4.PageRouteInfo<SecondRouteArgs> {
  SecondRoute({_i5.Key? key, required String name})
      : super(SecondRoute.name,
            path: '/second-page', args: SecondRouteArgs(key: key, name: name));

  static const String name = 'SecondRoute';
}

class SecondRouteArgs {
  const SecondRouteArgs({this.key, required this.name});

  final _i5.Key? key;

  final String name;

  @override
  String toString() {
    return 'SecondRouteArgs{key: $key, name: $name}';
  }
}

/// generated route for
/// [_i3.ThirdPage]
class ThirdRoute extends _i4.PageRouteInfo<void> {
  const ThirdRoute() : super(ThirdRoute.name, path: '/third-page');

  static const String name = 'ThirdRoute';
}
