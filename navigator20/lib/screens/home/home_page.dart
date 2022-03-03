import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:navigator20/routes/route.gr.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        LibraryRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            const BottomNavigationBarItem(
              label: 'Library',
              icon: Icon(Icons.library_books),
            ),
            const BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person),
            ),
          ],
        );
      },
    );
  }
}
