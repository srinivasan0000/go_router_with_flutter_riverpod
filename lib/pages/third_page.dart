import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../router/router_provider.dart';
import 'signin_page.dart';

class ThirdPage extends ConsumerWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Third Page'),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).goNamed(Routes.thirdDetailPage.name, pathParameters: {"id": "1"}, queryParameters: {"firstName": "John", "lastName": "Doe"});
                },
                child: const Text("View Third Detail Page")),
            TextButton(
                onPressed: () {
                  context.goNamed(Routes.signin.name);
                },
                child: const Text("Sign In")),
            TextButton(
                onPressed: () {
                  ref.read(authStateProvider.notifier).setAuthState(false);
                },
                child: const Text("Sign Out"))
          ],
        )));
  }
}
