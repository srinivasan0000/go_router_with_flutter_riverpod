import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../router/router_provider.dart';
import 'signin_page.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: Column(children: [
          ElevatedButton(
              onPressed: () {
                ref.read(authStateProvider.notifier).setAuthState(true);
              },
              child: const Text("Sign In")),
          ElevatedButton(
              onPressed: () {
                context.goNamed(Routes.signin.name);
              },
              child: const Text("Already a Member? Sign In")),
          ElevatedButton(
              onPressed: () {
                context.goNamed(Routes.secondPage.name);
              },
              child: const Text("Second")),
          ElevatedButton(
              onPressed: () {
                context.goNamed("/nowhere");
              },
              child: const Text("No Where"))
        ]),
      ),
    );
  }
}
