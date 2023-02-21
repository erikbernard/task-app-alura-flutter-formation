import 'package:flutter/material.dart';
import 'package:study_flutter_concepts/data/task_inherited.dart';
import 'package:study_flutter_concepts/screen/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacity = true;
  int level = 0;

  void updateLevel() {
    level = TaskInherited.of(context)!
        .taskList
        .map((task) => task.difficulty * task.maestria)
        .reduce((a, b) => a + b);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 80,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Tarefas'),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          updateLevel();
                        });
                      },
                      icon: const Icon(Icons.refresh))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                          color: Colors.white, value: 1)),
                  Text('Level: $level')
                ],
              )
            ],
          )),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        children: TaskInherited.of(context)!.taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          );
          // setState(() {
          //   opacity = !opacity;
          // });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
