import 'package:dummy_example/models/dummy.dart';
import 'package:dummy_example/providers/dummy/dummy_example_provider.dart';
import 'package:dummy_example/providers/tab_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HistoryCard extends HookConsumerWidget {
  const HistoryCard({
    required this.dummyClass,
    required this.description,
    Key? key,
  }) : super(key: key);

  final DummyClass dummyClass;
  final String description;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      child: Card(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.grey.shade300,
          child: Text('CLICK ME!: ' + description),
        ),
      ),
      onTap: () {
        ref.read(tabControllerProvider)!.animateTo(0);
        ref.read(dummyProvider.notifier).onSubmitFromExternal(dummyClass);
      },
    );
  }
}
