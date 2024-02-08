import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../router/router_provider.dart';

class SecondPage extends ConsumerStatefulWidget {
  const SecondPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SecondPageState();
}

class _SecondPageState extends ConsumerState<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body: Center(
            child: Column(
          children: [
            const Text("Second Page"),
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).goNamed(Routes.secondDetailPage.name,
                      pathParameters: {"id": "1"});
                },
                child: const Text("Second Detail Page")),
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('/nowhere');
                },
                child: const Text("Nowhere"))
          ],
        )));
  }
}
