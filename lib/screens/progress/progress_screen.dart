import 'package:flutter/material.dart';
import 'package:out_of_bounds/model/task/subtask.dart';
import 'package:out_of_bounds/model/task/task.dart';
import 'package:out_of_bounds/model/task/task_type.dart';
import 'package:out_of_bounds/model/user.dart';
import 'package:out_of_bounds/screens/base_request_screen.dart';
import 'package:out_of_bounds/screens/progress/progress_view_model.dart';
import 'package:out_of_bounds/screens/task_details/task_details_screen.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_dimens.dart';
import 'package:out_of_bounds/widgets/app_bar/hello_app_bar.dart';
import 'package:out_of_bounds/widgets/elements/dialog/bottom_modal_sheet.dart';
import 'package:out_of_bounds/widgets/filters/filters_tab.dart';
import 'package:out_of_bounds/widgets/task_progress_card.dart';
import 'package:out_of_bounds/widgets/tasks/task_list_item_widget.dart';
import 'package:rxdart/rxdart.dart';

List<Task> tasks = [
  Task(
    description:
        "task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 task 1 ",
    subtasks: [
      Subtask(description: "t1 s1", done: false, id: 1),
      Subtask(description: "t1 s2", done: true, id: 2)
    ],
    name: "fa task1",
    taskType: TaskType.DONE,
  ),
  Task(
    description: "task 2",
    subtasks: [
      Subtask(description: "t2 s1", done: true, id: 3),
      Subtask(description: "t2 s2", done: true, id: 4)
    ],
    name: "fa task2",
    taskType: TaskType.IN_PROGRESS,
  ),
  Task(
    description: "task 3",
    subtasks: [
      Subtask(description: "t3 s1", done: false, id: 5),
      Subtask(description: "t3 s2", done: false, id: 6)
    ],
    name: "fa task3",
    taskType: TaskType.TODO,
  ),
];

class ProgressScreen extends StatefulWidget {
  final User? user;
  const ProgressScreen({
    this.user,
    Key? key,
  }) : super(key: key);

  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends BaseRequestScreen<ProgressScreen> {
  late ProgressViewModel _viewModel;
  final List<Task> _tasks = tasks;
  TaskType _selectedFilter = TaskType.IN_PROGRESS;

  @override
  void initState() {
    super.initState();
    _viewModel = ProgressViewModel(
      Input(
        PublishSubject(),
        PublishSubject(),
      ),
    );

    _bindVM();
  }

  _bindVM() {
    disposeLater(
      _viewModel.output.onTaskTapped.listen(
        (task) {
          AppBottomModalSheet.displayModalBottomSheet(
            context,
            (context) => TaskDetailsScreen(task: task),
          );
        },
      ),
      // _viewModel.output.tasks.listen(
      //     (tasks){
      //       _tasks = tasks.value;
      //     }
      // )
    );
  }

  _onFilterChanged(TaskType type) {
    setState(() {
      _selectedFilter = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HelloAppBar(user: widget.user),
              const SizedBox(height: AppDimens.largePadding),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.regularPadding,
                ),
                child: Column(
                  children: [
                    TaskProgressCard(tasks: _tasks),
                    const SizedBox(height: AppDimens.largePadding),
                    const SizedBox(height: AppDimens.largePadding),
                    FiltersTab(
                      selectedFilter: _selectedFilter,
                      onTap: _onFilterChanged,
                    ),
                    const SizedBox(height: AppDimens.largePadding),
                    ..._tasks
                        .where((element) => element.taskType == _selectedFilter)
                        .map((e) => Column(
                              children: [
                                TaskListItemWidget(
                                  task: e,
                                  onTap: () =>
                                      _viewModel.input.taskTapped.add(e),
                                ),
                                const SizedBox(height: AppDimens.xSPadding)
                              ],
                            ))
                        .toList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
