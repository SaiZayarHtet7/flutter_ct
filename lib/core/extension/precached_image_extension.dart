import 'package:flutter/material.dart';

extension PrecachedImageExtension on BuildContext {
  void precachedAsset(String path) {
    precacheImage(AssetImage(path), this);
  }
}