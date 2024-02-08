import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstDetailPage extends ConsumerStatefulWidget {
  const FirstDetailPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FirstDetailPageState();
}

class _FirstDetailPageState extends ConsumerState<FirstDetailPage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('First Detail Page'),
        ),
        body: Center(
            child: Column(
          children: [
            const Text("First Detail Page"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: const Text("Increment"),
            ),
            Text("Counter: $counter"),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter = 0;
                  });
                },
                child: const Text("Incremenet"))
          ],
        )));
  }
}
