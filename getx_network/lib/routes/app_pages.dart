import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getx_network/modules/detail/detail_page.dart';
import 'package:getx_network/modules/user/user_binding.dart';
import 'package:getx_network/modules/user/user_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static final pages = [
    GetPage(
        name: AppRoutes.user_page,
        page: () => const UserPage(),
        binding: UserBinding()),
    GetPage(
      name: AppRoutes.detail_page,
      page: () => DetailPage(),
    )
  ];
}
