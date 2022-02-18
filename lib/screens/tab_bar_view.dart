import 'package:dummy_example/providers/tab_controller_provider.dart';
import 'package:dummy_example/screens/tabs/dummy_calculator/dummy_calculator.dart';
import 'package:dummy_example/screens/tabs/history/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TabPage extends HookConsumerWidget {
  const TabPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _tabController = useTabController(initialLength: 2);
    ref.watch(tabControllerProvider.notifier).initialize(_tabController);
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Text('Dummy'),
            Text('History'),
          ],
          isScrollable: true,
        ),
        title: SizedBox(
          width: double.infinity,
          child: FittedBox(
            child: Text(
              "Dummy Calculator",
              style: TextStyle(
                fontSize: 25,
                fontWeight:
                    MediaQuery.of(context).boldText ? FontWeight.bold : null,
              ),
            ),
          ),
        ),
      ),
      body: Builder(
        builder: (context) {
          return TabBarView(
            controller: _tabController,
            children: const [
              DummyTab(),
              HistoryTab(),
            ],
          );
        },
      ),
    );
  }
}
