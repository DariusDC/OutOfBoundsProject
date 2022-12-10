import 'package:flutter/material.dart';
import 'package:out_of_bounds/extensions/task_extensions.dart';
import 'package:out_of_bounds/model/task/task.dart';
import 'package:out_of_bounds/themes/app_dimens.dart';
import 'package:out_of_bounds/themes/app_text_styles.dart';
import 'package:out_of_bounds/widgets/app_progress_bar.dart';

class TaskProgressCard extends StatefulWidget {
  final List<Task> tasks;

  const TaskProgressCard({Key? key, required this.tasks}) : super(key: key);

  @override
  _TaskProgressCardState createState() => _TaskProgressCardState();
}

class _TaskProgressCardState extends State<TaskProgressCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.regularPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Your progress",
                    style: AppTextStyles.largeBoldPoppins,
                  ),
                  const SizedBox(height: AppDimens.xxxSPadding),
                  Text(
                    "You have done ${widget.tasks.countDoneTasks()}/${widget.tasks.length} tasks.",
                    style: AppTextStyles.smallRegularPoppins,
                  )
                ],
              ),
              Flexible(
                child: AppProgressBar(
                  currentProgress: widget.tasks.getPercentOfDoneTasks(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
