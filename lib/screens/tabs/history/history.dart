import 'package:dummy_example/components/history_card.dart';
import 'package:dummy_example/providers/history/dummy_history_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HistoryTab extends HookConsumerWidget {
  const HistoryTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return HistoryCard(
            dummyClass: ref.watch(historyProvider)[index],
            description: ref.watch(historyProvider)[index].toString(),
          );
        },
        itemCount: ref.watch(historyProvider).length,
      ),
    );
  }
}
