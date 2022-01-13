// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:todo_app/app/core/theme/app_theme.dart';
import 'package:todo_app/app/routes/pages.dart';

void main() {
  testWidgets('Add new task', (WidgetTester tester) async {
    final addButton = find.byKey(const ValueKey('addButton'));
    final taskInputField = find.byKey(const ValueKey('taskInputField'));
    final submitButton = find.byKey(const ValueKey('submitButton'));

    String taskStr = 'this is widget test';
    expect(find.text(taskStr), findsNothing);

    await tester.pumpWidget(GetMaterialApp(
      title: 'Todo',
      theme: AppTheme.lightTheme,
      initialRoute: Routes.home,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      defaultTransition: Transition.cupertino,
    ));
    await tester.tap(addButton);
    await tester.pump();
    await tester.enterText(taskInputField, taskStr);
    await tester.tap(submitButton);
    await tester.pump();

    expect(find.text(taskStr), findsOneWidget);
  });
}
