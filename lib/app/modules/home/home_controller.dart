import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/models/task.dart';
import 'package:todo_app/app/data/providers/task_provider.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt tabIndex = 0.obs;
  final pageController = PageController();
  final pageNames = ['All task', 'Ongoing taks', 'Finished tasks'];
  var pageName = 'All tasks'.obs;
  bool useDB;

  RxList<Task> tasks = RxList<Task>();

  var textFieldController = TextEditingController();
  RxBool validation = true.obs;

  HomeController({this.useDB = true});

  @override
  void onInit() async {
    isLoading.value = true;
    super.onInit();
    if (useDB) tasks.value = await TaskProvider.getTasks();
    isLoading.value = false;
  }

  void moveToPage(int _pageIndex) {
    pageController.animateToPage(
      _pageIndex,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
    pageName.value = pageNames[_pageIndex];
  }

  Future<bool> addNewTask() async {
    if (validate()) {
      var task = Task(content: textFieldController.text);
      tasks.add(task);
      if (useDB) await TaskProvider.add(task);
      textFieldController.text = '';

      validation.value = true;
      return true;
    } else {
      validation.value = false;
      return false;
    }
  }

  void deleteTask(Task task) async {
    tasks.remove(task);
    if (useDB) await TaskProvider.delete(task);
  }

  void changeTaskStatus(Task task) async {
    var index = tasks.indexOf(task);
    tasks[index].isFinished = !task.isFinished;
    if (useDB) await TaskProvider.updateStatus(task);
    tasks.refresh();
  }

  void onPageChange(int value) {
    tabIndex.value = value;
  }

  bool validate() => textFieldController.text.isNotEmpty;
}
