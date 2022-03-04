import 'package:auto_route/auto_route.dart';
import 'package:navigator20/screens/book_detail/book_detail_page.dart';
import 'package:navigator20/screens/buy_book/buy_book.dart';
import 'package:navigator20/screens/home/home_page.dart';
import 'package:navigator20/screens/library/library_page.dart';
import 'package:navigator20/screens/login/login_page.dart';
import 'package:navigator20/screens/profile/profile_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      name: 'LoginRouter',
      page: LoginPage,
    ),
    AutoRoute(
      path: '/home',
      name: 'HomeRouter',
      page: HomePage,
      children: [
        AutoRoute(
          path: 'profile',
          name: 'ProfileRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: ProfilePage,
            ),
          ],
        ),
        AutoRoute(
          path: 'library',
          name: 'LibraryRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: LibraryPage),
            AutoRoute(path: ':id', page: BookDetailPage),
          ],
        ),
      ],
    ),
    AutoRoute(path: '/buyBook', page: BuyBookPage),
  ],
)
class $AppRouter {}
