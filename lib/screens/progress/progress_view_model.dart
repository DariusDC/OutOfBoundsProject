import 'package:out_of_bounds/model/task/task.dart';
import 'package:rxdart/rxdart.dart';

class ProgressViewModel {
  final Input input;
  late Output output;

  ProgressViewModel(this.input) {
    output = Output(
      input.taskTapped.map((event) => event).asBroadcastStream(),
      input.onInit.map((value) => []),
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
  final Stream<List<Task>> tasks;

  Output(
    this.onTaskTapped,
    this.tasks,
  );
}
