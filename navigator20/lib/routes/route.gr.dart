// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i8;

import '../screens/book_detail/book_detail_page.dart' as _i7;
import '../screens/buy_book/buy_book.dart' as _i3;
import '../screens/home/home_page.dart' as _i2;
import '../screens/library/library_page.dart' as _i6;
import '../screens/login/login_page.dart' as _i1;
import '../screens/profile/profile_page.dart' as _i5;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LoginRouter.name: (routeData) {
      final args = routeData.argsAs<LoginRouterArgs>(
          orElse: () => const LoginRouterArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.LoginPage(key: args.key));
    },
    HomeRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    },
    BuyBookRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.BuyBookPage());
    },
    ProfileRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    LibraryRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    ProfileRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ProfilePage());
    },
    LibraryRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.LibraryPage());
    },
    BookDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<BookDetailRouteArgs>(
          orElse: () => BookDetailRouteArgs(id: pathParams.get('id')));
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.BookDetailPage(key: args.key, id: args.id));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(LoginRouter.name, path: '/'),
        _i4.RouteConfig(HomeRouter.name, path: '/home', children: [
          _i4.RouteConfig(ProfileRouter.name,
              path: 'profile',
              parent: HomeRouter.name,
              children: [
                _i4.RouteConfig(ProfileRoute.name,
                    path: '', parent: ProfileRouter.name)
              ]),
          _i4.RouteConfig(LibraryRouter.name,
              path: 'library',
              parent: HomeRouter.name,
              children: [
                _i4.RouteConfig(LibraryRoute.name,
                    path: '', parent: LibraryRouter.name),
                _i4.RouteConfig(BookDetailRoute.name,
                    path: ':id', parent: LibraryRouter.name)
              ])
        ]),
        _i4.RouteConfig(BuyBookRoute.name, path: '/buyBook')
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRouter extends _i4.PageRouteInfo<LoginRouterArgs> {
  LoginRouter({_i8.Key? key})
      : super(LoginRouter.name, path: '/', args: LoginRouterArgs(key: key));

  static const String name = 'LoginRouter';
}

class LoginRouterArgs {
  const LoginRouterArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'LoginRouterArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRouter extends _i4.PageRouteInfo<void> {
  const HomeRouter({List<_i4.PageRouteInfo>? children})
      : super(HomeRouter.name, path: '/home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i3.BuyBookPage]
class BuyBookRoute extends _i4.PageRouteInfo<void> {
  const BuyBookRoute() : super(BuyBookRoute.name, path: '/buyBook');

  static const String name = 'BuyBookRoute';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class ProfileRouter extends _i4.PageRouteInfo<void> {
  const ProfileRouter({List<_i4.PageRouteInfo>? children})
      : super(ProfileRouter.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class LibraryRouter extends _i4.PageRouteInfo<void> {
  const LibraryRouter({List<_i4.PageRouteInfo>? children})
      : super(LibraryRouter.name, path: 'library', initialChildren: children);

  static const String name = 'LibraryRouter';
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i4.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i6.LibraryPage]
class LibraryRoute extends _i4.PageRouteInfo<void> {
  const LibraryRoute() : super(LibraryRoute.name, path: '');

  static const String name = 'LibraryRoute';
}

/// generated route for
/// [_i7.BookDetailPage]
class BookDetailRoute extends _i4.PageRouteInfo<BookDetailRouteArgs> {
  BookDetailRoute({_i8.Key? key, dynamic id})
      : super(BookDetailRoute.name,
            path: ':id',
            args: BookDetailRouteArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'BookDetailRoute';
}

class BookDetailRouteArgs {
  const BookDetailRouteArgs({this.key, this.id});

  final _i8.Key? key;

  final dynamic id;

  @override
  String toString() {
    return 'BookDetailRouteArgs{key: $key, id: $id}';
  }
}
