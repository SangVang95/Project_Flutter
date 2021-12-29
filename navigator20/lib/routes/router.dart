import 'package:auto_route/annotations.dart';
import 'package:navigator20/main.dart';
import 'package:navigator20/screens/dashboard_page.dart';
import 'package:navigator20/screens/post_page.dart';
import 'package:navigator20/screens/second_page.dart';
import 'package:navigator20/screens/settings_page.dart';
import 'package:navigator20/screens/third_page.dart';
import 'package:navigator20/screens/user_detail_page.dart';
import 'package:navigator20/screens/user_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MyHomePage, initial: true),
    AutoRoute(page: SecondPage),
    AutoRoute(page: ThirdPage),
    AutoRoute(
      page: DashboardPage,
      children: [
        AutoRoute(page: UserPage),
        AutoRoute(page: PostPage),
        AutoRoute(page: SettingsPage),
      ],
    ),
    AutoRoute(page: UserDetailPage),
  ],
)
class $AppRouter {}
