// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../screens/home/home_page.dart' as _i2;
import '../screens/library/library_page.dart' as _i4;
import '../screens/login/login_page.dart' as _i1;
import '../screens/profile/profile_page.dart' as _i5;
import '../screens/user/user_page.dart' as _i3;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginPage());
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    },
    UserRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.UserPage());
    },
    LibraryRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.LibraryPage());
    },
    ProfileRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ProfilePage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(LoginRoute.name, path: '/'),
        _i6.RouteConfig(HomeRoute.name, path: '/home-page', children: [
          _i6.RouteConfig(LibraryRoute.name,
              path: 'library-page', parent: HomeRoute.name),
          _i6.RouteConfig(ProfileRoute.name,
              path: 'profile-page', parent: HomeRoute.name)
        ]),
        _i6.RouteConfig(UserRoute.name, path: '/user-page')
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home-page', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.UserPage]
class UserRoute extends _i6.PageRouteInfo<void> {
  const UserRoute() : super(UserRoute.name, path: '/user-page');

  static const String name = 'UserRoute';
}

/// generated route for
/// [_i4.LibraryPage]
class LibraryRoute extends _i6.PageRouteInfo<void> {
  const LibraryRoute() : super(LibraryRoute.name, path: 'library-page');

  static const String name = 'LibraryRoute';
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile-page');

  static const String name = 'ProfileRoute';
}
