class Food {
  /// ...
}

class Activity {
  /// ...
}

/// A domesticated South American camelid (Lama glama).
///
/// Andean cultures have used llamas as meat and pack
/// animals since pre-Hispanic times.
///
/// Just like any other animal, llamas need to eat,
/// so don't forget to [feed] them some [Food].
class Llama {
  String? name;

  /// Feeds your llama [food].
  ///
  /// The typical llama eats one bale of hay per week.
  void feed(Food food) {
    // ...
  }

  /// Exercises your llama with an [activity] for
  /// [timeLimit] minutes.
  void exercise(Activity activity, int timeLimit) {
    // ...
  }
}

void main(List<String> args) {
  /* 1. Single-line comments */
  // ignore: todo
  // TODO: refactor into an AbstractLlamaGreetingFactory?
  print('Welcome to my Llama farm!');

  /* 2. Multi-line comments */
  // Multi-line comments can nest
  /*
   * This is a lot of work. Consider raising chickens.

  Llama larry = Llama();
  larry.feed();
  larry.exercise();
  larry.clean();
   */

  /* 3. Documentation comments */
  // Inside a documentation comment, the analyzer 
  // ignores all text unless it is enclosed in brackets.
}
