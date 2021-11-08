import 'todo.dart';

class Television {
  /// Use [turnOn] to turn the power on instead.
  @Deprecated('Use turnOn instead')
  void activate() {
    turnOn();
  }

  /// Turns the TV's power on.
  void turnOn() {
    // ···
  }
}

@Todo('seth', 'make this do something')
void doSomething() {
  print('do something');
}

void main(List<String> args) {
  Television television = Television();
  television.activate();
  doSomething();
}
