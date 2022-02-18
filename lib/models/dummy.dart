class DummyClass {
  final double inputOne;
  final double inputTwo;
  final double result;

  const DummyClass({
    required this.inputOne,
    required this.inputTwo,
    required this.result,
  });

  factory DummyClass.fromInputs({
    required double inputOne,
    required double inputTwo,
  }) {
    final result = inputOne * inputTwo;
    return DummyClass(
      inputOne: inputOne,
      inputTwo: inputTwo,
      result: result,
    );
  }

  @override
  String toString() {
    return 'Input One: $inputOne, Input Two: $inputTwo, Result: $result';
  }
}
