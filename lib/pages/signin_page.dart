import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_with_flutter_riverpod/main.dart';
import '../router/router_provider.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          const Text("SignIn"),
          ElevatedButton(
              onPressed: () {
                ref.read(authStateProvider.notifier).setAuthState(true);
              },
              child: const Text("Sign In")),
          ElevatedButton(
              onPressed: () {
                context.goNamed(Routes.signup.name);
              },
              child: const Text("Not a Member? Sign Up")),
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
    return ref.read(sharedPreferencesProvider).getBool("authState") ?? false;
  }

  void setAuthState(bool value) async {
    await ref.read(sharedPreferencesProvider).setBool("authState", value);
    state = value;
  }
}

final authStateProvider =
    NotifierProvider<AuthStateNotifier, bool>(AuthStateNotifier.new);
