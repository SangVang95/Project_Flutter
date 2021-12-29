// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../main.dart' as _i1;
import '../screens/dashboard_page.dart' as _i4;
import '../screens/post_page.dart' as _i7;
import '../screens/second_page.dart' as _i2;
import '../screens/settings_page.dart' as _i8;
import '../screens/third_page.dart' as _i3;
import '../screens/user_detail_page.dart' as _i5;
import '../screens/user_page.dart' as _i6;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    MyHomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.MyHomePage());
    },
    SecondRoute.name: (routeData) {
      final args = routeData.argsAs<SecondRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.SecondPage(key: args.key, name: args.name));
    },
    ThirdRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.ThirdPage());
    },
    DashboardRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.DashboardPage());
    },
    UserDetailRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.UserDetailPage());
    },
    UserRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.UserPage());
    },
    PostRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.PostPage());
    },
    SettingsRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.SettingsPage());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(MyHomeRoute.name, path: '/'),
        _i9.RouteConfig(SecondRoute.name, path: '/second-page'),
        _i9.RouteConfig(ThirdRoute.name, path: '/third-page'),
        _i9.RouteConfig(DashboardRoute.name,
            path: '/dashboard-page',
            children: [
              _i9.RouteConfig(UserRoute.name,
                  path: 'user-page', parent: DashboardRoute.name),
              _i9.RouteConfig(PostRoute.name,
                  path: 'post-page', parent: DashboardRoute.name),
              _i9.RouteConfig(SettingsRoute.name,
                  path: 'settings-page', parent: DashboardRoute.name)
            ]),
        _i9.RouteConfig(UserDetailRoute.name, path: '/user-detail-page')
      ];
}

/// generated route for
/// [_i1.MyHomePage]
class MyHomeRoute extends _i9.PageRouteInfo<void> {
  const MyHomeRoute() : super(MyHomeRoute.name, path: '/');

  static const String name = 'MyHomeRoute';
}

/// generated route for
/// [_i2.SecondPage]
class SecondRoute extends _i9.PageRouteInfo<SecondRouteArgs> {
  SecondRoute({_i10.Key? key, required String name})
      : super(SecondRoute.name,
            path: '/second-page', args: SecondRouteArgs(key: key, name: name));

  static const String name = 'SecondRoute';
}

class SecondRouteArgs {
  const SecondRouteArgs({this.key, required this.name});

  final _i10.Key? key;

  final String name;

  @override
  String toString() {
    return 'SecondRouteArgs{key: $key, name: $name}';
  }
}

/// generated route for
/// [_i3.ThirdPage]
class ThirdRoute extends _i9.PageRouteInfo<void> {
  const ThirdRoute() : super(ThirdRoute.name, path: '/third-page');

  static const String name = 'ThirdRoute';
}

/// generated route for
/// [_i4.DashboardPage]
class DashboardRoute extends _i9.PageRouteInfo<void> {
  const DashboardRoute({List<_i9.PageRouteInfo>? children})
      : super(DashboardRoute.name,
            path: '/dashboard-page', initialChildren: children);

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i5.UserDetailPage]
class UserDetailRoute extends _i9.PageRouteInfo<void> {
  const UserDetailRoute()
      : super(UserDetailRoute.name, path: '/user-detail-page');

  static const String name = 'UserDetailRoute';
}

/// generated route for
/// [_i6.UserPage]
class UserRoute extends _i9.PageRouteInfo<void> {
  const UserRoute() : super(UserRoute.name, path: 'user-page');

  static const String name = 'UserRoute';
}

/// generated route for
/// [_i7.PostPage]
class PostRoute extends _i9.PageRouteInfo<void> {
  const PostRoute() : super(PostRoute.name, path: 'post-page');

  static const String name = 'PostRoute';
}

/// generated route for
/// [_i8.SettingsPage]
class SettingsRoute extends _i9.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings-page');

  static const String name = 'SettingsRoute';
}
