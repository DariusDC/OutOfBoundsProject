import 'package:flutter/material.dart';
import 'package:out_of_bounds/model/task/subtask.dart';
import 'package:out_of_bounds/themes/app_dimens.dart';
import 'package:out_of_bounds/themes/app_text_styles.dart';

class TaskDetailsSubtaskWidget extends StatefulWidget {
  final Subtask subtask;
  final void Function(bool?) onSubtaskStatusChanged;
  final bool showCheckbox;

  const TaskDetailsSubtaskWidget(
      {Key? key,
      required this.subtask,
      required this.onSubtaskStatusChanged,
      required this.showCheckbox})
      : super(key: key);

  @override
  _TaskDetailsSubtaskWidgetState createState() =>
      _TaskDetailsSubtaskWidgetState();
}

class _TaskDetailsSubtaskWidgetState extends State<TaskDetailsSubtaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        constraints: const BoxConstraints(minHeight: 50),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppDimens.regularPadding),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.subtask.description ?? "",
                  style: AppTextStyles.mediumRegularPoppins,
                ),
              ),
              if (widget.showCheckbox)
                Checkbox(
                  value: widget.subtask.done,
                  onChanged: widget.onSubtaskStatusChanged,
                )
            ],
          ),
        ),
      ),
    );
  }
}
