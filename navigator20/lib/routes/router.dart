import 'package:auto_route/annotations.dart';
import 'package:navigator20/main.dart';
import 'package:navigator20/screens/second_page.dart';
import 'package:navigator20/screens/third_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MyHomePage, initial: true),
    AutoRoute(page: SecondPage),
    AutoRoute(page: ThirdPage),
  ],
)
class $AppRouter {}
