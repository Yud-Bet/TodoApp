import 'package:flutter/material.dart';
import 'package:todo_app/app/data/models/task.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({Key? key, required this.task, this.delete, this.changeStatus}) : super(key: key);
  final Task task;
  final Function()? delete;
  final Function()? changeStatus;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Text(task.content, style: Theme.of(context).textTheme.bodyText1),
                )),
                IconButton(
                  key: const Key('deleteButton'),
                  icon: const Icon(Icons.delete),
                  splashRadius: 20,
                  onPressed: delete,
                )
              ],
            ),
            OutlinedButton(onPressed: changeStatus, child: Text(buttonText))
          ],
        ),
      ),
    );
  }

  String get buttonText => task.isFinished ? 'Mark as unfinished' : 'Mark as finished';
}
