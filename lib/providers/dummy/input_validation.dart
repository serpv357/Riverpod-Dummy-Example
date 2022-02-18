String? inputOneValidator(String? value) {
  if (value == '' || value == null) {
    return 'Please provide a value.';
  }
  if (double.tryParse(value) == null) {
    return 'Please enter an integer.';
  }
  return null;
}

String? inputTwoValidator(String? value) {
  if (value == '' || value == null) {
    return 'Please provide a value.';
  }
  if (double.tryParse(value) == null) {
    return 'Please enter a valid number.';
  }
  return null;
}
