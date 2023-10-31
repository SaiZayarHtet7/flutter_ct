import 'package:flutter/material.dart';
import 'package:flutter_ct/features/features.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class RouteClass {
  /// for production
  static GoRouter goRouter = GoRouter(
      initialLocation: Routes.home,
      debugLogDiagnostics: true,
      navigatorKey: rootNavigatorKey,
      routes: routeList);

  /// for integration test
  static GoRouter testingRouter({String? initial}) => GoRouter(
        initialLocation: initial ?? Routes.home,
        debugLogDiagnostics: true,
        navigatorKey: rootNavigatorKey,
        routes: routeList,
      );
  static List<RouteBase> routeList = [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const TodoPage(),
    ),
    GoRoute(
      path: Routes.editTodo,
      builder: (context, state) =>
          EditTodo(todoModel: state.extra as TodoModel),
    ),
    GoRoute(
      path: Routes.addTodo,
      builder: (context, state) =>
         const EditTodo(),
    ),
  ];
}

class Routes {
  static String home = "/";
  static String editTodo = "/edit_todo";
  static String addTodo = "/add_todo";
}
