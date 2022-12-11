import 'package:out_of_bounds/model/task/task.dart';
import 'package:out_of_bounds/model/task/task_type.dart';

extension TaskListExtensions on List<Task> {
  double getPercentOfDoneTasks() {
    if (isEmpty) return 0;
    double count =
        where((element) => element.status == TaskType.DONE).length.toDouble();
    return (count / length.toDouble());
  }

  int countDoneTasks() =>
      where((element) => element.status == TaskType.DONE).length;
}
