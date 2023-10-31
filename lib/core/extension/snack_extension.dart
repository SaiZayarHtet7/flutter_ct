import 'package:flutter/material.dart';


enum SnackBarTypes {
  success,
  info,
  error,
}

extension SnackExtension on BuildContext {
  void showSnack({
    required SnackBarTypes snackBarType,
    SnackBarBehavior snackBarBehavior = SnackBarBehavior.fixed,
    double? borderRadius,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    required Widget content,
    Duration duration = const Duration(milliseconds: 1800),
    Color? backgroundColor,
  }) {
    SnackBarTypes type = snackBarType;

    /// SnackBar Types
    const infoType = SnackBarTypes.info;
    const successType = SnackBarTypes.success;

    if (mounted) {
      ScaffoldMessenger.of(this)
        ..hideCurrentSnackBar(reason: SnackBarClosedReason.remove)
        ..showSnackBar(
          SnackBar(
            backgroundColor: type == infoType
                ? backgroundColor ?? Colors.grey
                : type == successType
                    ? backgroundColor ?? Colors.green
                    : backgroundColor ?? Colors.red,
            content: content,
            behavior: snackBarBehavior,
            margin: margin,
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 4.0),
            ),
          ),
        );
    }
  }
}
