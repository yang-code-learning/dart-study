class Person {
  void bringRainCoat() {
    print("Oh, I need to bring a rain coat before go out");
  }

  void wearJacket() {
    print("It's getting cold, I should wear a jacket");
  }
}

class Car {
  void putTopDown() {
    print("what is put top down");
  }
}

bool isRaining() {
  return false;
}

bool isSnowing() {
  return true;
}

void ifElseTest() {
  Person you = Person();
  Car car = Car();
  // conditions must use boolean values, nothing else
  if (isRaining()) {
    you.bringRainCoat();
  } else if (isSnowing()) {
    you.wearJacket();
  } else {
    car.putTopDown();
  }
}

void forLoopTest() {
  // standard for loop.
  var message = StringBuffer('Dart is fun');
  for (var i = 0; i < 5; i++) {
    message.write('!');
  }
  print(message);

  //  Dart’scapture the value of the index, avoiding a common pitfall
  //  In contrast, the example would print 2 and then 2 in JavaScript.
  var callbacks = [];
  for (var i = 0; i < 2; i++) {
    callbacks.add(() => print(i));
  }
  // ignore: avoid_function_literals_in_foreach_calls
  callbacks.forEach((c) => c());

  // you don’t need to know the current iteration counter
  var collection = [1, 2, 3];
  for (final item in collection) {
    print(item + 1);
  }
  // also have a forEach() method as another option
  collection.forEach(print); // 1 2 3
}

void whileTest() {
  // A while loop evaluates the condition before the loop
  var isDone = 0;
  while (isDone != 5) {
    print(isDone);
    isDone++;
  }

  // A do-while loop evaluates the condition after the loop
  var isFinished = 0;
  do {
    print(isFinished);
  } while (isFinished != 0);
}

class Candidate {
  String name = "guy";
  int yearsExperience = 0;
  void interview() {
    print("Hello, everybody, I'm $name");
  }
}

void breakContintueTest() {
  // Use break to stop looping
  var isDone = 0;
  while (true) {
    if (isDone == 5) break;
    print(isDone);
    isDone++;
  }

  // Use continue to skip to the next loop iteration
  var candidates = <Candidate>[
    Candidate(),
    Candidate()
      ..name = "dude"
      ..yearsExperience = 6
  ];

  for (int i = 0; i < candidates.length; i++) {
    var candidate = candidates[i];
    if (candidate.yearsExperience < 5) {
      continue;
    }
    candidate.interview();
  }
  // a different to write above code with Iterable
  candidates.where((c) => c.yearsExperience >= 5).forEach((c) => c.interview());
}

void switchCaseTest() {
  var command = 'CLOSED';
  switch (command) {
    case 'CLOSED':
      print("executeClosed()");
      continue nowClosed; // fall-through
    // Continues executing at the nowClosed label.
    case 'PENDING':
      print("executePending()");
      break;
    case 'APPROVED':
      print("executeApproved()");
      break;
    case 'DENIED':
      print("executeDenied()");
      break;
    case 'OPEN':
      print("executeOpen()");
      break;
    nowClosed:
    case 'NOW_CLOSED':
      // Runs for both CLOSED and NOW_CLOSED.
      print("executeNowClosed()");
      break;
    default:
      print("executeUnknown()");
  }
}

void assertTest() {
  var text = "non-null text";
  // Make sure the variable has a non-null value.
  assert(text != null);

  var number = 50;
  // Make sure the value is less than 100.
  assert(number < 100);

  var urlString = "https://dart.cn/guides/language/language-tour#assert";
  // Make sure this is an https URL.
  // attach a message to an assertion by adding a string as the second argument
  assert(urlString.startsWith('https'),
      'URL ($urlString) should start with "https".');
  
  /* 
   * 1. Flutter enables assertions in debug mode
   * 2. Development-only tools such as dartdevc typically enable assertions by default.
   * 3. ome tools, such as dart run and dart2js support assertions through 
   * a command-line flag: --enable-asserts.
   * 
   * 4. In production code, assertions are ignored, and the arguments to assert aren’t evaluated.
   */ 

}

void main(List<String> args) {
  // ifElseTest();
  // forLoopTest();
  // whileTest();
  // breakContintueTest();
  switchCaseTest();
}
