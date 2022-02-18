import 'package:dummy_example/models/dummy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DummyHistoryNotifier extends StateNotifier<List<DummyClass>> {
  DummyHistoryNotifier() : super([]); // initialized as empty array

  void addToHistory(DummyClass dummy) {
    state = [...state, dummy];
  }
}

final historyProvider =
    StateNotifierProvider<DummyHistoryNotifier, List<DummyClass>>(
  (ref) => DummyHistoryNotifier(),
);
