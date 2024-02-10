import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecondDetailpage extends ConsumerWidget {
  const SecondDetailpage({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Detail Page"), backgroundColor: Theme.of(context).colorScheme.primaryContainer, centerTitle: true),
      body: Center(
        child: Text(
          "Path Parameter : $id",
          style: const TextStyle(fontSize: 23),
        ),
      ),
    );
  }
}
