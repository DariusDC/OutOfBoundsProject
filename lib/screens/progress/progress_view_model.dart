import 'package:out_of_bounds/model/task/task.dart';
import 'package:rxdart/rxdart.dart';

class ProgressViewModel {
  final Input input;
  late Output output;

  ProgressViewModel(this.input) {
    output = Output(
      input.taskTapped.map((event) => event).asBroadcastStream(),
    );
  }
}

class Input {
  final Subject<Task> taskTapped;

  Input(this.taskTapped);
}

class Output {
  final Stream<Task> onTaskTapped;

  Output(this.onTaskTapped);
}
