import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../router/router_provider.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                ref.read(authStateProvider.notifier).setAuthState(true);
              },
              child: const Text("Sign In")),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                context.goNamed(Routes.signup.name);
              },
              child: const Text("Not a Member? Sign Up")),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                context.goNamed(Routes.firstPage.name);
              },
              child: const Text("First"))
        ]),
      ),
    );
  }
}

class AuthStateNotifier extends Notifier<bool> {
  @override
  build() {
    return false;
  }

  void setAuthState(bool value) {
    state = value;
  }
}

final authStateProvider = NotifierProvider<AuthStateNotifier, bool>(AuthStateNotifier.new);
