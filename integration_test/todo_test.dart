import 'package:flutter/material.dart';
import 'package:flutter_ct/core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {});
  Future<void> updateUI(WidgetTester tester) async {
    await tester.pump(const Duration(seconds: 1));
  }

  testWidgets("1:todo list in first initial with the create todo btn",
      (tester) async {
    await tester.pumpRealRouterApp((child) => child, isStart: true);
    await tester.pumpAndSettle(const Duration(seconds: 3));

    await updateUI(tester);

    // var noDataWidget = find.byKey(const Key("no_data_widget"));
    // expect(noDataWidget, findsOneWidget);
    // await updateUI(tester);

    /// checking the create_todo_btn
    var createTodoBtn = find.byKey(const Key("create_icon"));
    expect(createTodoBtn, findsOneWidget);

    await updateUI(tester);
  });

  testWidgets("2:inserting first data with todo - `first`", (tester) async {
    await tester.pumpRealRouterApp(
      (child) => child,
    );
    await tester.pumpAndSettle(const Duration(seconds: 3));

    await updateUI(tester);

    var createTodoBtn = find.byKey(const Key("create_icon"));
    expect(createTodoBtn, findsOneWidget, reason: "not found create icon");
    await tester.tap(createTodoBtn);
    await updateUI(tester);

    /// entering todo
    var titleTextField = find.byKey(const Key("title_text_field"));
    expect(titleTextField, findsOneWidget);
    await tester.enterText(titleTextField, "first");
    await updateUI(tester);

    /// pressing edit btn(it is also insert btn)
    var editBtn = find.byKey(const Key("edit_btn"));
    expect(editBtn, findsOneWidget);
    await tester.tap(editBtn);
    await updateUI(tester);

    //finding the inserted data by first index
    var firstTodoItem = find.byKey(const ValueKey("todo_data_0"));
    expect(firstTodoItem, findsOneWidget,
        reason: "data not found of todo_data_0 ");
    await tester.tap(firstTodoItem);
    await updateUI(tester);

    expect(titleTextField, findsOneWidget);
    await tester.enterText(titleTextField, "first_modify");
    await updateUI(tester);

    expect(editBtn, findsOneWidget);
    await tester.tap(editBtn);

    await updateUI(tester);
  });


  testWidgets("3: Deleting todo", (tester) async {
    await tester.pumpRealRouterApp(
      (child) => child,
    );
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // deleting the todo
    var deletTodoBtn = find.byKey(const ValueKey("delete_todo_0"));
    expect(deletTodoBtn, findsOneWidget);
    await tester.tap(deletTodoBtn);
    await updateUI(tester);

    var firstModifyItem = find.byKey(const ValueKey("todo_data_widget"));

    expect(firstModifyItem, findsNothing);
  });
}
