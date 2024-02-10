import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThirdDetailPage extends ConsumerWidget {
  const ThirdDetailPage({super.key, required this.id, required this.firstName, required this.lastName});
  final String id;
  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Detail Page"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text("PathParameter : $id"),
            Text("QueryParameter First Name : $firstName"),
            Text("QueryParameter Last Name : $lastName"),
          ],
        ),
      ),
    );
  }
}
