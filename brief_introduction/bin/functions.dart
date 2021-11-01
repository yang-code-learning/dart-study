// ignore_for_file: prefer_function_declarations_over_variables, avoid_function_literals_in_foreach_calls

/* 0. Examples */
// an example of implementing a function
var _nobleGases = <int?>[];
bool isNoble1(int atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}

// the function still works if you omit the types
isNoble2(atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}

// can use a shorthand syntax
bool isNoble3(int atomicNumber) => _nobleGases[atomicNumber] != null;

/* 1. Parameters */
// When calling a function, specify named parameters using paramName: value
void enableFlags1({bool? bold, bool? hidden}) {}
// enableFlags(bold: true, hidden: false); // when calling

// can annotate them with required to indicate that the parameter is mandatory
void enableFlags2({bool? bold, required bool? hidden}) {}

/* Optional positional parameters */
String say1(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

/* 2. Default parameter values */
// Sets the [bold] and [hidden] flags ...
void enableFlags3({bool bold = false, bool hidden = false}) {
  print(42);
}
// bold will be true; hidden will be false.

/*  set default values for positional parameters */
String say(String from, String msg, [String device = 'carrier pigeon']) {
  var result = '$from says $msg with a $device';
  return result;
}

// can also pass lists or maps as default values
void doStuff(
    {List<int> list = const [1, 2, 3],
    Map<String, String> gifts = const {
      'first': 'paper',
      'second': 'cotton',
      'third': 'leather'
    }}) {
  print('list:  $list');
  print('gifts: $gifts');
}

/* 3. Functions as first-class objects */
void printElement(int element) {
  print(element);
}

var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';

/* 4. Anonymous functions */

/* 5. Lexical scope */
bool topLevel = true;

/* 6. Lexical closures */
Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}

/* 7. Testing functions for equality */
void foo1() {} // A top-level function

class A {
  static void bar() {} // A static method
  void baz() {} // An instance method
}

/* 8. Return values */
foo2() {} // If no return value is specified, the statement return null

void main(List<String> arguments) {
  /* 1. Parameters */
  // Optional positional parameter test
  assert(say1('Bob', 'Howdy') == 'Bob says Howdy');
  assert(say1('Bob', 'Howdy', 'smoke signal') ==
      'Bob says Howdy with a smoke signal');
  // Default parameter values test
  enableFlags3(bold: true);
  enableFlags3();
  assert(say('Bob', 'Howdy') == 'Bob says Howdy with a carrier pigeon');
  doStuff();

  /* 2. The main() function */
  // a simple main() function
  print('Hello, World!');
  // a command-line app that takes arguments
  print(arguments);
  assert(arguments.length == 2);
  assert(int.parse(arguments[0]) == 1);
  assert(arguments[1] == 'test');

  /* 3. Functions as first-class objects */
  // pass a function as a parameter
  var list1 = [1, 2, 3];
  list1.forEach(printElement);
  // assign a function to a variable
  assert(loudify('hello') == '!!! HELLO !!!');

  /* 4. Anonymous functions */
  const list2 = ['apples', 'bananas', 'oranges'];
  list2.forEach((item) {
    print('${list2.indexOf(item)}: $item');
  });
  // can shorten it using arrow notation
  list2.forEach((item) => print('${list2.indexOf(item)}: $item'));

  /* 5. Lexical scope */
  var insideMain = true;

  void myFunction() {
    var insideFunction = true;

    void nestedFunction() {
      var insideNestedFunction = true;

      assert(topLevel);
      assert(insideMain);
      assert(insideFunction);
      assert(insideNestedFunction);
    }
    nestedFunction();
  }
  myFunction();

  /* 6. Lexical closures */
  var add2 = makeAdder(2);
  var add4 = makeAdder(4);
  assert(add2(3) == 5);
  assert(add4(3) == 7);

  /* 7. Testing functions for equality */
  Function x;
  // Comparing top-level functions.
  x = foo1;
  assert(foo1 == x);

  // Comparing static methods.
  x = A.bar;
  assert(A.bar == x);

  // Comparing instance methods.
  var v = A(); // Instance #1 of A
  var w = A(); // Instance #2 of A
  var y = w;
  x = w.baz;
  assert(y.baz == x); // These closures refer to the same instance (#2),
  assert(v.baz != w.baz); // These closures refer to different instances,

  /* 8. Return values */
  assert(foo2() == null);
}
