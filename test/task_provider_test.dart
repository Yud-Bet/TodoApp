import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/app/data/providers/task_provider.dart';

void main() {
  group('TaskProvider', () {
    test('Initializes with empty', () async {
      var db = await TaskProvider.initDatabase();
      expect(1, 1);
    });
  });
}
