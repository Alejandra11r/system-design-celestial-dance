import 'package:flutter/material.dart';

class ToggleValueModel extends ValueNotifier<bool> {
  ToggleValueModel(super.value);

  void toggleValue() {
    value = !value;
  }
}
