import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../pages/first_detail_page.dart';
import '../pages/page_not_found_page.dart';
import '../pages/scaffold_with_navebar.dart';
import '../pages/second_detail_page.dart';
import '../pages/second_page.dart';
import '../pages/signin_page.dart';
import '../pages/signup_page.dart';
import '../pages/third_page.dart';

import '../pages/first_page.dart';
import '../pages/third_detail_page.dart';

enum Routes {
  signin,
  signup,
  firstPage,
  firstDetailPage,
  secondPage,
  secondDetailPage,
  thirdPage,
  thirdDetailPage
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/first',
    redirect: (context, state) {
      final authenicated = authState;
      final trySignin = state.matchedLocation == '/signin';
      final trySignup = state.matchedLocation == '/signup';
      final authenticating = trySignin || trySignup;
      if (!authenicated) return authenticating ? null : '/signin';
      if (authenticating) return '/first';
      return null;
    },
    routes: [
      GoRoute(
          path: '/signin',
          name: Routes.signin.name,
          builder: (context, state) => const SignInPage()),
      GoRoute(
          path: '/signup',
          name: Routes.signup.name,
          builder: (context, state) => const SignupPage()),
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              ScaffoldWithNavBar(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                  path: "/first",
                  name: Routes.firstPage.name,
                  builder: (context, state) => const FirstPage(),
                  routes: [
                    GoRoute(
                      path: 'details',
                      name: Routes.firstDetailPage.name,
                      builder: (context, state) {
                        return const FirstDetailPage();
                      },
                    )
                  ]),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                  path: "/second",
                  name: Routes.secondPage.name,
                  builder: (context, state) => const SecondPage(),
                  routes: [
                    GoRoute(
                      path: 'details/:id',
                      name: Routes.secondDetailPage.name,
                      builder: (context, state) {
                        final id = state.pathParameters['id']!;
                        return SecondDetailpage(id: id);
                      },
                    )
                  ])
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                  path: "/third",
                  name: Routes.thirdPage.name,
                  builder: (context, state) => const ThirdPage(),
                  routes: [
                    GoRoute(
                      path: 'details/:id',
                      name: Routes.thirdDetailPage.name,
                      builder: (context, state) {
                        final id = state.pathParameters['id']!;
                        final firstName =
                            state.uri.queryParameters['firstName']!;
                        final lastName = state.uri.queryParameters['lastName']!;
                        return ThirdDetailPage(
                            id: id, firstName: firstName, lastName: lastName);
                      },
                    )
                  ])
            ])
          ]),
    ],
    errorBuilder: (context, state) =>
        PageNotFound(error: state.error.toString()),
  );
});
