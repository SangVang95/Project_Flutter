import 'package:auto_route/auto_route.dart';
import 'package:navigator20/screens/home/home_page.dart';
import 'package:navigator20/screens/library/library_page.dart';
import 'package:navigator20/screens/login/login_page.dart';
import 'package:navigator20/screens/profile/profile_page.dart';
import 'package:navigator20/screens/user/user_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginPage, initial: true),
    AutoRoute(
      page: HomePage,
      children: [
        AutoRoute(page: LibraryPage),
        AutoRoute(page: ProfilePage),
      ],
    ),
    AutoRoute(page: UserPage),
  ],
)
class $AppRouter {}
