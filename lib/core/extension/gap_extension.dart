import 'package:flutter/material.dart';

extension GapExtension on int {
  Widget gap() {
    return SizedBox(
      width: toDouble(),
      height: toDouble(),
    );
  }

  Widget gapW() {
    return SizedBox(
      width: toDouble(),
    );
  }

  Widget gapH() {
    return SizedBox(
      height: toDouble(),
    );
  }
}
