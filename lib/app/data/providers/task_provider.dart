import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/app/data/models/task.dart';

class TaskProvider {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  static Future initDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), 'todo_app_db.db'), onCreate: (db, version) async {
      await db.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, content TEXT, isFinished BIT)');
    }, version: 1);
  }

  static Future<int> add(Task task) async {
    final db = await database;
    return await db.insert('tasks', task.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Task>> getTasks() async {
    final db = await database;
    var res = await db.query('tasks');
    var tasks = <Task>[];
    for (var raw in res) {
      var task = Task.fromMap(raw);
      tasks.add(task);
    }
    return tasks;
  }

  static Future<int> delete(Task task) async {
    final db = await database;
    return await db.delete('tasks', where: 'content = ?', whereArgs: [task.content]);
  }

  static Future<int> updateStatus(Task task) async {
    final db = await database;
    return await db.update('tasks', task.toMap(), where: 'content = ?', whereArgs: [task.content]);
  }
}
