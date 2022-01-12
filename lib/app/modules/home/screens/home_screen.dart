import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/modules/home/home_controller.dart';
import 'package:todo_app/app/modules/home/widgets/TabView.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : PageView(
              controller: controller.pageController,
              onPageChanged: controller.onPageChange,
              children: [
                TabView(
                  title: 'All tasks',
                  tasks: controller.tasks,
                  delete: controller.deleteTask,
                  changeStatus: controller.changeTaskStatus,
                ),
                TabView(
                  title: 'Ongoing tasks',
                  tasks: controller.tasks.where((element) => !element.isFinished).toList(),
                  delete: controller.deleteTask,
                  changeStatus: controller.changeTaskStatus,
                ),
                TabView(
                  title: 'Finished tasks',
                  tasks: controller.tasks.where((element) => element.isFinished).toList(),
                  delete: controller.deleteTask,
                  changeStatus: controller.changeTaskStatus,
                )
              ],
            )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.tabIndex.value,
            onTap: (i) {
              controller.tabIndex.value = i;
              controller.moveToPage(i);
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Icon(FontAwesomeIcons.listAlt, size: 20),
                  ),
                  label: 'All'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Icon(Icons.list, size: 20),
                  ),
                  label: 'Ongoing'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Icon(Icons.checklist, size: 20),
                  ),
                  label: 'Finished'),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        key: const Key('addButton'),
        onPressed: () => {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(
                      'Task',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    content: TextField(
                      key: const Key('taskInputField'),
                      autofocus: true,
                      controller: controller.textFieldController,
                      decoration: const InputDecoration(hintText: 'eg. Do homeworks'),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    actions: [TextButton(onPressed: () => Get.back(), child: const Text('CANCEL')), TextButton(key: const Key('submitButton'), onPressed: controller.addNewTask, child: const Text('SUBMIT'))],
                  )),
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
