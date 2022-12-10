import 'package:out_of_bounds/model/task/task.dart';
import 'package:out_of_bounds/model/task/task_type.dart';

extension TaskListExtensions on List<Task> {
  double getPercentOfDoneTasks() {
    double count =
        where((element) => element.taskType == TaskType.DONE).length.toDouble();
    return (count / length.toDouble());
  }

  int countDoneTasks() =>
      where((element) => element.taskType == TaskType.DONE).length;
}
