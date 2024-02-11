import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstDetailPage extends ConsumerStatefulWidget {
  const FirstDetailPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FirstDetailPageState();
}

class _FirstDetailPageState extends ConsumerState<FirstDetailPage> {




  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text('First Detail Page'),
      ),
      body: Center(
          child: Text(
        "Counter: $counter",
        style: const TextStyle(fontSize: 23),
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
              heroTag: 'reset',
              onPressed: () => setState(() {
                    counter = 0;
                  }),
              child: const Icon(Icons.refresh)),
          FloatingActionButton(
            heroTag: 'increment',
            child: const Icon(Icons.add),
            onPressed: () => setState(() {
              counter++;
            }),
          ),
        ],
      ),
    );
  }
}
