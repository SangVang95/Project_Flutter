import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigator20/Sceens/cart.dart';
import 'package:navigator20/Sceens/checkout_page.dart';
import 'package:navigator20/Sceens/create_account.dart';
import 'package:navigator20/Sceens/detail.dart';
import 'package:navigator20/Sceens/list.dart';
import 'package:navigator20/Sceens/login.dart';
import 'package:navigator20/Sceens/settings.dart';
import 'package:navigator20/Sceens/splash.dart';
import 'package:navigator20/app_state.dart';
import 'package:navigator20/page_configuration.dart';
import 'package:navigator20/ui_pages.dart';

class ShoppingRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  final List<Page> _pages = [];
  final AppState appState;

  List<MaterialPage> get pages => List.unmodifiable(_pages);
  int numPages() => _pages.length;

  ShoppingRouterDelegate(this.appState) : navigatorKey = GlobalKey() {
    appState.addListener(() {
      notifyListeners();
    });
  }

  @override
  Widget build(BuildContext context) {
    throw Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: buildPages(),
    );
  }

  @override
  GlobalKey<NavigatorState> navigatorKey;

  @override
  PageConfiguration? get currentConfiguration =>
      _pages.last.arguments as PageConfiguration;

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) {
    throw UnimplementedError();
  }

  Future<bool> popRoute() {
    if (canPop()) {
      _removePage(_pages.last);
      return Future.value(true);
    }
    return Future.value(false);
  }

  MaterialPage _createPage(Widget child, PageConfiguration pageConfig) {
    return MaterialPage(
        child: child,
        key: ValueKey(pageConfig.key),
        name: pageConfig.path,
        arguments: pageConfig);
  }

  void _addPageData(Widget child, PageConfiguration pageConfig) {
    _pages.add(
      _createPage(child, pageConfig),
    );
  }

  void addPage(PageConfiguration pageConfiguration) {
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).uiPage !=
            pageConfiguration.uiPage;

    if (shouldAddPage) {
      switch (pageConfiguration.uiPage) {
        case Pages.Splash:
          _addPageData(SplashPage(), SplashPageConfig);
          break;
        case Pages.Login:
          _addPageData(LoginPage(), LoginPageConfig);
          break;
        case Pages.CreateAccount:
          _addPageData(CreateAccountPage(), CreateAccountPageConfig);
          break;
        case Pages.List:
          _addPageData(ListPage(), ListItemsPageConfig);
          break;
        case Pages.Cart:
          _addPageData(CartPage(), CartPageConfig);
          break;
        case Pages.Checkout:
          _addPageData(CheckoutPage(), CheckoutPageConfig);
          break;
        case Pages.Settings:
          _addPageData(SettingsPage(), SettingsPageConfig);
          break;
        case Pages.Details:
          _addPageData(DetailPage(), DetailsPageConfig);
          break;
        default:
          break;
      }
    }
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }

    if (canPop()) {
      pop();
      return true;
    } else {
      return false;
    }
  }

  void pop() {
    if (canPop()) {
      _removePage(_pages.last);
    }
  }

  bool canPop() {
    return _pages.length > 1;
  }

  void _removePage(Page page) {
    if (page != null) {
      _pages.remove(page);
    }
  }

  void replace(PageConfiguration newRoute) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    addPage(newRoute);
  }

  void setPath(List<MaterialPage> path) {
    _pages.clear();
    _pages.addAll(path);
  }

  void replaceAll(PageConfiguration newRoute) {
    setNewRoutePath(newRoute);
  }

  void push(PageConfiguration newRoute) {
    addPage(newRoute);
  }

  void pushWidget(Widget child, PageConfiguration newRoute) {
    _addPageData(child, newRoute);
  }

  void addAll(List<PageConfiguration> routes) {
    _pages.clear();
    routes.forEach((route) {
      addPage(route);
    });
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) async {
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).uiPage !=
            configuration.uiPage;
    if (shouldAddPage) {
      _pages.clear();
      addPage(configuration);
    }
    return SynchronousFuture(null);
  }
}
