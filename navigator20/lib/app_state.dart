import 'package:flutter/material.dart';
import 'package:navigator20/page_configuration.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PageState { none, addPage, addAll, addWidget, pop, replace, replaceAll }

class AppState extends ChangeNotifier {
  bool isLogin = false;
  bool splashFinished = false;
  final cartItems = [];

  PageAction currentAction = PageAction();

  AppState() {
    getLoginState();
  }

  setCurrentAction(PageAction pageAction) {
    currentAction = pageAction;
    notifyListeners();
  }

  resetCurrentAction() {
    currentAction = PageAction();
  }

  void setSplashFinished() {
    splashFinished = true;
    if (isLogin) {
      currentAction =
          PageAction(state: PageState.replaceAll, page: ListItemsPageConfig);
    } else {
      currentAction =
          PageAction(state: PageState.replaceAll, page: LoginPageConfig);
    }
    notifyListeners();
  }

  void getLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    isLogin = prefs.getBool('login')!;
  }

  void login() {
    isLogin = true;
    saveLoginState(isLogin);
    currentAction =
        PageAction(state: PageState.replaceAll, page: ListItemsPageConfig);
    notifyListeners();
  }

  void saveLoginState(bool loggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('login', loggedIn);
  }

  void addToCart(String item) {
    cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(String item) {
    cartItems.add(item);
    notifyListeners();
  }

  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }
}
