import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_with_flutter_riverpod/router/router_provider.dart';

class PageNotFound extends ConsumerWidget {
  const PageNotFound({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Page Not Found'),
        ),
        body: Center(
          child: Column(
            children: [
              const Text("Page Not Found"),
              Text(error),
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
