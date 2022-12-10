import 'package:flutter/material.dart';
import 'package:out_of_bounds/model/task/task_type.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_dimens.dart';
import 'package:out_of_bounds/themes/app_text_styles.dart';

class FiltersTab extends StatelessWidget {
  final TaskType selectedFilter;
  final Function(TaskType) onTap;

  const FiltersTab(
      {Key? key, required this.selectedFilter, required this.onTap})
      : super(key: key);

  static const List<TaskType> _filterTypes = [
    TaskType.IN_PROGRESS,
    TaskType.TODO,
    TaskType.DONE
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            8,
          ),
        ),
        child: Container(
          color: AppColors.white,
          child: Row(
            children: FiltersTab._filterTypes
                .map(
                  (e) => getFilterCell(e),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget getFilterCell(TaskType type) {
    return Expanded(
      child: InkWell(
        onTap: () => onTap(type),
        child: Container(
          color: type == selectedFilter ? AppColors.darkBlue : AppColors.white,
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.smallPadding),
            child: Center(
              child: Text(
                type.getFilterText(),
                style: AppTextStyles.smallRegularPoppins.copyWith(
                    color: type == selectedFilter
                        ? AppColors.white
                        : AppColors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension FilterTypeExtension on TaskType {
  String getFilterText() {
    switch (this) {
      case TaskType.DONE:
        return "Done";
      case TaskType.IN_PROGRESS:
        return "In progress";
      case TaskType.TODO:
        return "Upcoming";
    }
  }
}
