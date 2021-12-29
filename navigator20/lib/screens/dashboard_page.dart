import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:navigator20/routes/router.gr.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (context, tabsRouter) => AppBar(
        title: Text('dashboard'),
      ),
      routes: const [UserRoute(), PostRoute(), SettingsRoute()],
      bottomNavigationBuilder: (_, tapRouter) {
        return BottomNavigationBar(
          currentIndex: tapRouter.activeIndex,
          onTap: tapRouter.setActiveIndex,
          items: [
            const BottomNavigationBarItem(
                label: 'Users', icon: Icon(Icons.person)),
            const BottomNavigationBarItem(
                label: 'Posts', icon: Icon(Icons.post_add)),
            const BottomNavigationBarItem(
                label: 'Settings', icon: Icon(Icons.settings)),
          ],
        );
      },
    );
  }
}
