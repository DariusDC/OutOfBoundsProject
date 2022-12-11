class RootViewModel {
  final Input input;
  late Output output;

  RootViewModel(this.input) {
    output = Output();
  }
}

class Input {}

class Output {}
