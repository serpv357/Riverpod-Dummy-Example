import 'package:dummy_example/helpers/parsers.dart';
import 'package:dummy_example/models/dummy.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../history/dummy_history_provider.dart';
import './input_validation.dart' as input;

class DummyCoVal {
  const DummyCoVal({
    required this.inputOneController,
    required this.inputOneValidator,
    required this.inputTwoController,
    required this.inputTwoValidator,
    required this.resultController,
    required this.formKey,
  });

  final TextEditingController inputOneController;
  final String? Function(String?) inputOneValidator;
  final TextEditingController inputTwoController;
  final String? Function(String?) inputTwoValidator;
  final TextEditingController resultController;
  final GlobalKey<FormState> formKey;
}

class DummyNotifier extends StateNotifier<DummyCoVal> {
  DummyNotifier({
    required this.addToHistory,
  }) : super(
          DummyCoVal(
            inputOneController: TextEditingController(),
            inputOneValidator: input.inputOneValidator,
            inputTwoController: TextEditingController(),
            inputTwoValidator: input.inputTwoValidator,
            resultController: TextEditingController(),
            formKey: GlobalKey<FormState>(),
          ),
        );

  final void Function(DummyClass) addToHistory;

  void clear() {
    state.formKey.currentState?.reset();
  }

  void onSubmit() {
    final isValid = state.formKey.currentState?.validate();
    if (isValid == null || !isValid) {
      return;
    }
    final double inputOne = parseDouble(state.inputOneController);
    final double inputTwo = parseDouble(state.inputTwoController);

    final DummyClass dummyClass = DummyClass.fromInputs(
      inputOne: inputOne,
      inputTwo: inputTwo,
    );

    state.resultController.text = dummyClass.result.toString();
    addToHistory(dummyClass);
  }

  void onSubmitFromExternal(DummyClass dummy) {
    state.inputOneController.text = dummy.inputOne.toString();
    state.inputTwoController.text = dummy.inputTwo.toString();

    final isValid = state.formKey.currentState?.validate();
    if (isValid == null || !isValid) {
      return;
    }
    final double inputOne = dummy.inputOne;
    final double inputTwo = dummy.inputTwo;

    final DummyClass dummyClass = DummyClass.fromInputs(
      inputOne: inputOne,
      inputTwo: inputTwo,
    );

    state.resultController.text = dummyClass.result.toString();
  }
}

final dummyProvider = StateNotifierProvider<DummyNotifier, DummyCoVal>((ref) {
  final addToHistory = ref.watch(historyProvider.notifier).addToHistory;
  return DummyNotifier(
    addToHistory: addToHistory,
  );
});
