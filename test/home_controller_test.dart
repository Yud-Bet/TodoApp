import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/app/data/models/task.dart';
import 'package:todo_app/app/modules/home/home_controller.dart';

void main() {
  group('HomeController', () {
    test('Initializes with empty', () async {
      var controller = HomeController(useDB: false);
      expect(controller.tasks.length, 0);
    });

    test('Add a task', () {
      // Arrange
      var controller = HomeController(useDB: false);
      expect(controller.tasks.length, 0);

      // Act
      controller.textFieldController.text = 'testing';
      controller.addNewTask();

      // Assert
      expect(controller.tasks.length, 1);
    });

    test('Delete a task', () {
      // Arrange
      var controller = HomeController(useDB: false);
      controller.textFieldController.text = 'testing';
      controller.addNewTask();
      expect(controller.tasks.length, 1);

      // Act
      Task task = controller.tasks[0];
      controller.deleteTask(task);

      // Assert
      expect(controller.tasks.length, 0);
    });

    test('Change task status to finished', () {
      // Arrange
      var controller = HomeController(useDB: false);
      controller.textFieldController.text = 'testing';
      controller.addNewTask();
      expect(controller.tasks.length, 1);
      expect(controller.tasks[0].isFinished, false);

      // Act
      Task task = controller.tasks[0];
      controller.changeTaskStatus(task);

      // Assert
      expect(controller.tasks[0].isFinished, true);
    });

    test('Change task status to unfinished', () {
      // Arrange
      var controller = HomeController(useDB: false);
      controller.textFieldController.text = 'testing';
      controller.addNewTask();
      expect(controller.tasks.length, 1);
      Task task = controller.tasks[0];
      controller.changeTaskStatus(task);
      expect(controller.tasks[0].isFinished, true);

      // Act
      controller.changeTaskStatus(task);

      // Assert
      expect(controller.tasks[0].isFinished, false);
    });
  });
}
