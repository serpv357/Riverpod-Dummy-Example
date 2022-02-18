import 'package:dummy_example/providers/dummy/dummy_example_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DummyTab extends HookConsumerWidget {
  const DummyTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _dummyState = ref.watch(dummyProvider);

    final _inputOneController = _dummyState.inputOneController;
    final _inputTwoController = _dummyState.inputTwoController;
    final _resultController = _dummyState.resultController;

    final _inputOneValidator = _dummyState.inputOneValidator;
    final _inputTwoValidator = _dummyState.inputTwoValidator;

    return Form(
      key: _dummyState.formKey,
      child: SizedBox(
        width: 300,
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                const Text('Input One: '),
                Expanded(
                  child: TextFormField(
                    controller: _inputOneController,
                    validator: _inputOneValidator,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Input Two: '),
                Expanded(
                  child: TextFormField(
                    controller: _inputTwoController,
                    validator: _inputTwoValidator,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: ref.watch(dummyProvider.notifier).clear,
                  child: const Text('Clear'),
                ),
                ElevatedButton(
                  onPressed: ref.watch(dummyProvider.notifier).onSubmit,
                  child: const Text('Submit'),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Result: '),
                Expanded(
                  child: TextFormField(
                    controller: _resultController,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
