import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Builds the "shell" for the app by building a Scaffold with a
/// BottomNavigationBar, where [child] is placed in the body of the Scaffold.
class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (value) {
            _onTap(context, value);
          },
          selectedIndex: navigationShell.currentIndex,
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.first_page),
              icon: Icon(Icons.first_page_outlined),
              label: 'First',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.pages),
              icon: Icon(Icons.pages_outlined),
              label: 'Second',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.last_page),
              icon: Icon(Icons.last_page_outlined),
              label: 'Third',
            ),
          ],
        ));
  }

  /// Navigate to the current location of the branch at the provided index when
  /// tapping an item in the BottomNavigationBar.
  void _onTap(BuildContext context, int index) {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
