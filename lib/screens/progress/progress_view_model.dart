import 'package:out_of_bounds/model/task/task.dart';
import 'package:out_of_bounds/model/ui_model.dart';
import 'package:out_of_bounds/repository/task_repo.dart';
import 'package:out_of_bounds/repository/user_repo.dart';
import 'package:rxdart/rxdart.dart';

class ProgressViewModel {
  final Input input;
  late Output output;
  final TaskRepo _taskRepo;

  ProgressViewModel(this.input, {TaskRepo? taskRepo, UserRepo? userRepo})
      : _taskRepo = taskRepo ?? TaskRepo() {
    output = Output(
      input.taskTapped.map((event) => event).asBroadcastStream(),
      input.onInit.startWith(true).flatMap(
            (value) => _taskRepo.getTasks(),
          ),
    );
  }
}

class Input {
  final Subject<Task> taskTapped;
  final Subject<bool> onInit;

  Input(
    this.taskTapped,
    this.onInit,
  );
}

class Output {
  final Stream<Task> onTaskTapped;
  final Stream<UIModel<List<Task>>> tasks;

  Output(
    this.onTaskTapped,
    this.tasks,
  );
}
