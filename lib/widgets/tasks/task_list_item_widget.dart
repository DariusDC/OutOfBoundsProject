import 'package:flutter/material.dart';
import 'package:out_of_bounds/model/task/task.dart';
import 'package:out_of_bounds/model/task/task_type.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_dimens.dart';
import 'package:out_of_bounds/themes/app_text_styles.dart';

class TaskListItemWidget extends StatelessWidget {
  final Task task;

  const TaskListItemWidget({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.regularPadding),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.name, style: AppTextStyles.mediumBoldPoppins),
                  Text(
                    task.description.length > 50
                        ? task.description.substring(0, 50)
                        : task.description,
                    style: AppTextStyles.smallRegularPoppins,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Icon(Icons.arrow_right_outlined),
                Text(
                  "${task.subtasks.length.toString()}",
                  style: AppTextStyles.smallSemiBoldPoppins.copyWith(
                    color: getColorForTaskType(task.taskType),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Color getColorForTaskType(TaskType type) {
    switch (type) {
      case TaskType.IN_PROGRESS:
        return AppColors.green;
      case TaskType.DONE:
        return AppColors.darkGray;
      case TaskType.TODO:
        return AppColors.cyan;
    }
  }
}
