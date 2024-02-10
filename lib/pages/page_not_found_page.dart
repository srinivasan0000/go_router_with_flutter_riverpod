import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../router/router_provider.dart';

class PageNotFound extends ConsumerWidget {
  const PageNotFound({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.primaryContainer, title: const Text('Page Not Found')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Page Not Found", style: TextStyle(fontSize: 23)),
              Text(error, style: const TextStyle(color: Colors.red, fontSize: 17)),
              ElevatedButton(
                  onPressed: () {
                    context.goNamed(Routes.firstPage.name);
                  },
                  child: const Text("Back to first Page")),
            ],
          ),
        ));
  }
}
