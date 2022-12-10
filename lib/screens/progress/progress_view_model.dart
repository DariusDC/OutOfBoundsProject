class ProgressViewModel {
  final Input input;
  late Output output;

  ProgressViewModel(this.input) {
    output = Output();
  }
}

class Input {}

class Output {}
