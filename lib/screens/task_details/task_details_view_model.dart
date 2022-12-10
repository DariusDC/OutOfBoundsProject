class TaskDetailsViewModel {
  final Input input;
  late Output output;

  TaskDetailsViewModel(this.input) {
    output = Output();
  }
}

class Input {}

class Output {}
