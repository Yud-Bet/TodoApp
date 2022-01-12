import 'package:flutter/material.dart';
import 'package:todo_app/app/data/models/task.dart';
import 'package:todo_app/app/modules/home/widgets/TodoItem.dart';

class TabView extends StatelessWidget {
  const TabView({Key? key, required this.title, required this.tasks, this.delete, this.changeStatus}) : super(key: key);
  final String title;
  final List<Task> tasks;
  final Function(Task)? delete;
  final Function(Task)? changeStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => TodoItem(
          task: tasks[index],
          delete: () => delete?.call(tasks[index]),
          changeStatus: () => changeStatus?.call(tasks[index]),
        ),
      ),
    );
  }
}
