import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../router/router_provider.dart';

class FirstPage extends ConsumerWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
          child: Column(
        children: [
          const Text("First Page"),
          ElevatedButton(
              onPressed: () {
                GoRouter.of(context).goNamed(Routes.firstDetailPage.name);
              },
              child: const Text("First Detail"))
        ],
      )),
    );
  }
}
