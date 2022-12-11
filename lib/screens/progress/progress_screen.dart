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
  List<Task> _tasks = [];
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
    );

    fetchData<List<Task>>(_viewModel.output.tasks, handleValue: (tasks) {
      setState(() {
        _tasks = tasks;
      });
    });
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
                    if (_tasks.isNotEmpty)
                      ..._tasks
                          .where(
                              (element) => element.status == _selectedFilter)
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
