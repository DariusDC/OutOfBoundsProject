import 'package:flutter/material.dart';
import 'package:out_of_bounds/model/task/subtask.dart';
import 'package:out_of_bounds/model/task/task.dart';
import 'package:out_of_bounds/model/task/task_type.dart';
import 'package:out_of_bounds/model/user.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_dimens.dart';
import 'package:out_of_bounds/widgets/app_bar/hello_app_bar.dart';

List<Task> _tasks = [
  Task(
    description: "task 1",
    subtasks: [
      Subtask(description: "t1 s1", done: false),
      Subtask(description: "t1 s2", done: true)
    ],
    name: "fa task1",
    taskType: TaskType.DONE,
  ),
  Task(
    description: "task 2",
    subtasks: [
      Subtask(description: "t2 s1", done: true),
      Subtask(description: "t2 s2", done: true)
    ],
    name: "fa task2",
    taskType: TaskType.IN_PROGRESS,
  ),
  Task(
    description: "task 3",
    subtasks: [
      Subtask(description: "t3 s1", done: false),
      Subtask(description: "t3 s2", done: false)
    ],
    name: "fa task3",
    taskType: TaskType.TODO,
  ),
];

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({Key? key}) : super(key: key);

  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HelloAppBar(user: User(firstName: "Marius", lastName: "Popa")),
              const SizedBox(height: AppDimens.largePadding),
              Text("")
            ],
          ),
        ),
      ),
    );
  }
}
