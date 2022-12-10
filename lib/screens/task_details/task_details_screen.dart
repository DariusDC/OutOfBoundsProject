import 'package:flutter/material.dart';
import 'package:out_of_bounds/model/task/subtask.dart';
import 'package:out_of_bounds/model/task/task.dart';
import 'package:out_of_bounds/model/task/task_type.dart';
import 'package:out_of_bounds/screens/base_request_screen.dart';
import 'package:out_of_bounds/screens/task_details/task_details_view_model.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_dimens.dart';
import 'package:out_of_bounds/themes/app_text_styles.dart';
import 'package:out_of_bounds/widgets/app_divider.dart';
import 'package:out_of_bounds/widgets/buttons/general_button.dart';
import 'package:out_of_bounds/widgets/elements/dialog/bottom_sheet_top_widget.dart';
import 'package:out_of_bounds/widgets/task_details_widgets/task_details_subtask_widget.dart';
import 'package:rxdart/rxdart.dart';

class TaskDetailsScreen extends StatefulWidget {
  final Task task;

  const TaskDetailsScreen({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  _TaskDetailsScreenState createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends BaseRequestScreen<TaskDetailsScreen> {
  late TaskDetailsViewModel _viewModel;
  late Task _task;

  @override
  void initState() {
    super.initState();
    _task = widget.task;
    _viewModel = TaskDetailsViewModel(
      Input(
        PublishSubject(),
      ),
    );

    _bindUI();
  }

  _bindUI() {
    fetchData(
      _viewModel.output.onSaveTask,
      handleValue: (task) {},
      handleError: (error) {},
    );
  }

  _onSubtaskStatusChanged(Subtask subtask, bool value) {
    setState(() {
      int subtaskIndex =
          _task.subtasks.indexWhere((element) => element.id == subtask.id);
      if (subtaskIndex != -1) {
        _task.subtasks[subtaskIndex].done = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BottomSheetTopWidget(
            title: "Task details",
            dismissTap: () => Navigator.of(context).pop(),
          ),
          const AppDivider(),
          Padding(
            padding: const EdgeInsets.all(AppDimens.regularPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.task.name,
                  style: AppTextStyles.x5LBoldPoppins,
                ),
                const AppDivider(),
                const SizedBox(height: AppDimens.xSPadding),
                Text(
                  widget.task.description,
                  style: AppTextStyles.smallRegularPoppins.copyWith(
                    color: AppColors.darkGray,
                  ),
                ),
                const SizedBox(height: AppDimens.xSPadding),
                const AppDivider(),
                const SizedBox(height: AppDimens.regularPadding),
                const Text(
                  "Subtasks",
                  style: AppTextStyles.mediumSemiBoldPoppins,
                ),
                const SizedBox(height: AppDimens.smallPadding),
                ..._task.subtasks
                    .map((subtask) => Padding(
                          padding: const EdgeInsets.only(
                            bottom: AppDimens.smallPadding,
                          ),
                          child: TaskDetailsSubtaskWidget(
                            subtask: subtask,
                            onSubtaskStatusChanged: (value) =>
                                _onSubtaskStatusChanged(
                              subtask,
                              value ?? false,
                            ),
                            showCheckbox:
                                _task.taskType == TaskType.IN_PROGRESS,
                          ),
                        ))
                    .toList(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (widget.task.taskType == TaskType.TODO)
                      ElevatedButton(
                        onPressed: () => _viewModel.input.saveTask.add(
                          SaveTaskInput(
                            task: _task,
                            saveTaskType: SaveTaskType.START,
                          ),
                        ),
                        child: const Text("Start"),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5, left: 25),
                      child: ElevatedButton(
                        onPressed: () => _viewModel.input.saveTask.add(
                          SaveTaskInput(
                              task: _task, saveTaskType: SaveTaskType.SAVE),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.darkBlue),
                        child: const Text("Save"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
