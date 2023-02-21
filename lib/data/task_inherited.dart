import 'package:flutter/cupertino.dart';
import 'package:study_flutter_concepts/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required this.child}) : super(child: child);

  final Widget child;
  final List<Task> taskList = [
    Task('Aprender Flutter', 'assets/images/img_1.png', 4, 0),
    Task('Andar de Bike', 'assets/images/img_2.webp', 5, 0),
    Task('Meditar', 'assets/images/img_3.jpeg', 2, 0),
    Task('Ler', 'assets/images/img_4.jpg', 2, 0),
    Task('Jogar', 'assets/images/img_5.jpg', 3, 0)
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty, 0));
  }

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
