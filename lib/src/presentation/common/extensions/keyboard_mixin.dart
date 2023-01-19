import 'package:flutter/material.dart';

mixin KeyboardMixin {
  void hideKeyboard(BuildContext context) {
    final currectFocus = FocusScope.of(context);
    if (!currectFocus.hasPrimaryFocus) currectFocus.unfocus();
  }
}
