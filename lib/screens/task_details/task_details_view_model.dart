import 'package:out_of_bounds/model/task/task.dart';
import 'package:out_of_bounds/model/task/task_type.dart';
import 'package:out_of_bounds/model/ui_model.dart';
import 'package:rxdart/rxdart.dart';

class TaskDetailsViewModel {
  final Input input;
  late Output output;

  TaskDetailsViewModel(this.input) {
    output = Output(
      input.saveTask.map(
        (event) {
          print(event);
          return UIModel.success(
            Task(
                description: "description",
                subtasks: [],
                name: "",
                taskType: TaskType.IN_PROGRESS),
          );
        },
      ).asBroadcastStream(),
    );
  }
}

class Input {
  final Subject<SaveTaskInput> saveTask;

  Input(this.saveTask);
}

class Output {
  final Stream<UIModel<Task>> onSaveTask;

  Output(this.onSaveTask);
}

enum SaveTaskType { START, SAVE }

class SaveTaskInput {
  final Task task;
  final SaveTaskType saveTaskType;

  SaveTaskInput({required this.task, required this.saveTaskType});
}
