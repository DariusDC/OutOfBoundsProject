import 'package:out_of_bounds/model/task/task.dart';
import 'package:out_of_bounds/model/task/task_type.dart';
import 'package:out_of_bounds/model/ui_model.dart';
import 'package:out_of_bounds/repository/task_repo.dart';
import 'package:out_of_bounds/repository/user_repo.dart';
import 'package:rxdart/rxdart.dart';

class TaskDetailsViewModel {
  final Input input;
  late Output output;
  final TaskRepo _taskRepo;
  final UserRepo _userRepo;

  TaskDetailsViewModel(this.input, {TaskRepo? taskRepo, UserRepo? userRepo})
      : _taskRepo = taskRepo ?? TaskRepo(),
        _userRepo = userRepo ?? UserRepo() {
    output = Output(
      input.saveTask.flatMap(
        (event) {
          if (event.saveTaskType == SaveTaskType.START) {
            event.task.status = TaskType.IN_PROGRESS;
          }
          return _taskRepo.updateTask(event.task);
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
  final Stream<UIModel<bool>> onSaveTask;

  Output(this.onSaveTask);
}

enum SaveTaskType { START, SAVE }

class SaveTaskInput {
  final Task task;
  final SaveTaskType saveTaskType;

  SaveTaskInput({required this.task, required this.saveTaskType});
}
