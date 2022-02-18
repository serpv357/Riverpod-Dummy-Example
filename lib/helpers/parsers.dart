import 'package:flutter/material.dart';

int parseInt(TextEditingController controller) {
  return int.parse(controller.text);
}

double parseDouble(TextEditingController controller) {
  return double.parse(controller.text);
}
