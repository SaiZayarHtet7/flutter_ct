
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ct/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../core.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpRealRouterApp(
    Widget Function(Widget child) builder, {
    String? location,
    bool isStart = false,
  }) async {
   
    if(isStart){

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    configureDependencies();
    await Hive.initFlutter();
    registerAdapter();
    }

    /// end of main code snippets

    return pumpWidget(
      builder(const MyApp()),
    );
  }
}
