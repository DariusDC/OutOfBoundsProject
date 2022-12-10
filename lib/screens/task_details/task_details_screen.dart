import 'package:flutter/material.dart';
import 'package:out_of_bounds/model/task/task.dart';
import 'package:out_of_bounds/themes/app_text_styles.dart';
import 'package:out_of_bounds/widgets/app_divider.dart';
import 'package:out_of_bounds/widgets/elements/dialog/bottom_sheet_top_widget.dart';

class TaskDetailsScreen extends StatefulWidget {
  final Task task;

  const TaskDetailsScreen({Key? key, required this.task}) : super(key: key);

  @override
  _TaskDetailsScreenState createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BottomSheetTopWidget(
          title: "Task details",
          dismissTap: () => Navigator.of(context).pop(),
        ),
        const AppDivider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.task.name,
              style: AppTextStyles.largeBoldPoppins,
            ),
          ],
        ),
      ],
    );
  }
}
